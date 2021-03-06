/* $Id: rect.c,v 1.1 1998-10-05 22:32:58 cg Exp $ */

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
 * $Log: rect.c,v $
 * Revision 1.1  1998-10-05 22:32:58  cg
 * *** empty log message ***
 *
 * Revision 3.0  1998/01/31 21:02:29  brianp
 * initial rev
 *
 */


#ifdef PC_HEADER
#include "all.h"
#else
#include "context.h"
#include "macros.h"
#include "rect.h"
#include "vbfill.h"
#endif



/*
 * Execute a glRect*() function.
 */
void gl_Rectf( GLcontext *ctx, GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2 )
{
   /*
    * TODO: we could examine a bunch of state variables and ultimately
    * call the Driver->RectFunc() function to draw a screen-aligned
    * filled rectangle.  Someday...
    */

   if (INSIDE_BEGIN_END(ctx)) {
      gl_error( ctx, GL_INVALID_OPERATION, "glRect" );
      return;
   }
   gl_Begin( ctx, GL_QUADS );
   (*ctx->Exec.Vertex2f)( ctx, x1, y1 );
   (*ctx->Exec.Vertex2f)( ctx, x2, y1 );
   (*ctx->Exec.Vertex2f)( ctx, x2, y2 );
   (*ctx->Exec.Vertex2f)( ctx, x1, y2 );
   gl_End( ctx );
}
