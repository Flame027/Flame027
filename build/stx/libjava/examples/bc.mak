# $Header: /cvs/stx/stx/libjava/examples/bc.mak,v 1.6 2015-03-20 12:08:02 vrany Exp $
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libjava_examples.
#
# Warning: once you modify this file, do not rerun
# stmkmp or projectDefinition-build again - otherwise, your changes are lost.
#
# Notice, that the name bc.mak is historical (from times, when only borland c was supported).
# This file contains make rules for the win32 platform using either borland-bcc or visual-c.
# It shares common definitions with the unix-make in Make.spec.
# The bc.mak supports the following targets:
#    bmake         - compile all st-files to a classLib (dll)
#    bmake clean   - clean all temp files
#    bmake clobber - clean all
#
# Historic Note:
#  this used to contain only rules to make with borland
#    (called via bmake, by "make.exe -f bc.mak")
#  this has changed; it is now also possible to build using microsoft visual c
#    (called via vcmake, by "make.exe -f bc.mak -DUSEVC")
#
TOP=..\..
INCLUDE_TOP=$(TOP)\..



!INCLUDE $(TOP)\rules\stdHeader_bc

!INCLUDE Make.spec

LIBNAME=libstx_libjava_examples
MODULE_PATH=libjava\examples
RESFILES=examples.$(RES)



LOCALINCLUDES= -I$(INCLUDE_TOP)\stx\libbasic -I$(INCLUDE_TOP)\stx\libjava -I$(INCLUDE_TOP)\stx\libjava\tools
LOCALDEFINES=

STCLOCALOPT=-package=$(PACKAGE) -I. $(LOCALINCLUDES) -headerDir=. $(STCLOCALOPTIMIZATIONS) $(STCWARNINGS) $(LOCALDEFINES)  -varPrefix=$(LIBNAME)
LOCALLIBS=

OBJS= $(COMMON_OBJS) $(WIN32_OBJS)

ALL::  classLibRule

classLibRule: $(OUTDIR) $(OUTDIR)$(LIBNAME).dll

!INCLUDE $(TOP)\rules\stdRules_bc

# build all mandatory prerequisite packages (containing superclasses) for this package
prereq:
	pushd ..\..\libbasic & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "




java_clean:
	ant -f java\build.xml clean

clean:: java_clean


java_compile:
	ant -f java\build.xml compile

ALL:: java_compile





test: $(TOP)\goodies\builder\reports\NUL
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)stx_libjava_examples.$(O) stx_libjava_examples.$(H): stx_libjava_examples.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line

# **Must be at end**

# Enforce recompilation of package definition class if Mercurial working
# copy state changes. Together with --guessVersion it ensures that package
# definition class always contains correct binary revision string.
!IFDEF HGROOT
$(OUTDIR)stx_libjava_examples.$(O): $(HGROOT)\.hg\dirstate
!ENDIF