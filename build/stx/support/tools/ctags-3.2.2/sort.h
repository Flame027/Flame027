/*****************************************************************************
*   $Id: sort.h,v 1.1 1999-07-10 18:42:19 cg Exp $
*
*   Copyright (c) 1998-1999, Darren Hiebert
*
*   This source code is released for free distribution under the terms of the
*   GNU General Public License.
*
*   External interface to sort.c
*****************************************************************************/
#ifndef _SORT_H
#define _SORT_H

/*============================================================================
=   Include files
============================================================================*/
#include "general.h"

/*============================================================================
=   Function prototypes
============================================================================*/
extern void catFile __ARGS((const char *const name));

#ifdef EXTERNAL_SORT
extern void externalSortTags __ARGS((const boolean toStdout));
#else
extern void internalSortTags __ARGS((const boolean toStdout));
#endif

#endif	/* _SORT_H */

/* vi:set tabstop=8 shiftwidth=4: */
