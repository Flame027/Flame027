/*
*   $Id: e_vms.h,v 1.1 2013-01-23 21:17:47 cg Exp $
*
*   Copyright (c) 2002, Darren Hiebert
*
*   This source code is released for free distribution under the terms of the
*   GNU General Public License.
*
*   Configures ctags for VMS environment.
*/
#ifndef E_VMS_H
#define E_VMS_H

#define CASE_INSENSITIVE_FILENAMES 1
#define HAVE_STDLIB_H 1
#define HAVE_TIME_H 1
#ifdef VAXC
# define HAVE_STAT_H 1
# define HAVE_TYPES_H 1
#else
# define HAVE_FCNTL_H 1
# define HAVE_SYS_STAT_H 1
# define HAVE_SYS_TYPES_H 1
#endif
#define HAVE_CLOCK 1
#define HAVE_FGETPOS 1
#define HAVE_STRERROR 1
#define HAVE_STRSTR 1
#define HAVE_UNISTD_H 1

#endif
