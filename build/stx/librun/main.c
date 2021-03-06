static char rcsid[] = "$Header$";

/*
 * COPYRIGHT (c) 1988 by Claus Gittinger
 *              All Rights Reserved
 *
 * This software is furnished under a license and may be used
 * only in accordance with the terms of that license and with the
 * inclusion of the above copyright notice.   This software may not
 * be provided or otherwise made available to, or used by, any
 * other person.  No title to or ownership of the software is
 * hereby transferred.
 *
 * (claus: not much to be copyrighted though :-)
 */

/*
 * this file defines a default main (if none was explicitly given).
 * It sets up everything and starts the show with "Smalltalk start"
 * also, some hooks have been placed here, to allow customization
 *
 * Some of the behavior can be changed, by compiling this file
 * with appropriate defines:
 *    STARTUP_CLASS     - the class to send a start message (instead of Smalltalk)
 *    STARTUP_SELECTOR  - the selector to send (instead of start)
 *    IGNORE_IMAGE      - hard-code a '-I' setting (i.e. never look for an image)
 *    DIRECT_START      - directly go into STARTUPCLASS>>STARTUPSELECTOR
 *                        after all classes have been initialized.
 *                        If defined, its the startup methods responsibility
 *                        to initialize the system
 *                        (i.e. setup the processorScheduler, initialize the
 *                         display etc.)
 *    NOINFO            - infoPrinting initially off
 *    NODEBUG           - noDebug initially on
 *
 * When a standalone app is created, this main.c is compiled as the app's
 * main entry with appropriate defines (especially STARTUP_CLASS and SELECTOR).
 */

#define CUSTOM_FUNCTIONS
// #define SUPERDEBUG
// #define CMDDEBUG

/*
 * defaults (if not defined in your Makefile)
 */
#undef RESTART_SELECTOR

#ifndef STARTUP_CLASS
# define STARTUP_CLASS "Smalltalk"
#endif

#ifndef STARTUP_SELECTOR
# define STARTUP_SELECTOR "start"
#endif

#ifndef RESTART_SELECTOR
# define RESTART_SELECTOR "restart"
#endif

/*
 * the configuration string is constructed by the makefile,
 * and passed in as -D argument.
 * except for vms and windows (where we have no intelligent shell to do it)
 */
#ifndef CONFIGURATION_STRING
# ifdef __VMS__
#  define CONFIGURATION_STRING "vms/standard:standard"
# else
#  ifdef WIN32
#   ifdef __BORLANDC__
#    define CONFIGURATION_STRING "win32/bcc:standard"
#   else
#    ifdef __VISUALC__
#     define CONFIGURATION_STRING "win32/msvc:standard"
#    else
#     ifdef __LCC__
#      define CONFIGURATION_STRING "win32/lcc:standard"
#     else
#      ifdef __TCC__
#       define CONFIGURATION_STRING "win32/tcc:standard"
#      else
#       ifdef __MINGW64__
#        define CONFIGURATION_STRING "win32/mingw64:standard"
#       else
#        ifdef __MINGW32__
#         define CONFIGURATION_STRING "win32/mingw32:standard"
#        else
#         define CONFIGURATION_STRING "win32/unknown:standard"
#        endif
#       endif
#      endif
#     endif
#    endif
#   endif
#  else
#   define CONFIGURATION_STRING "unknown/unknown:standard"
#  endif
# endif
#endif

/*
 * with unix builds, the BUILD_DATE is generated by the makefile
 * with msdos and vms, it is generated into a file and included
 */
#ifndef BUILD_DATE
# if defined(WIN32) || defined(VMS)
#  include "buildDate.h"
# endif
# ifndef BUILD_DATE
#  define BUILD_DATE "00-000-00 / 00:00"
# endif
#endif

/*
 * with jenkins builds, a buildNumber is generated
 */
#ifndef BUILD_NUMBER
# define BUILD_NUMBER ""
#endif

#ifdef WIN32
# include "windows.h"
#endif
# include "stdio.h"

#define __IN_VM__
#include "stc.h"

#ifdef SUPERDEBUG
# define SDPRINTF(x)    __stderrPrintf__ x
# define CMDDEBUG
#else
# define SDPRINTF(x)    /* */
#endif

#ifdef CMDDEBUG
# define CMDDPRINTF(x)  __stderrPrintf__ x
#else
# define CMDDPRINTF(x)  /* */
#endif

#ifdef IRIS
/*
 * this kludge was (don't ask me why) required on some
 * IRIS systems I had here. All it does is to reference
 * those two external c variables (to pull in the other code).
 * Maybe it's no longer required by the time you read this.
 *
 * [...time passed...] - IRIX is dead now - RIP
 * (too bad - those were nice machines)
 */
int __iris_workaround__ = 0;
#endif /* IRIS */

#ifdef IRIX5
  int __Argc = 1;
  char *__Argv[] = {"foo"};
  int __rld_obj_head;
#endif

#ifdef NEXT3
/*
 * this kludge was (don't ask me why) required for NeXT v3 systems,
 * to reference some code from the static librun library.
 *
 * [...time passed...] - NEXT is dead now - RIP
 * (too bad - those were also very nice machines)
 */
 static
 dummyToForceLoading() {
    __SEND0S();
    __MKREALCONTEXT5();
}
#endif

extern void __setIgnoreImage();
extern void __setNoDisplay();
extern void __setDebuggerAllowed();
extern void __setInfoPrinting();
extern void __setDirectStartStandAlone();

static int __hasNoConsole__ = 0;

#ifdef WIN32
# include <signal.h>
# define EXTERNAL_SYMBOLS

# ifdef USE_MODULE_TABLE
#  ifndef MODULES_DOT_C_FILE
#   define MODULES_DOT_C_FILE "modules.c"
#  endif
   /*
    * USE_MODULE_TABLE is no longer defined for windows.
    * modules are now loaded via an external ascii file (modules.stx),
    * which lists the dlls to be loaded
    */
#  include MODULES_DOT_C_FILE
# else /* loaded via modules.stx */
  static voidFUNC *__modules__[] = { 0 };
# endif
#else /* not WIN32 */
  extern voidFUNC *__modules__;
#endif /* not WIN32 */

#ifdef __openVMS__
# define EXTERNAL_SYMBOLS
# include "modules.c"
#endif

#ifdef __hppa__
# define EXTERNAL_SYMBOLS
#endif

#ifdef CUSTOM_HOOKS
extern void __stxRegisterCustomExitHook__( voidFUNC );
extern void __stxRegisterCustomPreInitHook__( voidFUNC );
extern void __stxRegisterCustomPostInitHook__( voidFUNC );
extern void __stxRegisterCustomPostReInitHook__( voidFUNC );
extern void __stxRegisterCustomInterruptHooks__( voidFUNC );
#endif
#ifdef CUSTOM_FUNCTIONS
CUSTOMFUNCTION customFunctions[];
extern void __stxRegisterCustomFunctions__( CUSTOMFUNCTION * );
#endif

#ifdef __hppa64__
extern void __stxMain__( char *, char *, char *, voidFUNC *, char *, char *, char *, int, char **, void*, int);
#else
extern void __stxMain__();
#endif

  static struct __vmData__ *__vmData__;
# define __VMDATA__      (*__vmData__)

/*********************************************************
 * startup and exit
 *********************************************************/

/*
 * your main; you can add all kind of
 * private setup here ....
 */

#ifdef WIN32

# ifdef WIN32GUI
/*
 * entry point if compiled as Windows app.
 */

#  define MAX_COMMAND_ARGS        64

int main(int, char **);
static void *hInstance = (void *)0,
	    *hPrevInstance = (void *)0;


WINAPI
WinMain(hInst, hPrevInst, lpCmdLine, nCmdShow)
    HINSTANCE hInst;
    HINSTANCE hPrevInst;
    char *lpCmdLine;
    int nCmdShow;
{
    static char *argv[MAX_COMMAND_ARGS];
    static char moduleFileName[MAX_PATH+1];
    int argc;
    char *cp, *tp;
    int quote = 0;
    int i;

    GetModuleFileName(NULL,moduleFileName,MAX_PATH);
    argv[0] = moduleFileName;
    argc = 1;

    cp = lpCmdLine;
    if (cp) {
	CMDDPRINTF(("WinMain: lpCmdLine \'%s\'\n", cp));
	while  (*cp && ((*cp == ' ') || (*cp == '\t'))) cp++;

	if (*cp == '\"') {
	    quote = 1;
	    cp++;
	}

	while (*cp && (argc < MAX_COMMAND_ARGS)) {
	    tp = cp;
	    if (quote) {
		while (*tp && (*tp != '\"'))
		    tp++;
		quote = 0;
	    } else {
		while (*tp && (*tp != ' '))
		    tp++;
	    }
	    if (*tp)
		*tp++ = '\0';

	    if (argc >= MAX_COMMAND_ARGS) {
		fprintf(stderr, "WinMain: too many arguments\n");
		exit(1);
	    }
	    CMDDPRINTF(("WinMain: arg %d: %s\n", argc, cp));

	    argv[argc++] = cp;
	    cp = tp;

	    while (*cp && ((*cp == ' ') || (*cp == '\t'))) cp++;
	    if (*cp == '\"') {
		quote = 1;
		cp++;
	    }
	}
    }

    for (i=argc; i<MAX_COMMAND_ARGS; i++) {
	argv[i] = (char *)0;
    }

    hInstance = (void *) hInst;
    hPrevInstance = (void *) hPrevInst;

    __hasNoConsole__ = 1;

    SDPRINTF(("WinMain: calling main...\n"));
    CMDDPRINTF(("argc=%d\n", argc));

    return(main(argc, argv));
}
# endif /* WIN32GUI */

static int __stx_argc;
static char **__stx_argv;
static int winProc(void *);
static voidFUNC messageHandler = (voidFUNC)0;
unsigned long __beginthreadNT(void (*start_address)(void *),
			      unsigned  stack_size,
			      void *arglist,
			      void *security_attr,
			      unsigned long create_flags,
			      unsigned long *thread_id);

int
main(int argc, char *argv[])
{
# ifdef WIN32GUI
	HANDLE handle;
	DWORD threadId;
	DWORD res;
	SECURITY_ATTRIBUTES saDefault = {
		sizeof(SECURITY_ATTRIBUTES),    // sizeof Structure
		0,                              // no security descriptor
		FALSE,                          // can(not)Inherit handle of Thread
	};

	SDPRINTF(("main: begin main thread.\n"));

	__stx_argc = argc;
	__stx_argv = argv;

	handle = CreateThread(&saDefault,
				   0x40000, // Stacksize
				   (LPTHREAD_START_ROUTINE)winProc,
				   NULL,
				   0,       // create in active state
				   &threadId);

	if (handle == INVALID_HANDLE_VALUE) {
#  if 0
	    __stxLog__(0, STX_LOG_ERROR, "VM", "threadNTCreate fails in main() with %d\n", GetLastError());
#  endif
	    return  -1;
	}

	res = WaitForSingleObject(handle, INFINITE);

	GetExitCodeThread(handle, &res);
	SDPRINTF(("main: main thread finished.\n"));
	return res;
# else /* not WIN32GUI */
	__stx_argc = argc;
	__stx_argv = argv;

	SDPRINTF(("main: calling winProc()\n"));
	winProc(NULL);
	SDPRINTF(("main: after winProc()\n"));
	/* not reached */
	return 0;
# endif /* WIN32GUI or not */
}

# ifdef __VISUALC__

/*
 * entry point for VISUAL-C console app.
 */
int
_tmain(int argc, char* argv[])
{
    return main(argc, argv);
}

# endif /* __VISUALC__ */

extern void __win32_setLogFile();

static int
winProc(void *dummy)
{
	int argc;
	char **argv;

	SDPRINTF(("WinProc\n"));

# if 0
	{
	    int i;

	    /* look for a -L argument, and set the logFile if presenet */
	    for (i=0; __stx_argv[i]; i++) {
		if (strcmp(__stx_argv[i], "-L") == 0) {
		    if (__stx_argv[i+1] && (strlen(__stx_argv[i+1]) > 0)) {
			__win32_setLogFile(__stx_argv[i+1], 1);
		    }
		}
	    }
	}
# endif /* 0 */

# ifdef WIN_LOGFILE
	__win32_setLogFile(WIN_LOGFILE, 0);
# endif

	/*
	 * no, I want to handle errors myself
	 */
	SetErrorMode(SEM_FAILCRITICALERRORS | SEM_NOOPENFILEERRORBOX | SEM_NOGPFAULTERRORBOX);
	SDPRINTF(("after SetErrorMode\n"));

	argc = __stx_argc;
	argv = __stx_argv;

#else /* not WIN32 */

# ifdef __osx__

int main2(int argc, char *argv[]);

int
main(int argc, char *argv[])
{
    return main2(argc, argv);
}

int
main2(int argc, char *argv[])
{
# else
int
main(int argc, char *argv[])
{
# endif /* __osx__ */
#endif /* WIN32 */

	CMDDPRINTF(("argc = %d\n", argc));
	CMDDPRINTF(("argv[0] = %s\n", argv[0]));
	CMDDPRINTF(("argv[1] = %s\n", argv[1]));
	CMDDPRINTF(("argv[2] = %s\n", argv[2]));

#ifdef NODEBUG
	{
	    /*
	     * debuggability initially off (for standAlone apps)
	     * no debugger will come up - instead an error message is printed,
	     * and the program terminates.
	     */
	    __setDebuggerAllowed(1);
	}
#endif
#ifdef NOINFO
	{
	    /*
	     * infoPrinting initially off (for standAlone apps)
	     */
	    __setInfoPrinting(0);
	}
#endif
#ifdef IGNORE_IMAGE
	{
	    /*
	     * force ignore of any image;
	     * useful for standAlone-app's executable
	     */
	    __setIgnoreImage(1);
	}
#endif
#ifdef DIRECT_START
	{
	    /*
	     * force direct start (without initializing other classes)
	     * experts only: the startup message MUST then initialize the system
	     * manually (as done in Smalltalk>>start)
	     */
	    __setDirectStartStandAlone(1);
	}
#endif
#ifdef NO_DISPLAY
	{
	    /*
	     * tell smalltalk that no display connection is wanted
	     */
	    __setNoDisplay(1);
	}
#endif
#ifdef IRIS
	if (__iris_workaround__) {
	    /* dummy code to reference these variables.
	     * Some time ago needed for IRIS
	     */
	    fprintf(stderr, "sel=(%s) rsel=(%s)\n", STARTUP_SELECTOR, RESTART_SELECTOR);
	    fprintf(stderr, STARTUP_SELECTOR); fprintf(stderr, "\n");
	    fprintf(stderr, RESTART_SELECTOR); fprintf(stderr, "\n");
	}
#endif

#ifdef CUSTOM_HOOKS
	/*
	 * register custom init-hooks & curstom functions
	 */
	__stxRegisterCustomExitHook__(customExitHook);
	__stxRegisterCustomPreInitHook__(customPreInitHook);
	__stxRegisterCustomPostInitHook__(customPostInitHook);
	__stxRegisterCustomPostReInitHook__(customPostReInitHook);
	__stxRegisterCustomInterruptHooks__(enterCustomInterruptHook,
					    leaveCustomInterruptHook);
#endif
#ifdef CUSTOM_FUNCTIONS
	__stxRegisterCustomFunctions__(customFunctions);
#endif

	SDPRINTF(("main: calling stxMain.\n"));

	__stxMain__(STARTUP_CLASS, STARTUP_SELECTOR, RESTART_SELECTOR,
		    __modules__, CONFIGURATION_STRING, BUILD_DATE, BUILD_NUMBER,
		    argc, argv,
#ifdef WIN32
		    GetModuleHandle(0),
#else
		    0,
#endif
		    __hasNoConsole__
		   );
	/* never reached */
	return -1;
}

/*********************************************************
 * custom hooks
 *********************************************************/

/*
 * called right before doing an exit() when smalltalk is shut down
 * if registered with __stxRegisterExitHook__()
 */
static void
customExitHook(int exitCode) { }

/*
 * called after VM initialization;
 * if registered with __stxRegisterPreInitHook__();
 * at this time all globals have been setup, but classes have not yet
 * performed their #initialize methods.
 * Shortly after this, ST/X will #initialize all classes.
 * This is not called for image-restart.
 */
static void
customPreInitHook() { }

/*
 * called after initialization;
 * if registered with __stxRegisterPostInitHook__();
 * at this time, all classes have performed their #initialize methods.
 * Shortly after this, Smalltalk takes over in Smalltalk>>start.
 * This is not called for image-restart.
 */
static void
customPostInitHook() { }

/*
 * called after initialization in case of an image restart.
 * if registered with __stxRegisterPostReInitHook__();
 * After this, Smalltalk takes over in Smalltalk>>restart.
 * This is not called for normal (non-image)-start.
 */
static void
customPostReInitHook() { }

/*********************************************************
 * hooks for custom interrupt/signal handling
 * this allows triggering an extra smalltalk interrupt from
 * custom user code.
 *********************************************************/

/*
 * how things work:
 *
 * triggering a custom interrupt:
 *
 *      __stxRegisterCustomInterrupt__();
 *
 * to handle it immediately (only needed, if it can occur during a
 * blocking system call (such as read/write, open ...)
 *
 *      __stxHandleInterrupt__()
 *
 * this can be done in your signal handler - for example.
 *
 *
 * ST/X will (as soon as possible) handle the interrupt, by doing
 * the following steps:
 * (if the Hooks were registered)
 *
 *      call:   __stxEnterCustomInterruptHook();
 *      send:   (ObjectMemory customSignalHandler) customSignal
 *      call:   __stxLeaveCustomSignalHook();
 *
 * with the above scheme, you can either handle these interrupts in
 * C (by defining an stxEnterCustomInterrupt()-function and leaving
 * ObjectMemory:CustomSignalHandler as nil),
 * or handle it on the Smalltalk level, by leaving the C-functions empty
 * and setting ObjectMemory:CustomSignalHandler to a smalltalk handler object.
 * Even a combination is possible.
 */

static void
enterCustomInterruptHook() {}

static void
leaveCustomInterruptHook() {}

#ifdef CUSTOM_FUNCTIONS

/*********************************************************
 * hooks for special user functions
 *
 * these are "poor-man's" custom functions,
 * which can be compiled into a standalone app,
 * without a need for stc-compiled inline-C-code.
 * (i.e. without a need for additional class-libraries)
 * Nowadays, noone does this, but it is left here as an example
 *
 *********************************************************/

/*
 * simple (poor man's) user defined functions
 *
 * this allows calling c-functions from st-code WITHOUT a need
 * to compile primitive code
 * (i.e. if you do not want to use, or cannot use the stc-compiler).
 *
 * the following table defines a set of c-functions, which can be called
 * via
 *    ExternalFunction callCustomFunction:nr
 *    ExternalFunction callCustomFunction:nr with:arg
 *    ExternalFunction callCustomFunction:nr with:arg1 with:arg2
 *    ExternalFunction callCustomFunction:nr with:arg1 with:arg2 with:arg3
 *    ExternalFunction callCustomFunction:nr withArguments:argArray
 *
 * The arguments are simply passed down to the customFunction in a vector,
 * together with the number of arguments.
 * The custom function has to extract those arguments from the vector itself.
 *
 * Every customFunction should return 1 on success, 0 on failure
 * (failure will trigger a primitiveFailure in Smalltalk.
 * A return value can be put into the cell pointed to by retRef;
 * if left unassigned, self is returned from the callCustomFunction Smalltalk method.
 * See examples below.
 */

#define PRIM_OK         0
#define PRIM_FAIL       -1
#define PRIM_ARGCOUNT   -2
#define PRIM_ARGTYPE    -3

/*
 * exampleFunction 0; to be called with:
 *
 * ExternalFunction callCustomFunction:0
 */
static int
demoFunction0(int nargs, OBJ *retRef, OBJ argVector[])
{
    /*
     * don't care for what was passed
     */
    fprintf(stderr, "demofunction0 called\n");
    return PRIM_OK;
}

/*
 * exampleFunction 1; to be called with:
 *
 * ExternalFunction callCustomFunction:0 with:aString
 */
static int
demoFunction1(int nargs, OBJ *retRef, OBJ argVector[])
{
    /*
     * check for 1 arg, which must be a string
     */
    if (nargs == 1) {
	OBJ arg = argVector[0];

	if (__isStringLike(arg)) {
	    char *stringArg = (char *) __stringVal(arg);

	    fprintf(stderr, "demofunction1 called with: %s\n", stringArg);
	    return PRIM_OK;
	}
	return PRIM_ARGTYPE;
    }
    /*
     * primitive failure
     */
    return PRIM_ARGCOUNT;
}

/*
 * exampleFunction 2; to be called with:
 *
 * ExternalFunction callCustomFunction:2 with:float1 with:float2
 */
static int
demoFunction2(int nargs, OBJ *retRef, OBJ argVector[])
{
    /*
     * check for 2 args; both must be floats
     */
    if (nargs == 2) {
	OBJ arg1 = argVector[0];
	OBJ arg2 = argVector[1];

	if (__isFloat(arg1) && __isFloat(arg2)) {
	    double floatArg1 = __floatVal(arg1);
	    double floatArg2 = __floatVal(arg2);

	    fprintf(stderr, "demofunction2 called with: %f and: %f; returning %f\n",
			floatArg1, floatArg2, floatArg1 + floatArg2);
	    *retRef = _MKFLOAT(floatArg1 + floatArg2);
	    return PRIM_OK;
	}
	return PRIM_ARGTYPE;
    }
    /*
     * primitive failure
     */
    return PRIM_ARGCOUNT;
}

/*
 * add more functions here (or include a file with your functions)
 */

CUSTOMFUNCTION customFunctions[] = {
    { demoFunction0, "demoFunction0" },
    { demoFunction1, "demoFunction1" },
    { demoFunction2, "demoFunction2" },
    /*
     * add entries here ..
     */

    /*
     * leave the end-mark below
     */
    { 0, "" }
};

#endif /* CUSTOM_FUNCTIONS */
