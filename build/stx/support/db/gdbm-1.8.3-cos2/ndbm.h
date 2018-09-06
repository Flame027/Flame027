/* ndbm.h  -  The include file for ndbm users.  */

/*  This file is part of GDBM, the GNU data base manager, by Philip A. Nelson.
    Copyright (C) 1990, 1991, 1993  Free Software Foundation, Inc.

    GDBM is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2, or (at your option)
    any later version.

    GDBM is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with GDBM; see the file COPYING.  If not, write to
    the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

    You may contact the author by:
       e-mail:  phil@cs.wwu.edu
      us-mail:  Philip A. Nelson
                Computer Science Department
                Western Washington University
                Bellingham, WA 98226

*************************************************************************/

/* Protection against multiple inclusions. */
#ifndef _NDBM_H_
#define _NDBM_H_

/* Determine if the C(++) compiler requires complete function prototypes. */
#ifndef __P
#if defined(__STDC__) || defined(__cplusplus) || defined(c_plusplus)
#define __P(args) args
#else
#define __P(args) ()
#endif
#endif


/* Parameters to dbm_store for simple insertion or replacement. */
#define  DBM_INSERT  0
#define  DBM_REPLACE 1


/* The data and key structure.  This structure is defined for compatibility. */
typedef struct {
	char *dptr;
	int   dsize;
      } datum;


/* The file information header. This is good enough for most applications. */
typedef struct {int dummy[10];} DBM;


/* These are the routines (with some macros defining them!) */

#ifdef __cplusplus
extern "C" {
#endif

extern DBM 	*dbm_open __P((const char *file, int flags, int mode));

extern void	 dbm_close __P((DBM *db));

extern datum	 dbm_fetch __P((DBM *db, datum key));

extern int	 dbm_store __P((DBM *db, datum key, datum content,
				int store_mode));

extern int	 dbm_delete __P((DBM *db, datum key));

extern datum	 dbm_firstkey __P((DBM *db));

extern datum	 dbm_nextkey __P((DBM *db));

#define		 dbm_error(dbf)  (0)

#define		 dbm_clearerr(dbf)

extern int	 dbm_dirfno __P((DBM *db));

extern int	 dbm_pagfno __P((DBM *db));

extern int	 dbm_rdonly __P((DBM *db));

#ifdef __cplusplus
}  /* extern "C" */
#endif

#endif
