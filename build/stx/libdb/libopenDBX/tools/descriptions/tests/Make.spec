# $Header: /cvs/stx/stx/libdb/libopenDBX/tools/descriptions/tests/Make.spec,v 1.1 2013-04-15 13:36:43 cg Exp $
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libdb_libopenDBX_tools_descriptions_tests.
#
# Warning: once you modify this file, do not rerun
# stmkmp or projectDefinition-build again - otherwise, your changes are lost.
#
# This file contains specifications which are common to all platforms.
#

# Do NOT CHANGE THESE DEFINITIONS
# (otherwise, ST/X will have a hard time to find out the packages location from its packageID,
#  to find the source code of a class and to find the library for a package)
MODULE=stx
MODULE_DIR=libdb/libopenDBX/tools/descriptions/tests
PACKAGE=$(MODULE):$(MODULE_DIR)


# Argument(s) to the stc compiler (stc --usage).
#  -headerDir=. : create header files locally
#                (if removed, they will be created as common
#  -Pxxx       : defines the package
#  -Zxxx       : a prefix for variables within the classLib
#  -Dxxx       : defines passed to to CC for inline C-code
#  -Ixxx       : include path passed to CC for inline C-code
#  +optspace   : optimized for space
#  +optspace2  : optimized more for space
#  +optspace3  : optimized even more for space
#  +optinline  : generate inline code for some ST constructs
#  +inlineNew  : additionally inline new
#  +inlineMath : additionally inline some floatPnt math stuff
#
# ********** OPTIONAL: MODIFY the next line(s) ***
# STCLOCALOPTIMIZATIONS=+optinline +inlineNew
# STCLOCALOPTIMIZATIONS=+optspace3
STCLOCALOPTIMIZATIONS=+optspace3


# Argument(s) to the stc compiler (stc --usage).
#  -warn            : no warnings
#  -warnNonStandard : no warnings about ST/X extensions
#  -warnEOLComments : no warnings about EOL comment extension
#  -warnPrivacy     : no warnings about privateClass extension
#
# ********** OPTIONAL: MODIFY the next line(s) ***
# STCWARNINGS=-warn
# STCWARNINGS=-warnNonStandard
# STCWARNINGS=-warnEOLComments
STCWARNINGS=-warnNonStandard

COMMON_CLASSES= \
	Dbxclass \
	Dbxitem \
	Dbxpet \
	Dbxplayer \
	stx_libdb_libopenDBX_tools_descriptions_tests \




COMMON_OBJS= \
    $(OUTDIR_SLASH)Dbxclass.$(O) \
    $(OUTDIR_SLASH)Dbxitem.$(O) \
    $(OUTDIR_SLASH)Dbxpet.$(O) \
    $(OUTDIR_SLASH)Dbxplayer.$(O) \
    $(OUTDIR_SLASH)stx_libdb_libopenDBX_tools_descriptions_tests.$(O) \



