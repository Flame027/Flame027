/*****************************************************************************
*   $Id: sort.c,v 1.1 1999-07-10 18:42:19 cg Exp $
*
*   Copyright (c) 1996-1999, Darren Hiebert
*
*   This source code is released for free distribution under the terms of the
*   GNU General Public License.
*
*   This module contains functions to sort the tag entries.
*****************************************************************************/

/*============================================================================
=   Include files
============================================================================*/
#include "general.h"

#if defined(HAVE_STDLIB_H)
# include <stdlib.h>	/* to declare malloc() */
#endif
#include <string.h>
#include <stdio.h>

#include "debug.h"
#include "entry.h"
#include "main.h"
#include "options.h"
#include "read.h"
#include "sort.h"

/*============================================================================
=   Function prototypes
============================================================================*/
#ifndef EXTERNAL_SORT
static void failedSort __ARGS((FILE *const fp));
static int compareTags __ARGS((const void *const one, const void *const two));
static void writeSortedTags __ARGS((char **const table, const size_t numTags, const boolean toStdout));
#endif

/*============================================================================
=   Function definitions
============================================================================*/

extern void catFile( name )
    const char *const name;
{
    FILE *const fp = fopen(name, "r");

    if (fp != NULL)
    {
	int c;

	while ((c = getc(fp)) != EOF)
	    putchar(c);
	fflush(stdout);
	fclose(fp);
    }
}

#ifdef EXTERNAL_SORT

extern void externalSortTags( toStdout )
    const boolean toStdout;
{
    const char *const sortTemplate = "%s sort -u -o %s %s";
#ifndef NON_CONST_PUTENV_PROTOTYPE
    const
#endif
	  char *const sortOrder = "LC_COLLATE=C";
    const char *env = "";
    const size_t length	= strlen(sortOrder) + strlen(sortTemplate) +
	    			2 * strlen(tagFileName());
    char *const cmd = (char *)malloc(length);
    int ret;

    if (cmd == NULL)
	ret = -1;
    else
    {
	/*  Ensure ASCII value sort order.
	 */
#ifdef HAVE_PUTENV
	putenv(sortOrder);
#else
# ifdef HAVE_SETENV
	setenv("LC_COLLATE", "C", 1);
# else
	env = sortOrder;
# endif
#endif
	sprintf(cmd, sortTemplate, env, tagFileName(), tagFileName());
	ret = system(cmd);
	free(cmd);

    }
    if (ret != 0)
	error(FATAL | PERROR, "cannot sort tag file");
    else if (toStdout)
	catFile(tagFileName());
}

#else

/*----------------------------------------------------------------------------
 *  These functions provide a basic internal sort. No great memory
 *  optimization is performed (e.g. recursive subdivided sorts),
 *  so have lots of memory if you have large tag files.
 *--------------------------------------------------------------------------*/

static void failedSort( fp )
    FILE *const fp;
{
    if (fp != NULL)
	fclose(fp);
    error(FATAL | PERROR, "cannot sort tag file");
}

static int compareTags( one, two )
    const void *const one;
    const void *const two;
{
    const char *const line1 = *(const char *const *const)one;
    const char *const line2 = *(const char *const *const)two;

    return strcmp(line1, line2);
}

static void writeSortedTags( table, numTags, toStdout )
    char **const table;
    const size_t numTags;
    const boolean toStdout;
{
    FILE *fp;
    size_t i;

    /*	Write the sorted lines back into the tag file.
     */
    if (toStdout)
	fp = stdout;
    else
    {
	fp = fopen(tagFileName(), "w");
	if (fp == NULL)
	    failedSort(fp);
    }
    for (i = 0 ; i < numTags ; ++i)
    {
	/*  Here we filter out identical tag *lines* (including search
	 *  pattern) if this is not an xref file.
	 */
	if (i == 0  ||  Option.xref  ||  strcmp(table[i], table[i-1]) != 0)
	    if (fputs(table[i], fp) == EOF)
		failedSort(fp);
    }
    if (toStdout)
	fflush(fp);
    else
	fclose(fp);
}

extern void internalSortTags( toStdout )
    const boolean toStdout;
{
    vString *vLine = vStringNew();
    FILE *fp = NULL;
    const char *line;
    size_t i;

    /*	Allocate a table of line pointers to be sorted.
     */
    size_t numTags	= TagFile.numTags.added + TagFile.numTags.prev;
    const size_t tableSize = numTags * sizeof(char *);
    char **const table	= (char **)malloc(tableSize);	/* line pointers */
    DebugStatement( size_t mallocSize = tableSize; )	/* cumulative total */

    if (table == NULL)
	failedSort(fp);

    /*	Open the tag file and place its lines into allocated buffers.
     */
    fp = fopen(tagFileName(), "r");
    if (fp == NULL)
	failedSort(fp);
    for (i = 0  ;  i < numTags  &&  ! feof(fp)  ;  )
    {
	line = readLine(vLine, fp);
	if (line == NULL)
	{
	    if (! feof(fp))
		failedSort(fp);
	    break;
	}
	else if (*line == '\0'  ||  strcmp(line, "\n") == 0)
	    ;		/* ignore blank lines */
	else
	{
	    const size_t stringSize = strlen(line) + 1;

	    table[i] = (char *)malloc(stringSize);
	    if (table[i] == NULL)
		failedSort(fp);
	    DebugStatement( mallocSize += stringSize; )
	    strcpy(table[i], line);
	    ++i;
	}
    }
    numTags = i;
    fclose(fp);
    vStringDelete(vLine);

    /*	Sort the lines.
     */
    qsort(table, numTags, sizeof(*table),
	  (int (*)__ARGS((const void *, const void *)))compareTags);

    writeSortedTags(table, numTags, toStdout);

    DebugStatement( if (debug(DEBUG_STATUS))
			printf("sort memory: %ld bytes\n", (long)mallocSize); )
    for (i = 0 ; i < numTags ; ++i)
	free(table[i]);
    free(table);
}

#endif

/* vi:set tabstop=8 shiftwidth=4: */
