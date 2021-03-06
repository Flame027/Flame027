#ifdef __VMS__

# define XAllocColor XALLOCCOLOR 
# define XAllocColorCells XALLOCCOLORCELLS 
# define XAllowEvents XALLOWEVENTS 
# define XBell XBELL 
# define XChangeGC XCHANGEGC 
# define XChangeProperty XCHANGEPROPERTY 
# define XChangeWindowAttributes XCHANGEWINDOWATTRIBUTES 
# define XCheckMaskEvent XCHECKMASKEVENT 
# define XCheckWindowEvent XCHECKWINDOWEVENT 
# define XClearArea XCLEARAREA 
# define XClearWindow XCLEARWINDOW 
# define XCloseDisplay XCLOSEDISPLAY 
# define XConfigureWindow XCONFIGUREWINDOW 
# define XConvertSelection XCONVERTSELECTION 
# define XCopyArea XCOPYAREA 
# define XCopyPlane XCOPYPLANE 
# define XCreateBitmapFromData XCREATEBITMAPFROMDATA 
# define XCreateFontCursor XCREATEFONTCURSOR 
# define XCreateGC XCREATEGC 
# define XCreateImage XCREATEIMAGE 
# define XCreatePixmap XCREATEPIXMAP 
# define XCreatePixmapCursor XCREATEPIXMAPCURSOR 
# define XCreateSimpleWindow XCREATESIMPLEWINDOW 
# define XCreateWindow XCREATEWINDOW 
# define XDefaultGC XDEFAULTGC 
# define XDefineCursor XDEFINECURSOR 
# define XDestroyWindow XDESTROYWINDOW 
# define XDrawArc	XDRAWARC
# define XDrawImageString XDRAWIMAGESTRING 
# define XDrawImageString16 XDRAWIMAGESTRING16 
# define XDrawPoint	XDRAWPOINT
# define XDrawLine	XDRAWLINE
# define XDrawLines XDRAWLINES 
# define XDrawRectangle XDRAWRECTANGLE 
# define XDrawString XDRAWSTRING 
# define XDrawString16 XDRAWSTRING16 
# define XEventsQueued XEVENTSQUEUED 
# define XFillArc XFILLARC 
# define XFillPolygon XFILLPOLYGON 
# define XFillRectangle XFILLRECTANGLE 
# define XFlush XFLUSH 
# define XFree XFREE 
# define XFreeColors XFREECOLORS 
# define XFreeCursor XFREECURSOR 
# define XFreeFont XFREEFONT 
# define XFreeFontNames XFREEFONTNAMES 
# define XFreeGC XFREEGC 
# define XFreeModifiermap XFREEMODIFIERMAP 
# define XFreePixmap XFREEPIXMAP 
# define XGetAtomName XGETATOMNAME 
# define XGetDefault XGETDEFAULT 
# define XGetErrorText XGETERRORTEXT 
# define XGetGeometry XGETGEOMETRY 
# define XGetIconSizes XGETICONSIZES 
# define XGetImage XGETIMAGE 
# define XGetKeyboardMapping XGETKEYBOARDMAPPING 
# define XGetModifierMapping XGETMODIFIERMAPPING 
# define XGetSelectionOwner XGETSELECTIONOWNER 
# define XGetVisualInfo XGETVISUALINFO 
# define XGetWindowAttributes XGETWINDOWATTRIBUTES 
# define XGetWindowProperty XGETWINDOWPROPERTY 
# define XGrabKeyboard XGRABKEYBOARD 
# define XGrabPointer XGRABPOINTER 
# define XInternAtom XINTERNATOM 
# define XKeycodeToKeysym XKEYCODETOKEYSYM 
# define XKeysymToKeycode XKEYSYMTOKEYCODE 
# define XKeysymToString XKEYSYMTOSTRING 
# define XListFonts XLISTFONTS 
# define XLoadFont XLOADFONT 
# define XLoadQueryFont XLOADQUERYFONT 
# define XLookupString XLOOKUPSTRING 
# define XLowerWindow XLOWERWINDOW 
# define XMapWindow XMAPWINDOW 
# define XMapRaised XMAPRAISED 
# define XMatchVisualInfo XMATCHVISUALINFO 
# define XMoveResizeWindow XMOVERESIZEWINDOW 
# define XMoveWindow XMOVEWINDOW 
# define XNextEvent XNEXTEVENT 
# define XOpenDisplay XOPENDISPLAY 
# define XParseColor XPARSECOLOR 
# define XParseGeometry XPARSEGEOMETRY 
# define XPending XPENDING 
# define XProtocolVersion XPROTOCOLVERSION 
# define XPutBackEvent XPUTBACKEVENT 
# define XPutImage XPUTIMAGE 
# define XQueryColor XQUERYCOLOR 
# define XQueryColors XQUERYCOLORS 
# define XQueryExtension XQUERYEXTENSION 
# define XQueryPointer XQUERYPOINTER 
# define XQueryTree XQUERYTREE 
# define XRaiseWindow XRAISEWINDOW 
# define XReadBitmapFile XREADBITMAPFILE 
# define XRecolorCursor XRECOLORCURSOR 
# define XRefreshKeyboardMapping XREFRESHKEYBOARDMAPPING 
# define XResizeWindow XRESIZEWINDOW 
# define XSelectInput XSELECTINPUT 
# define XSendEvent XSENDEVENT 
# define XServerVendor XSERVERVENDOR 
# define XSetBackground XSETBACKGROUND 
# define XSetClassHint XSETCLASSHINT 
# define XSetClipRectangles XSETCLIPRECTANGLES 
# define XSetDashes XSETDASHES 
# define XSetErrorHandler XSETERRORHANDLER 
# define XSetFillStyle XSETFILLSTYLE 
# define XSetFont XSETFONT 
# define XSetForeground XSETFOREGROUND 
# define XSetFunction XSETFUNCTION 
# define XSetGraphicsExposures XSETGRAPHICSEXPOSURES 
# define XSetIOErrorHandler XSETIOERRORHANDLER 
# define XSetIconName XSETICONNAME 
# define XSetInputFocus XSETINPUTFOCUS 
# define XSetLineAttributes XSETLINEATTRIBUTES 
# define XSetNormalHints XSETNORMALHINTS 
# define XSetSelectionOwner XSETSELECTIONOWNER 
# define XSetStandardProperties XSETSTANDARDPROPERTIES 
# define XSetStipple XSETSTIPPLE 
# define XSetTSOrigin XSETTSORIGIN 
# define XSetTile XSETTILE 
# define XSetTransientForHint XSETTRANSIENTFORHINT 
# define XSetWMHints XSETWMHINTS 
# define XSetWindowBackground XSETWINDOWBACKGROUND 
# define XSetWindowBackgroundPixmap XSETWINDOWBACKGROUNDPIXMAP 
# define XSetWindowBorder XSETWINDOWBORDER 
# define XSetWindowBorderPixmap XSETWINDOWBORDERPIXMAP 
# define XSetWindowBorderWidth XSETWINDOWBORDERWIDTH 
# define XSetWindowColormap XSETWINDOWCOLORMAP 
# define XStoreColor XSTORECOLOR 
# define XStoreName XSTORENAME 
# define XStringToKeysym XSTRINGTOKEYSYM 
# define XSync XSYNC 
# define XSynchronize XSYNCHRONIZE 
# define XTextWidth XTEXTWIDTH 
# define XTextWidth16 XTEXTWIDTH16 
# define XTranslateCoordinates XTRANSLATECOORDINATES 
# define XUngrabKeyboard XUNGRABKEYBOARD 
# define XUngrabPointer XUNGRABPOINTER 
# define XUnmapWindow XUNMAPWINDOW 
# define XVendorRelease XVENDORRELEASE 
# define XWarpPointer XWARPPOINTER 

#endif
