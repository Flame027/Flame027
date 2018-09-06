/* fxwgl.c - Microsoft wgl functions emulation for
 *           3Dfx VooDoo/Mesa interface
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

#ifdef __WIN32__

#ifdef __cplusplus
extern "C" {
#endif
  
#include <GL/gl.h>
#include <GL/glu.h>
  
#ifdef __cplusplus
}
#endif

#include <stdio.h>
#include <windows.h>

#include <GL/fxmesa.h>

#include "fxdrv.h"

#define MAX_MESA_ATTRS  20

struct __extensions__
{
  PROC  proc;
  char  *name;
};

struct __pixelformat__
{
  PIXELFORMATDESCRIPTOR pfd;
  GLint mesaAttr[MAX_MESA_ATTRS];
};

WINGDIAPI void APIENTRY gl3DfxSetPaletteEXT(GLuint *);

static struct __extensions__   ext[] = {
  
#ifdef GL_EXT_polygon_offset
  {     (PROC)glPolygonOffsetEXT,               "glPolygonOffsetEXT"                    },
#endif
  {     (PROC)glBlendEquationEXT,               "glBlendEquationEXT"                    },
  {     (PROC)glBlendColorEXT,                  "glBlendColorExt"                       },
  {     (PROC)glVertexPointerEXT,               "glVertexPointerEXT"                    },
  {     (PROC)glNormalPointerEXT,               "glNormalPointerEXT"                    },
  {     (PROC)glColorPointerEXT,                "glColorPointerEXT"                     },
  {     (PROC)glIndexPointerEXT,                "glIndexPointerEXT"                     },
  {     (PROC)glTexCoordPointerEXT,             "glTexCoordPointer"                     },
  {     (PROC)glEdgeFlagPointerEXT,             "glEdgeFlagPointerEXT"                  },
  {     (PROC)glGetPointervEXT,                 "glGetPointervEXT"                      },
  {     (PROC)glArrayElementEXT,                "glArrayElementEXT"                     },
  {     (PROC)glDrawArraysEXT,                  "glDrawArrayEXT"                        },
  {     (PROC)glAreTexturesResidentEXT,		"glAreTexturesResidentEXT"              },
  {     (PROC)glBindTextureEXT,                 "glBindTextureEXT"                      },
  {     (PROC)glDeleteTexturesEXT,              "glDeleteTexturesEXT"                   },
  {     (PROC)glGenTexturesEXT,                 "glGenTexturesEXT"                      },
  {     (PROC)glIsTextureEXT,                   "glIsTextureEXT"                        },
  {     (PROC)glPrioritizeTexturesEXT,		"glPrioritizeTexturesEXT"               },
  {     (PROC)glCopyTexSubImage3DEXT,		"glCopyTexSubImage3DEXT"                },
  {     (PROC)glTexImage3DEXT,                  "glTexImage3DEXT"                       },
  {     (PROC)glTexSubImage3DEXT,               "glTexSubImage3DEXT"                    },
  {     (PROC)gl3DfxSetPaletteEXT,              "3DFX_set_global_palette"               }
  /*
  ,{     (PROC)glSelectTextureSGIS,              "glSelectTextureSGIS"                   },
  {     (PROC)glMultiTexCoord2fSGIS,            "glMTexCoord2fSGIS"                     },
  {     (PROC)glMultiTexCoord2fvSGIS,           "glMTexCoord2fvSGIS"                    }
  */
};

static int qt_ext = sizeof(ext) / sizeof(ext[0]);

struct __pixelformat__  pix[] =
{
  /* None */
  {     
    {       
      sizeof(PIXELFORMATDESCRIPTOR),  1,
      PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|
      PFD_DOUBLEBUFFER|PFD_SWAP_COPY,
      PFD_TYPE_RGBA,
      32,
      8,0,8,8,8,16,0,24,
      0,0,0,0,0,
      0,
      0,
      0,
      PFD_MAIN_PLANE,
      0,0,0,0       
    },
    {     
      FXMESA_DOUBLEBUFFER,
      FXMESA_ALPHA_SIZE,      0,
      FXMESA_DEPTH_SIZE,      0,
      FXMESA_STENCIL_SIZE,    0,
      FXMESA_ACCUM_SIZE,      0,
      FXMESA_NONE     
    }       
  },
  
  /* Alpha */
  {     
    {       
      sizeof(PIXELFORMATDESCRIPTOR),  1,
      PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|
      PFD_DOUBLEBUFFER|PFD_SWAP_COPY,
      PFD_TYPE_RGBA,
      32,
      8,0,8,8,8,16,8,24,
      0,0,0,0,0,
      0,
      0,
      0,
      PFD_MAIN_PLANE,
      0,0,0,0       
    },
    {     
      FXMESA_DOUBLEBUFFER,
      FXMESA_ALPHA_SIZE,      8,
      FXMESA_DEPTH_SIZE,      0,
      FXMESA_STENCIL_SIZE,    0,
      FXMESA_ACCUM_SIZE,      0,
      FXMESA_NONE     
    }       
  },
  
  /* Depth */
  {     
    {       
      sizeof(PIXELFORMATDESCRIPTOR),  1,
      PFD_DRAW_TO_WINDOW|PFD_SUPPORT_OPENGL|
      PFD_DOUBLEBUFFER|PFD_SWAP_COPY,
      PFD_TYPE_RGBA,
      32,
      8,0,8,8,8,16,0,24,
      0,0,0,0,0,
      16,
      0,
      0,
      PFD_MAIN_PLANE,
      0,0,0,0       
    },
    {     
      FXMESA_DOUBLEBUFFER,
      FXMESA_ALPHA_SIZE,      0,
      FXMESA_DEPTH_SIZE,      16,
      FXMESA_STENCIL_SIZE,    0,
      FXMESA_ACCUM_SIZE,      0,
      FXMESA_NONE     
    }       
  }
};
static int qt_pix = sizeof(pix) / sizeof(pix[0]);

static fxMesaContext ctx = NULL;
static WNDPROC hWNDOldProc;
static int curPFD = 0;
static HDC hDC;
static HWND hWND;

static GLboolean haveDualHead;

/* For the in-window-rendering hack */

static GLboolean   gdiWindowHack;
static GLboolean   gdiWindowHackEna;
static void        *dibSurfacePtr;
static BITMAPINFO  *dibBMI;
static HBITMAP     dibHBM;
static HWND        dibWnd;

LONG APIENTRY __wglMonitor(HWND hwnd,UINT message,UINT wParam,LONG lParam)
  
{
  long ret; /* Now gives the resized window at the end to hWNDOldProc */
  
  if(ctx && hwnd == hWND) {
    switch(message) {
    case WM_PAINT:
    case WM_MOVE:
          break;
    case WM_DISPLAYCHANGE:
    case WM_SIZE:
      if (wParam != SIZE_MINIMIZED) {
	static int moving = 0;
	if (!moving) {
	  if(fxQueryHardware()!=GR_SSTTYPE_VOODOO) {
	    if(!grSstControl(GR_CONTROL_RESIZE)) {
	      moving = 1;
	      SetWindowPos(hwnd, 0, 0, 0, 300, 300, SWP_NOMOVE|SWP_NOZORDER);
	      moving = 0;
	      if(!grSstControl(GR_CONTROL_RESIZE)) {
		/*MessageBox(0,_T("Error changing windowsize"),_T("fxMESA"),MB_OK);*/
		PostMessage(hWND,WM_CLOSE,0,0);
	      }
	    }
	  }

	  /* Do the clipping in the glide library */
	  grClipWindow(0,0,grSstScreenWidth(),grSstScreenHeight());
	  /* And let the new size set in the context */
	  fxMesaUpdateScreenSize(ctx);
	}
      }
      break;
    case WM_ACTIVATE:
      if((fxQueryHardware()==GR_SSTTYPE_VOODOO) &&
	 (!gdiWindowHack) &&
	 (!haveDualHead)) {
	WORD fActive = LOWORD(wParam);
	BOOL fMinimized = (BOOL) HIWORD(wParam);
	
	if((fActive == WA_INACTIVE) || fMinimized)
	  grSstControl(GR_CONTROL_DEACTIVATE);
	else
	  grSstControl(GR_CONTROL_ACTIVATE);
      }
      break;
    case WM_SHOWWINDOW:
      break;
    case WM_SYSCHAR:
      if(gdiWindowHackEna && (VK_RETURN == wParam)) {
	if(gdiWindowHack) {
	  gdiWindowHack = GL_FALSE;
	  grSstControl(GR_CONTROL_ACTIVATE);
	} else {
	  gdiWindowHack = GL_TRUE;
	  grSstControl(GR_CONTROL_DEACTIVATE);
	}
      }
      break;
    }
  }
  
  /* Finaly call the hWNDOldProc, which handles the resize witch the
     now changed window sizes */
  ret = (hWNDOldProc)(hwnd,message,wParam,lParam);
  return(ret);
}

BOOL APIENTRY wglCopyContext(HGLRC hglrcSrc,HGLRC hglrcDst,UINT mask)
{
  return(FALSE);
}

HGLRC APIENTRY wglCreateContext(HDC hdc)
{
  HWND hWnd;
  WNDPROC oldProc;
  int error;
  
  if(ctx) {
    SetLastError(0);
    return(NULL);
  }

  if(!(hWnd = WindowFromDC(hdc))) {
    SetLastError(0);
    return(NULL);
  }

  if(curPFD == 0) {
    SetLastError(0);
    return(NULL);
  }
  
  if((oldProc = (WNDPROC)GetWindowLong(hWnd,GWL_WNDPROC)) != __wglMonitor) {
    hWNDOldProc = oldProc;
    SetWindowLong(hWnd,GWL_WNDPROC,(LONG)__wglMonitor);
  }

#ifndef FX_SILENT
  fclose(stderr);
  fopen("MESA.LOG","w");
#endif

  ShowWindow(hWnd, SW_SHOWNORMAL);
  SetForegroundWindow(hWnd);
  Sleep(100); /* an hack for win95 */

  if(fxQueryHardware() == GR_SSTTYPE_VOODOO) {
    RECT cliRect;
      
    GetClientRect(hWnd,&cliRect);
    error = !(ctx = fxMesaCreateBestContext((GLuint)hWnd,cliRect.right,cliRect.bottom,
					    pix[curPFD - 1].mesaAttr));

    if(!error) {
      /* create the DIB section for windowed rendering */
      DWORD *p;

      dibWnd = hWnd;

      hDC = GetDC(dibWnd);

      dibBMI = (BITMAPINFO*) malloc( sizeof(BITMAPINFO) + (256*sizeof(RGBQUAD)));

      memset(dibBMI,0,sizeof(BITMAPINFO) + (256*sizeof(RGBQUAD)));

      dibBMI->bmiHeader.biSize			= sizeof(BITMAPINFOHEADER);
      dibBMI->bmiHeader.biWidth			= ctx->width;
      dibBMI->bmiHeader.biHeight		= -ctx->height;
      dibBMI->bmiHeader.biPlanes		= (short)1;
      dibBMI->bmiHeader.biBitCount		= (short)16;
      dibBMI->bmiHeader.biCompression		= BI_BITFIELDS;
      dibBMI->bmiHeader.biSizeImage		= 0;
      dibBMI->bmiHeader.biXPelsPerMeter	        = 0;
      dibBMI->bmiHeader.biYPelsPerMeter	        = 0;
      dibBMI->bmiHeader.biClrUsed		= 3;
      dibBMI->bmiHeader.biClrImportant		= 3;

      p = (DWORD*)dibBMI->bmiColors;
      p[0] = 0x001F;
      p[1] = 0x07E0;
      p[2] = 0xF800;

      dibHBM = CreateDIBSection(hDC, dibBMI, DIB_RGB_COLORS, &dibSurfacePtr, NULL, 0);

      ReleaseDC(dibWnd, hDC);

      gdiWindowHackEna = (dibHBM != NULL ? GL_TRUE : GL_FALSE);

      if (!getenv("MESA_WGL_FX") || !strcmp(getenv("MESA_WGL_FX"),"fullscreen"))
	gdiWindowHack = GL_FALSE;
      else {
	gdiWindowHack = GL_TRUE;
	grSstControl(GR_CONTROL_DEACTIVATE);
      }
    }
  } else {
    /* For the Voodoo Rush */

    if(getenv("MESA_WGL_FX") && !strcmp(getenv("MESA_WGL_FX"),"fullscreen")) {
      RECT cliRect;
      
      GetClientRect(hWnd,&cliRect);
      error = !(ctx = fxMesaCreateBestContext((GLuint)hWnd,cliRect.right,cliRect.bottom,
					      pix[curPFD - 1].mesaAttr));
    } else
      error = !(ctx = fxMesaCreateContext((GLuint)hWnd,GR_RESOLUTION_NONE,GR_REFRESH_75Hz,
					  pix[curPFD - 1].mesaAttr));
  }

  if(getenv("SST_DUALHEAD"))
    haveDualHead=((atoi(getenv("SST_DUALHEAD"))==1) ? GL_TRUE:GL_FALSE);
  else
    haveDualHead=GL_FALSE;

  if(error) {
    SetLastError(0);
    return(NULL);
  }

  hDC = hdc;
  hWND = hWnd;

  /* Required by the OpenGL Optimizer 1.1 (is it a Optimizer bug ?) */
  wglMakeCurrent(hdc,(HGLRC)1);

  return((HGLRC)1);
}

HGLRC APIENTRY wglCreateLayerContext(HDC hdc,int iLayerPlane)
{
  SetLastError(0);
  return(NULL);
}

BOOL APIENTRY wglDeleteContext(HGLRC hglrc)
{
  if(ctx && hglrc == (HGLRC)1) {
    if (gdiWindowHackEna) {
      DeleteObject(dibHBM);
      free(dibBMI);

      dibSurfacePtr = NULL;
      dibBMI = NULL;
      dibHBM = NULL;
      dibWnd = NULL;
    }

    fxMesaDestroyContext(ctx);

    SetWindowLong(WindowFromDC(hDC),GWL_WNDPROC,(LONG)hWNDOldProc);

    ctx = NULL;
    hDC = 0;
    return(TRUE);
  }

  SetLastError(0);

  return(FALSE);
}

HGLRC APIENTRY wglGetCurrentContext(VOID)
{
  if(ctx)
    return((HGLRC)1);

  SetLastError(0);
  return(NULL);
}

HDC APIENTRY wglGetCurrentDC(VOID)
{
  if(ctx)
    return(hDC);
  
  SetLastError(0);
  return(NULL);
}

PROC APIENTRY wglGetProcAddress(LPCSTR lpszProc)
{
  int           i;
  
  /*fprintf(stderr,"fxMesa: looking for extension %s\n",lpszProc);
    fflush(stderr);*/
  
  for(i = 0;i < qt_ext;i++)
    if(!strcmp(lpszProc,ext[i].name)) {
      /*fprintf(stderr,"fxMesa: found extension %s\n",lpszProc);
	fflush(stderr);*/
      
      return(ext[i].proc);
    }
  SetLastError(0);
  return(NULL);
}

BOOL APIENTRY wglMakeCurrent(HDC hdc,HGLRC hglrc)
{
  if((hdc==NULL) && (hglrc==NULL))
    return(TRUE);

  if(!ctx || hglrc != (HGLRC)1 || WindowFromDC(hdc) != hWND) {
    SetLastError(0);
    return(FALSE);
  }

  hDC = hdc;
  
  fxMesaMakeCurrent(ctx);
  
  return(TRUE);
}

BOOL APIENTRY wglShareLists(HGLRC hglrc1,HGLRC hglrc2)
{
  if(!ctx || hglrc1 != (HGLRC)1 || hglrc1 != hglrc2) {
    SetLastError(0);
    return(FALSE);
  }

  return(TRUE);
}

BOOL APIENTRY wglUseFontBitmaps(HDC fontDevice, DWORD firstChar, DWORD numChars, DWORD listBase)
{
#define VERIFY(a) a

  TEXTMETRIC metric;
  BITMAPINFO *dibInfo;
  HDC bitDevice;
  COLORREF tempColor;
  int i;

  VERIFY(GetTextMetrics(fontDevice, &metric));
  
  dibInfo = (BITMAPINFO *) calloc(sizeof(BITMAPINFO) + sizeof(RGBQUAD), 1);
  dibInfo->bmiHeader.biSize = sizeof(BITMAPINFOHEADER);
  dibInfo->bmiHeader.biPlanes = 1;
  dibInfo->bmiHeader.biBitCount = 1;
  dibInfo->bmiHeader.biCompression = BI_RGB;

  bitDevice = CreateCompatibleDC(fontDevice);
  // HDC bitDevice = CreateDC("DISPLAY", NULL, NULL, NULL);
  // VERIFY(bitDevice);

  // Swap fore and back colors so the bitmap has the right polarity
  tempColor = GetBkColor(bitDevice);
  SetBkColor(bitDevice, GetTextColor(bitDevice));
  SetTextColor(bitDevice, tempColor);
  
  // Place chars based on base line
  VERIFY(SetTextAlign(bitDevice, TA_BASELINE) >= 0);
  
  for(i = 0; i < numChars; i++) {
      SIZE size;
      char curChar;
      int charWidth,charHeight,bmapWidth,bmapHeight,numBytes,res;
      HBITMAP bitObject;
      HGDIOBJ origBmap;
      unsigned char *bmap;
      
      curChar = i + firstChar;
      
      // Find how high/wide this character is
      VERIFY(GetTextExtentPoint32(bitDevice, &curChar, 1, &size));

      // Create the output bitmap
      charWidth = size.cx;
	  charHeight = size.cy;
      bmapWidth = ((charWidth + 31) / 32) * 32;   // Round up to the next multiple of 32 bits
      bmapHeight = charHeight;
      bitObject = CreateCompatibleBitmap(bitDevice,
		  bmapWidth,
		  bmapHeight);
      //VERIFY(bitObject);

      // Assign the output bitmap to the device
      origBmap = SelectObject(bitDevice, bitObject);
      VERIFY(origBmap);

      VERIFY( PatBlt( bitDevice, 0, 0, bmapWidth, bmapHeight,BLACKNESS ) );

      // Use our source font on the device
      VERIFY(SelectObject(bitDevice, GetCurrentObject(fontDevice,OBJ_FONT)));

      // Draw the character
      VERIFY(TextOut(bitDevice, 0, metric.tmAscent, &curChar, 1));
      
      // Unselect our bmap object
      VERIFY(SelectObject(bitDevice, origBmap));
      
      // Convert the display dependant representation to a 1 bit deep DIB
      numBytes = (bmapWidth * bmapHeight) / 8;
      bmap = malloc(numBytes);
      dibInfo->bmiHeader.biWidth = bmapWidth;
      dibInfo->bmiHeader.biHeight = bmapHeight;
      res = GetDIBits(bitDevice, bitObject, 0, bmapHeight, bmap,
		  dibInfo,
		  DIB_RGB_COLORS);
      //VERIFY(res);

      // Create the GL object
      glNewList(i + listBase, GL_COMPILE);
      glBitmap(bmapWidth, bmapHeight, 0.0, metric.tmDescent,
	       charWidth, 0.0,
	       bmap);
      glEndList();
      // CheckGL();

      // Destroy the bmap object
      DeleteObject(bitObject);

      // Deallocate the bitmap data
      free(bmap);
  }

  // Destroy the DC
  VERIFY(DeleteDC(bitDevice));

  free(dibInfo);

  return TRUE;
#undef VERIFY
}

BOOL APIENTRY wglUseFontBitmapsW(HDC hdc,DWORD first,DWORD count,DWORD listBase)
{
  return(FALSE);
}

BOOL APIENTRY wglUseFontOutlinesA(HDC hdc,DWORD first,DWORD count,
                                  DWORD listBase,FLOAT deviation,
                                  FLOAT extrusion,int format,
                                  LPGLYPHMETRICSFLOAT lpgmf)
{
  SetLastError(0);
  return(FALSE);
}

BOOL APIENTRY wglUseFontOutlinesW(HDC hdc,DWORD first,DWORD count,
                                  DWORD listBase,FLOAT deviation,
                                  FLOAT extrusion,int format,
                                  LPGLYPHMETRICSFLOAT lpgmf)
{
  SetLastError(0);
  return(FALSE);
}


BOOL APIENTRY wglSwapLayerBuffers(HDC hdc,UINT fuPlanes)
{
  if(ctx && WindowFromDC(hdc) == hWND) {
    fxMesaSwapBuffers();
    
    return(TRUE);
  }

  SetLastError(0);
  return(FALSE);
}

int APIENTRY wglChoosePixelFormat(HDC hdc,
                                  CONST PIXELFORMATDESCRIPTOR *ppfd)
{
  int i,best=-1,qt_valid_pix;
  
  qt_valid_pix = qt_pix;
  
  if(ppfd->nSize != sizeof(PIXELFORMATDESCRIPTOR) || ppfd->nVersion != 1) {
    SetLastError(0);
    return(0);
  }

  for(i = 0;i < qt_valid_pix;i++) {
    if((ppfd->dwFlags & PFD_DRAW_TO_WINDOW) && !(pix[i].pfd.dwFlags & PFD_DRAW_TO_WINDOW))
      continue;
    if((ppfd->dwFlags & PFD_DRAW_TO_BITMAP) && !(pix[i].pfd.dwFlags & PFD_DRAW_TO_BITMAP))
      continue;
    if((ppfd->dwFlags & PFD_SUPPORT_GDI) && !(pix[i].pfd.dwFlags & PFD_SUPPORT_GDI))
      continue;
    if((ppfd->dwFlags & PFD_SUPPORT_OPENGL) && !(pix[i].pfd.dwFlags & PFD_SUPPORT_OPENGL))
      continue;
    if(!(ppfd->dwFlags & PFD_DOUBLEBUFFER_DONTCARE) &&
       ((ppfd->dwFlags & PFD_DOUBLEBUFFER) != (pix[i].pfd.dwFlags & PFD_DOUBLEBUFFER)))
      continue;
    if(!(ppfd->dwFlags & PFD_STEREO_DONTCARE) &&
       ((ppfd->dwFlags & PFD_STEREO) != (pix[i].pfd.dwFlags & PFD_STEREO)))
      continue;
      
    if (ppfd->cDepthBits > 0 && pix[i].pfd.cDepthBits == 0)
      continue; /* need depth buffer */
      
    if (ppfd->cAlphaBits > 0 && pix[i].pfd.cAlphaBits == 0)
      continue; /* need alpha buffer */
      
    if(ppfd->iPixelType == pix[i].pfd.iPixelType) {
      best = i + 1;
      break;
    }
  }

  if(best == -1) {
    SetLastError(0);
    return(0);
  }
  
  return(best);
}

int APIENTRY ChoosePixelFormat(HDC hdc,
			       CONST PIXELFORMATDESCRIPTOR *ppfd)
{
  return wglChoosePixelFormat(hdc,ppfd);
}

int APIENTRY wglDescribePixelFormat(HDC hdc,int iPixelFormat,UINT nBytes,
                                    LPPIXELFORMATDESCRIPTOR ppfd)
{
  int qt_valid_pix;
  
  qt_valid_pix = qt_pix;
  
  if(iPixelFormat < 1 || iPixelFormat > qt_valid_pix ||
    ((nBytes != sizeof(PIXELFORMATDESCRIPTOR)) && (nBytes != 0))) {
    SetLastError(0);
    return(0);
  }

  if(nBytes != 0)
    *ppfd = pix[iPixelFormat - 1].pfd;

  return(qt_valid_pix);
}

int APIENTRY DescribePixelFormat(HDC hdc,int iPixelFormat,UINT nBytes,
				 LPPIXELFORMATDESCRIPTOR ppfd)
{
  return wglDescribePixelFormat(hdc,iPixelFormat,nBytes,ppfd);
}

int APIENTRY wglGetPixelFormat(HDC hdc)
{
  if(curPFD == 0) {
    SetLastError(0);
    return(0);
  }

  return(curPFD);
}

int APIENTRY GetPixelFormat(HDC hdc)
{
  return wglGetPixelFormat(hdc);
}

BOOL APIENTRY wglSetPixelFormat(HDC hdc,int iPixelFormat,
                                CONST PIXELFORMATDESCRIPTOR *ppfd)
{
  int qt_valid_pix;
  
  qt_valid_pix = qt_pix;
  
  if(iPixelFormat < 1 || iPixelFormat > qt_valid_pix || ppfd->nSize != sizeof(PIXELFORMATDESCRIPTOR)) {
    SetLastError(0);
    return(FALSE);
  }
  curPFD = iPixelFormat;

  return(TRUE);
}

BOOL APIENTRY wglSwapBuffers(HDC hdc)
{
  if(!ctx) {
    SetLastError(0);
    return(FALSE);
  }
  
  fxMesaSwapBuffers();

  if(gdiWindowHack) {
    GLuint width=ctx->width;
	GLuint height=ctx->height;

    HDC hdcScreen      = GetDC(dibWnd);
    HDC hdcDIBSection  = CreateCompatibleDC(hdcScreen);
    HBITMAP holdBitmap = (HBITMAP) SelectObject(hdcDIBSection, dibHBM);


    grLfbReadRegion(GR_BUFFER_FRONTBUFFER, 0, 0,
		    width, height,
		    width * 2,
		    dibSurfacePtr);

    BitBlt(hdcScreen, 0, 0,
	   width, height,
	   hdcDIBSection,
	   0, 0, SRCCOPY);

    ReleaseDC(dibWnd, hdcScreen);
    SelectObject(hdcDIBSection, holdBitmap);
    DeleteDC(hdcDIBSection);
  }

  return(TRUE);
}

BOOL APIENTRY SetPixelFormat(HDC hdc, int iPixelFormat,
                             CONST PIXELFORMATDESCRIPTOR *ppfd)
{
  return wglSetPixelFormat(hdc,iPixelFormat,ppfd);
}

BOOL APIENTRY SwapBuffers(HDC hdc)
{
  return wglSwapBuffers(hdc);
}

#endif /* FX */

