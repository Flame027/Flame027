/* $Id: attrib.h,v 1.1 1998-10-05 22:31:20 cg Exp $ */

/*
 * Mesa 3-D graphics library
 * Version:  3.0
 * Copyright (C) 1995-1998  Brian Paul
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the Free
 * Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
 */


/*
 * $Log: attrib.h,v $
 * Revision 1.1  1998-10-05 22:31:20  cg
 * *** empty log message ***
 *
 * Revision 3.0  1998/01/31 20:44:48  brianp
 * initial rev
 *
 */


#ifndef ATTRIB_H
#define ATTRIB_h


#include "types.h"


extern void gl_PushAttrib( GLcontext* ctx, GLbitfield mask );

extern void gl_PopAttrib( GLcontext* ctx );

extern void gl_PushClientAttrib( GLcontext *ctx, GLbitfield mask );

extern void gl_PopClientAttrib( GLcontext *ctx );


#endif
