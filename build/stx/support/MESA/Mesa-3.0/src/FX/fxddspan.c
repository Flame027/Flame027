/* -*- mode: C; tab-width:8;  -*-

             fxdd.c - 3Dfx VooDoo Mesa span and pixel functions
*/

/*
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
 *
 * See the file fxapi.c for more informations about authors
 *
 */

#if defined(FX)

#include "fxdrv.h"

#ifdef _MSC_VER
#ifdef _WIN32
#pragma warning( disable : 4090 4022 )
/* 4101 : "different 'const' qualifier"
 * 4022 : "pointer mistmatch for actual parameter 'n'
 */
#endif
#endif

/************************************************************************/
/*****                    Span functions                            *****/
/************************************************************************/

static void fxDDWriteRGBASpan(const GLcontext *ctx, 
			      GLuint n, GLint x, GLint y,
			      const GLubyte rgba[][4], const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDWriteRGBASpan(...)\n");
#endif

  if (mask) {
    int span=0;

    for (i=0;i<n;i++) {
      if (mask[i]) {
	++span; 
      } else {
	if (span > 0) {	
          grLfbWriteRegion( fxMesa->currentFB, x+i-span, bottom-y,
                            GR_LFB_SRC_FMT_8888, span, 1, 0, (void *) rgba[i-span] );
	  span = 0;
	}
      }
    }

    if (span > 0)
      grLfbWriteRegion( fxMesa->currentFB, x+n-span, bottom-y,
			GR_LFB_SRC_FMT_8888, span, 1, 0, (void *) rgba[n-span] );
  } else
    grLfbWriteRegion( fxMesa->currentFB, x, bottom-y, GR_LFB_SRC_FMT_8888,
                      n, 1, 0, (void *) rgba );
}


static void fxDDWriteRGBSpan(const GLcontext *ctx, 
			     GLuint n, GLint x, GLint y,
			     const GLubyte rgb[][3], const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;
  GLubyte rgba[MAX_WIDTH][4];

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDWriteRGBSpan()\n");
#endif

  if (mask) {
    int span=0;

    for (i=0;i<n;i++) {
      if (mask[i]) {
	rgba[span][0] = rgb[i][0];
	rgba[span][1] = rgb[i][1];
	rgba[span][2] = rgb[i][2];
	rgba[span][3] = 255;
	++span;
      } else {
	if (span > 0) {
	  grLfbWriteRegion( fxMesa->currentFB, x+i-span, bottom-y,
	                    GR_LFB_SRC_FMT_8888, span, 1, 0, (void *) rgba );
	  span = 0;
	}
      }
    }

    if (span > 0)
      grLfbWriteRegion( fxMesa->currentFB, x+n-span, bottom-y,
			GR_LFB_SRC_FMT_8888, span, 1, 0, (void *) rgba );
  } else {
    for (i=0;i<n;i++) {
       rgba[i][0]=rgb[i][0];
       rgba[i][1]=rgb[i][1];
       rgba[i][2]=rgb[i][2];
       rgba[i][3]=255;
    }

    grLfbWriteRegion( fxMesa->currentFB, x, bottom-y, GR_LFB_SRC_FMT_8888,
                      n, 1, 0, (void *) rgba );
  }
}


static void fxDDWriteMonoRGBASpan(const GLcontext *ctx, 
				  GLuint n, GLint x, GLint y,
				  const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;
  GLuint data[MAX_WIDTH];

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDWriteMonoRGBASpan(...)\n");
#endif

  if (mask) {
    int span=0;

    for (i=0;i<n;i++) {
      if (mask[i]) {
	data[span] = (GLuint) fxMesa->color;
	++span;
      } else {
	if (span > 0) {
	  grLfbWriteRegion( fxMesa->currentFB, x+i-span, bottom-y,
			    GR_LFB_SRC_FMT_8888, span, 1, 0,
			    (void *) data );
	  span = 0;
	}
      }
    }

    if (span > 0)
      grLfbWriteRegion( fxMesa->currentFB, x+n-span, bottom-y,
			GR_LFB_SRC_FMT_8888, span, 1, 0,
			(void *) data );
  } else {
    for (i=0;i<n;i++) {
       data[i]=(GLuint) fxMesa->color;
    }

    grLfbWriteRegion( fxMesa->currentFB, x, bottom-y, GR_LFB_SRC_FMT_8888,
                      n, 1, 0, (void *) data );
  }
}


static void fxDDReadRGBASpan(const GLcontext *ctx, 
			     GLuint n, GLint x, GLint y, GLubyte rgba[][4])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLushort data[MAX_WIDTH];
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDReadRGBASpan(...)\n");
#endif

  assert(n < MAX_WIDTH);

  grLfbReadRegion( fxMesa->currentFB, x, bottom-y, n, 1, 0, data);
  for (i=0;i<n;i++) {
    rgba[i][RCOMP]=(data[i] & 0x001f) << 3;
    rgba[i][GCOMP]=(data[i] & 0x07e0) >> 3;
    rgba[i][BCOMP]=(data[i] & 0xf800) >> 8;
    rgba[i][ACOMP]=255;
  }
}

/************************************************************************/
/*****                    Pixel functions                           *****/
/************************************************************************/

static void fxDDWriteRGBAPixels(const GLcontext *ctx,
				GLuint n, const GLint x[], const GLint y[],
				CONST GLubyte rgba[][4], const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDWriteRGBAPixels(...)\n");
#endif

  for(i=0;i<n;i++)
    if(mask[i])
      grLfbWriteRegion(fxMesa->currentFB,x[i],bottom-y[i],
		       GR_LFB_SRC_FMT_8888,1,1,0,(void *) rgba[i]);
}

static void fxDDWriteMonoRGBAPixels(const GLcontext *ctx,
				    GLuint n, const GLint x[], const GLint y[],
				    const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDWriteMonoRGBAPixels(...)\n");
#endif

  for(i=0;i<n;i++)
    if(mask[i])
      grLfbWriteRegion(fxMesa->currentFB,x[i],bottom-y[i],
		       GR_LFB_SRC_FMT_8888,1,1,0,(void *) &fxMesa->color);
}

static void fxDDReadRGBAPixels(const GLcontext *ctx,
			       GLuint n, const GLint x[], const GLint y[],
			       GLubyte rgba[][4], const GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;
  GLushort data;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDReadRGBAPixels(...)\n");
#endif

  for(i=0;i<n;i++)
    if(mask[i]) {
      grLfbReadRegion(fxMesa->currentFB,x[i],bottom-y[i],1,1,0,&data);
      rgba[i][RCOMP]=(data & 0x001f) << 3;
      rgba[i][GCOMP]=(data & 0x07e0) >> 3;
      rgba[i][BCOMP]=(data & 0xf800) >> 8;

      /* the alpha value should be read from the auxiliary buffer when required */

      rgba[i][ACOMP]=255;
    }
}

/************************************************************************/
/*****                    Depth functions                           *****/
/************************************************************************/

static void fxDDReadDepthSpanFloat(GLcontext *ctx,
				   GLuint n, GLint x, GLint y, GLfloat depth[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;
  GLushort data[MAX_WIDTH];

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDReadDepthSpanFloat(...)\n");
#endif

  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x,bottom-y,n,1,0,data);

  /*
    convert the read values to float values [0.0 .. 1.0].
    */
  for(i=0;i<n;i++)
    depth[i]=data[i]/65535.0f;
}

static void fxDDReadDepthSpanInt(GLcontext *ctx,
				 GLuint n, GLint x, GLint y, GLdepth depth[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDReadDepthSpanInt(...)\n");
#endif

  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x,bottom-y,n,1,0,depth);
}

static GLuint fxDDDepthTestSpanGeneric(GLcontext *ctx,
				       GLuint n, GLint x, GLint y, const GLdepth z[],
				       GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLushort depthdata[MAX_WIDTH];
  GLdepth *zptr=depthdata;
  GLubyte *m=mask;
  GLuint i;
  GLuint passed=0;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDDepthTestSpanGeneric(...)\n");
#endif

  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x,bottom-y,n,1,0,depthdata);

  /* switch cases ordered from most frequent to less frequent */
  switch (ctx->Depth.Func) {
  case GL_LESS:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++,zptr++,m++) {
	if (*m) {
	  if (z[i] < *zptr) {
	    /* pass */
	    *zptr = z[i];
	    passed++;
	  } else {
	    /* fail */
	    *m = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++,zptr++,m++) {
	if (*m) {
	  if (z[i] < *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    }
    break;
  case GL_LEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] <= *zptr) {
	    *zptr = z[i];
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] <= *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    }
    break;
  case GL_GEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] >= *zptr) {
	    *zptr = z[i];
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] >= *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    }
    break;
  case GL_GREATER:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] > *zptr) {
	    *zptr = z[i];
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] > *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    }
    break;
  case GL_NOTEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] != *zptr) {
	    *zptr = z[i];
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] != *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m = 0;
	  }
	}
      }
    }
    break;
  case GL_EQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] == *zptr) {
	    *zptr = z[i];
	    passed++;
	  } else {
	    *m =0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  if (z[i] == *zptr) {
	    /* pass */
	    passed++;
	  } else {
	    *m =0;
	  }
	}
      }
    }
    break;
  case GL_ALWAYS:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0;i<n;i++,zptr++,m++) {
	if (*m) {
	  *zptr = z[i];
	  passed++;
	}
      }
    } else {
      /* Don't update Z buffer or mask */
      passed = n;
    }
    break;
  case GL_NEVER:
    for (i=0;i<n;i++) {
      mask[i] = 0;
    }
    break;
  default:
    ;
  } /*switch*/

  if(passed)
    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x,bottom-y,GR_LFB_SRC_FMT_ZA16,n,1,0,depthdata);

  return passed;
}

static void fxDDDepthTestPixelsGeneric(GLcontext* ctx,
				       GLuint n, const GLint x[], const GLint y[],
				       const GLdepth z[], GLubyte mask[])
{
  fxMesaContext fxMesa=(fxMesaContext)ctx->DriverCtx;
  GLdepth zval;
  GLuint i;
  GLint bottom=fxMesa->height-1;

#if defined(DEBUG_FXMESA)
  fprintf(stderr,"fxmesa: fxDDDepthTestPixelsGeneric(...)\n");
#endif

  /* switch cases ordered from most frequent to less frequent */
  switch (ctx->Depth.Func) {
  case GL_LESS:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] < zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] < zval) {
	    /* pass */
	  }
	  else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    }
    break;
  case GL_LEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] <= zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] <= zval) {
	    /* pass */
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    }
    break;
  case GL_GEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] >= zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] >= zval) {
	    /* pass */
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    }
    break;
  case GL_GREATER:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] > zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] > zval) {
	    /* pass */
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    }
    break;
  case GL_NOTEQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] != zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] != zval) {
	    /* pass */
	  }
	  else {
	    /* fail */
	    mask[i] = 0;
		  }
	}
      }
    }
    break;
  case GL_EQUAL:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] == zval) {
	    /* pass */
	    grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    } else {
      /* Don't update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbReadRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],1,1,0,&zval);
	  if (z[i] == zval) {
	    /* pass */
	  } else {
	    /* fail */
	    mask[i] = 0;
	  }
	}
      }
    }
    break;
  case GL_ALWAYS:
    if (ctx->Depth.Mask) {
      /* Update Z buffer */
      for (i=0; i<n; i++) {
	if (mask[i]) {
	  grLfbWriteRegion(GR_BUFFER_AUXBUFFER,x[i],bottom-y[i],GR_LFB_SRC_FMT_ZA16,1,1,0,&z[i]);
	}
      }
    } else {
      /* Don't update Z buffer or mask */
    }
    break;
  case GL_NEVER:
    /* depth test never passes */
    for (i=0;i<n;i++) {
      mask[i] = 0;
    }
    break;
  default:
    ;
  } /*switch*/
}

/************************************************************************/

void fxUpdateDDSpanPointers(GLcontext *ctx)
{
  ctx->Driver.DepthTestSpan=fxDDDepthTestSpanGeneric;
  ctx->Driver.DepthTestPixels=fxDDDepthTestPixelsGeneric;

  ctx->Driver.ReadDepthSpanFloat=fxDDReadDepthSpanFloat;
  ctx->Driver.ReadDepthSpanInt=fxDDReadDepthSpanInt;
}

void fxSetupDDSpanPointers(GLcontext *ctx)
{
  ctx->Driver.WriteRGBASpan       =fxDDWriteRGBASpan;
  ctx->Driver.WriteRGBSpan        =fxDDWriteRGBSpan;
  ctx->Driver.WriteMonoRGBASpan   =fxDDWriteMonoRGBASpan;
  ctx->Driver.WriteRGBAPixels     =fxDDWriteRGBAPixels;
  ctx->Driver.WriteMonoRGBAPixels =fxDDWriteMonoRGBAPixels;

  ctx->Driver.WriteCI8Span        =NULL;
  ctx->Driver.WriteCI32Span       =NULL;
  ctx->Driver.WriteMonoCISpan     =NULL;
  ctx->Driver.WriteCI32Pixels     =NULL;
  ctx->Driver.WriteMonoCIPixels   =NULL;

  ctx->Driver.ReadRGBASpan        =fxDDReadRGBASpan;
  ctx->Driver.ReadRGBAPixels      =fxDDReadRGBAPixels;

  ctx->Driver.ReadCI32Span        =NULL;
  ctx->Driver.ReadCI32Pixels      =NULL;
}


#else


/*
 * Need this to provide at least one external definition.
 */

int gl_fx_dummy_function_span(void)
{
  return 0;
}

#endif  /* FX */
