/* $Id: colortab.h,v 1.1 1998-10-05 22:31:25 cg Exp $ */

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
 * $Log: colortab.h,v $
 * Revision 1.1  1998-10-05 22:31:25  cg
 * *** empty log message ***
 *
 * Revision 3.0  1998/01/31 20:48:30  brianp
 * initial rev
 *
 */


#ifndef COLORTAB_H
#define COLORTAB_H


#include "types.h"


extern void gl_ColorTable( GLcontext *ctx, GLenum target,
                           GLenum internalformat,
                           struct gl_image *table );

extern void gl_ColorSubTable( GLcontext *ctx, GLenum target,
                              GLsizei start, struct gl_image *data );

extern void gl_GetColorTable( GLcontext *ctx, GLenum target, GLenum format,
                              GLenum type, GLvoid *table );

extern void gl_GetColorTableParameterfv( GLcontext *ctx, GLenum target,
                                         GLenum pname, GLfloat *params );

extern void gl_GetColorTableParameteriv( GLcontext *ctx, GLenum target,
                                         GLenum pname, GLint *params );


#endif
