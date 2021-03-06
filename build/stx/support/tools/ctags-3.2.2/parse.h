/*****************************************************************************
*   $Id: parse.h,v 1.1 1999-07-10 18:42:19 cg Exp $
*
*   Copyright (c) 1998-1999, Darren Hiebert
*
*   This source code is released for free distribution under the terms of the
*   GNU General Public License.
*
*   External interface to all language parsing modules.
*****************************************************************************/
#ifndef _PARSE_H
#define _PARSE_H

/*============================================================================
=   Include files
============================================================================*/
#include "general.h"

/*============================================================================
=   Function prototypes
============================================================================*/
extern boolean createCTags __ARGS((const unsigned int passCount));
extern boolean createEiffelTags __ARGS((void));
extern boolean createFortranTags __ARGS((const unsigned int passCount));

#endif	/* _PARSE_H */

/* vi:set tabstop=8 shiftwidth=4: */
