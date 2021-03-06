# $Header$
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_goodies_smallsense.
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

LIBNAME=libstx_goodies_smallsense
MODULE_PATH=goodies\smallsense
RESFILES=stx_goodies_smallsenseWINrc.$(RES)



LOCALINCLUDES= -I$(INCLUDE_TOP)\stx\goodies\refactoryBrowser\changes -I$(INCLUDE_TOP)\stx\goodies\refactoryBrowser\helpers -I$(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint -I$(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser -I$(INCLUDE_TOP)\stx\goodies\regex -I$(INCLUDE_TOP)\stx\libbasic -I$(INCLUDE_TOP)\stx\libbasic2 -I$(INCLUDE_TOP)\stx\libbasic3 -I$(INCLUDE_TOP)\stx\libcomp -I$(INCLUDE_TOP)\stx\libhtml -I$(INCLUDE_TOP)\stx\libjava -I$(INCLUDE_TOP)\stx\libjava\tools -I$(INCLUDE_TOP)\stx\libtool -I$(INCLUDE_TOP)\stx\libview -I$(INCLUDE_TOP)\stx\libview2 -I$(INCLUDE_TOP)\stx\libwidg -I$(INCLUDE_TOP)\stx\libwidg2
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
	pushd ..\refactoryBrowser\helpers & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\refactoryBrowser\parser & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\regex & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libbasic2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libbasic3 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libcomp & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libui & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libview & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libview2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\refactoryBrowser\browser & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libwidg & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\refactoryBrowser\lint & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libhtml & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libwidg2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\..\libtool & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "







test: $(TOP)\goodies\builder\reports\NUL
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	-del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)SmallSense__AbstractDIalog.$(O) SmallSense__AbstractDIalog.$(C) SmallSense__AbstractDIalog.$(H): SmallSense__AbstractDIalog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractSearchProcessor.$(O) SmallSense__AbstractSearchProcessor.$(C) SmallSense__AbstractSearchProcessor.$(H): SmallSense__AbstractSearchProcessor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CodeHighlightingService.$(O) SmallSense__CodeHighlightingService.$(C) SmallSense__CodeHighlightingService.$(H): SmallSense__CodeHighlightingService.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__BackgroundSourceProcessingService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeHighlightingService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeViewService.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CodeNavigationService.$(O) SmallSense__CodeNavigationService.$(C) SmallSense__CodeNavigationService.$(H): SmallSense__CodeNavigationService.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeNavigationService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeViewService.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompletionContext.$(O) SmallSense__CompletionContext.$(C) SmallSense__CompletionContext.$(H): SmallSense__CompletionContext.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompletionController.$(O) SmallSense__CompletionController.$(C) SmallSense__CompletionController.$(H): SmallSense__CompletionController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg\EditTextViewCompletionSupport.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompletionEngine.$(O) SmallSense__CompletionEngine.$(C) SmallSense__CompletionEngine.$(H): SmallSense__CompletionEngine.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompletionResult.$(O) SmallSense__CompletionResult.$(C) SmallSense__CompletionResult.$(H): SmallSense__CompletionResult.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SortedCollection.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompletionView.$(O) SmallSense__CompletionView.$(C) SmallSense__CompletionView.$(H): SmallSense__CompletionView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CriticsWindow.$(O) SmallSense__CriticsWindow.$(C) SmallSense__CriticsWindow.$(H): SmallSense__CriticsWindow.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__EditService.$(O) SmallSense__EditService.$(C) SmallSense__EditService.$(H): SmallSense__EditService.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeViewService.$(H) $(STCHDR)
$(OUTDIR)SmallSense__EditSupport.$(O) SmallSense__EditSupport.$(C) SmallSense__EditSupport.$(H): SmallSense__EditSupport.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__Info.$(O) SmallSense__Info.$(C) SmallSense__Info.$(H): SmallSense__Info.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__Manager.$(O) SmallSense__Manager.$(C) SmallSense__Manager.$(H): SmallSense__Manager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__NavigatorStep.$(O) SmallSense__NavigatorStep.$(C) SmallSense__NavigatorStep.$(H): SmallSense__NavigatorStep.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__PO.$(O) SmallSense__PO.$(C) SmallSense__PO.$(H): SmallSense__PO.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ParseTreeIndex.$(O) SmallSense__ParseTreeIndex.$(C) SmallSense__ParseTreeIndex.$(H): SmallSense__ParseTreeIndex.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ParseTreeIndexEntry.$(O) SmallSense__ParseTreeIndexEntry.$(C) SmallSense__ParseTreeIndexEntry.$(H): SmallSense__ParseTreeIndexEntry.st $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ParseTreeInspector.$(O) SmallSense__ParseTreeInspector.$(C) SmallSense__ParseTreeInspector.$(H): SmallSense__ParseTreeInspector.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\HierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SelectorNode.$(O) SmallSense__SelectorNode.$(C) SmallSense__SelectorNode.$(H): SmallSense__SelectorNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcomp\ParseNode.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SettingsAppl.$(O) SmallSense__SettingsAppl.$(C) SmallSense__SettingsAppl.$(H): SmallSense__SettingsAppl.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\AbstractSettingsApplication.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkChecker.$(O) SmallSense__SmalltalkChecker.$(C) SmallSense__SmalltalkChecker.$(H): SmallSense__SmalltalkChecker.st $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\SmalllintChecker.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkInferencerParameters.$(O) SmallSense__SmalltalkInferencerParameters.$(C) SmallSense__SmalltalkInferencerParameters.$(H): SmallSense__SmalltalkInferencerParameters.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SharedPool.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkLintService.$(O) SmallSense__SmalltalkLintService.$(C) SmallSense__SmalltalkLintService.$(H): SmallSense__SmalltalkLintService.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__BackgroundSourceProcessingService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeViewService.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkParseNodeVisitor.$(O) SmallSense__SmalltalkParseNodeVisitor.$(C) SmallSense__SmalltalkParseNodeVisitor.$(H): SmallSense__SmalltalkParseNodeVisitor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkParser.$(O) SmallSense__SmalltalkParser.$(C) SmallSense__SmalltalkParser.$(H): SmallSense__SmalltalkParser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcomp\AbstractSyntaxHighlighter.$(H) $(INCLUDE_TOP)\stx\libcomp\Parser.$(H) $(INCLUDE_TOP)\stx\libcomp\Scanner.$(H) $(INCLUDE_TOP)\stx\libcomp\SyntaxHighlighter.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkQuickFixer.$(O) SmallSense__SmalltalkQuickFixer.$(C) SmallSense__SmalltalkQuickFixer.$(H): SmallSense__SmalltalkQuickFixer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkSyntaxHighlighter.$(O) SmallSense__SmalltalkSyntaxHighlighter.$(C) SmallSense__SmalltalkSyntaxHighlighter.$(H): SmallSense__SmalltalkSyntaxHighlighter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcomp\AbstractSyntaxHighlighter.$(H) $(INCLUDE_TOP)\stx\libcomp\Parser.$(H) $(INCLUDE_TOP)\stx\libcomp\Scanner.$(H) $(INCLUDE_TOP)\stx\libcomp\SyntaxHighlighter.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkUnacceptedMethodEnvironment.$(O) SmallSense__SmalltalkUnacceptedMethodEnvironment.$(C) SmallSense__SmalltalkUnacceptedMethodEnvironment.$(H): SmallSense__SmalltalkUnacceptedMethodEnvironment.st $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\helpers\BrowserEnvironment.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TokenPatternMatcher.$(O) SmallSense__TokenPatternMatcher.$(C) SmallSense__TokenPatternMatcher.$(H): SmallSense__TokenPatternMatcher.st $(INCLUDE_TOP)\stx\goodies\regex\RxMatcher.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TokenPatternParser.$(O) SmallSense__TokenPatternParser.$(C) SmallSense__TokenPatternParser.$(H): SmallSense__TokenPatternParser.st $(INCLUDE_TOP)\stx\goodies\regex\RxCharSetParser.$(H) $(INCLUDE_TOP)\stx\goodies\regex\RxParser.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TokenPatternToken.$(O) SmallSense__TokenPatternToken.$(C) SmallSense__TokenPatternToken.$(H): SmallSense__TokenPatternToken.st $(INCLUDE_TOP)\stx\goodies\regex\RxsNode.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TokenPatternTokenSet.$(O) SmallSense__TokenPatternTokenSet.$(C) SmallSense__TokenPatternTokenSet.$(H): SmallSense__TokenPatternTokenSet.st $(INCLUDE_TOP)\stx\goodies\regex\RxsCharSet.$(H) $(INCLUDE_TOP)\stx\goodies\regex\RxsNode.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TokenStream.$(O) SmallSense__TokenStream.$(C) SmallSense__TokenStream.$(H): SmallSense__TokenStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__Type.$(O) SmallSense__Type.$(C) SmallSense__Type.$(H): SmallSense__Type.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__TypeHolder.$(O) SmallSense__TypeHolder.$(C) SmallSense__TypeHolder.$(H): SmallSense__TypeHolder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)stx_goodies_smallsense.$(O) stx_goodies_smallsense.$(C) stx_goodies_smallsense.$(H): stx_goodies_smallsense.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractJavaCompletionEngine.$(O) SmallSense__AbstractJavaCompletionEngine.$(C) SmallSense__AbstractJavaCompletionEngine.$(H): SmallSense__AbstractJavaCompletionEngine.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractListDialog.$(O) SmallSense__AbstractListDialog.$(C) SmallSense__AbstractListDialog.$(H): SmallSense__AbstractListDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ClassInfo.$(O) SmallSense__ClassInfo.$(C) SmallSense__ClassInfo.$(H): SmallSense__ClassInfo.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__Info.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ClassPO.$(O) SmallSense__ClassPO.$(C) SmallSense__ClassPO.$(H): SmallSense__ClassPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ClassSearchProcessor.$(O) SmallSense__ClassSearchProcessor.$(C) SmallSense__ClassSearchProcessor.$(H): SmallSense__ClassSearchProcessor.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchProcessor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ClassType.$(O) SmallSense__ClassType.$(C) SmallSense__ClassType.$(H): SmallSense__ClassType.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__Type.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CompositeProcessor.$(O) SmallSense__CompositeProcessor.$(C) SmallSense__CompositeProcessor.$(H): SmallSense__CompositeProcessor.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchProcessor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ConstantPO.$(O) SmallSense__ConstantPO.$(C) SmallSense__ConstantPO.$(H): SmallSense__ConstantPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__GenericEditSupport.$(O) SmallSense__GenericEditSupport.$(C) SmallSense__GenericEditSupport.$(H): SmallSense__GenericEditSupport.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__EditSupport.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ImplementorSearchProcessor.$(O) SmallSense__ImplementorSearchProcessor.$(C) SmallSense__ImplementorSearchProcessor.$(H): SmallSense__ImplementorSearchProcessor.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchProcessor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__JavaEditSupport.$(O) SmallSense__JavaEditSupport.$(C) SmallSense__JavaEditSupport.$(H): SmallSense__JavaEditSupport.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__EditSupport.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__JavaImportPO.$(O) SmallSense__JavaImportPO.$(C) SmallSense__JavaImportPO.$(H): SmallSense__JavaImportPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__MethodBindingPO.$(O) SmallSense__MethodBindingPO.$(C) SmallSense__MethodBindingPO.$(H): SmallSense__MethodBindingPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__MethodInfo.$(O) SmallSense__MethodInfo.$(C) SmallSense__MethodInfo.$(H): SmallSense__MethodInfo.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__Info.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__MethodPO.$(O) SmallSense__MethodPO.$(C) SmallSense__MethodPO.$(H): SmallSense__MethodPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__PackagePO.$(O) SmallSense__PackagePO.$(C) SmallSense__PackagePO.$(H): SmallSense__PackagePO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__PluggablePO.$(O) SmallSense__PluggablePO.$(C) SmallSense__PluggablePO.$(H): SmallSense__PluggablePO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__PluggableSearchProcessor.$(O) SmallSense__PluggableSearchProcessor.$(C) SmallSense__PluggableSearchProcessor.$(H): SmallSense__PluggableSearchProcessor.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchProcessor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkCompletionEngine.$(O) SmallSense__SmalltalkCompletionEngine.$(C) SmallSense__SmalltalkCompletionEngine.$(H): SmallSense__SmalltalkCompletionEngine.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkEditSupport.$(O) SmallSense__SmalltalkEditSupport.$(C) SmallSense__SmalltalkEditSupport.$(H): SmallSense__SmalltalkEditSupport.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__EditSupport.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkInferencer.$(O) SmallSense__SmalltalkInferencer.$(C) SmallSense__SmalltalkInferencer.$(H): SmallSense__SmalltalkInferencer.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__SmalltalkParseNodeVisitor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SmalltalkParseNodeFinder.$(O) SmallSense__SmalltalkParseNodeFinder.$(C) SmallSense__SmalltalkParseNodeFinder.$(H): SmallSense__SmalltalkParseNodeFinder.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__SmalltalkParseNodeVisitor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__SnippetPO.$(O) SmallSense__SnippetPO.$(C) SmallSense__SnippetPO.$(H): SmallSense__SnippetPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__UnionType.$(O) SmallSense__UnionType.$(C) SmallSense__UnionType.$(H): SmallSense__UnionType.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__SmalltalkInferencerParameters.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__Type.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__UnknownType.$(O) SmallSense__UnknownType.$(C) SmallSense__UnknownType.$(H): SmallSense__UnknownType.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__Type.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__VariableBindingPO.$(O) SmallSense__VariableBindingPO.$(C) SmallSense__VariableBindingPO.$(H): SmallSense__VariableBindingPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__VariablePO.$(O) SmallSense__VariablePO.$(C) SmallSense__VariablePO.$(H): SmallSense__VariablePO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractJavaCompletionEngineSimple.$(O) SmallSense__AbstractJavaCompletionEngineSimple.$(C) SmallSense__AbstractJavaCompletionEngineSimple.$(H): SmallSense__AbstractJavaCompletionEngineSimple.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngine.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractSearchDialog.$(O) SmallSense__AbstractSearchDialog.$(C) SmallSense__AbstractSearchDialog.$(H): SmallSense__AbstractSearchDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__AbstractSelectDialog.$(O) SmallSense__AbstractSelectDialog.$(C) SmallSense__AbstractSelectDialog.$(H): SmallSense__AbstractSelectDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__GroovyEditSupport.$(O) SmallSense__GroovyEditSupport.$(C) SmallSense__GroovyEditSupport.$(H): SmallSense__GroovyEditSupport.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__EditSupport.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__JavaEditSupport.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__JavaCompletionEngine.$(O) SmallSense__JavaCompletionEngine.$(C) SmallSense__JavaCompletionEngine.$(H): SmallSense__JavaCompletionEngine.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngine.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__JavaConstructorPO.$(O) SmallSense__JavaConstructorPO.$(C) SmallSense__JavaConstructorPO.$(H): SmallSense__JavaConstructorPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__MethodPO.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__MethodKeywordRestPO.$(O) SmallSense__MethodKeywordRestPO.$(C) SmallSense__MethodKeywordRestPO.$(H): SmallSense__MethodKeywordRestPO.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__MethodPO.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__PO.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libwidg2\AbstractHierarchicalItem.$(H) $(INCLUDE_TOP)\stx\libwidg2\CompactHierarchicalItem.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CetegoryOrProtocolSelectDialog.$(O) SmallSense__CetegoryOrProtocolSelectDialog.$(C) SmallSense__CetegoryOrProtocolSelectDialog.$(H): SmallSense__CetegoryOrProtocolSelectDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSelectDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ClassSearchDialog.$(O) SmallSense__ClassSearchDialog.$(C) SmallSense__ClassSearchDialog.$(H): SmallSense__ClassSearchDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__JavaCompletionEngineSimple.$(O) SmallSense__JavaCompletionEngineSimple.$(C) SmallSense__JavaCompletionEngineSimple.$(H): SmallSense__JavaCompletionEngineSimple.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngine.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngineSimple.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__MethodSearchDialog.$(O) SmallSense__MethodSearchDialog.$(C) SmallSense__MethodSearchDialog.$(H): SmallSense__MethodSearchDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__Navigator.$(O) SmallSense__Navigator.$(C) SmallSense__Navigator.$(H): SmallSense__Navigator.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSearchDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__PackageSelectDialog.$(O) SmallSense__PackageSelectDialog.$(C) SmallSense__PackageSelectDialog.$(H): SmallSense__PackageSelectDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSelectDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__CategorySelectDialog.$(O) SmallSense__CategorySelectDialog.$(C) SmallSense__CategorySelectDialog.$(H): SmallSense__CategorySelectDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSelectDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CetegoryOrProtocolSelectDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SmallSense__GroovyCompletionEngineSimple.$(O) SmallSense__GroovyCompletionEngineSimple.$(C) SmallSense__GroovyCompletionEngineSimple.$(H): SmallSense__GroovyCompletionEngineSimple.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngine.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractJavaCompletionEngineSimple.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CompletionEngine.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__JavaCompletionEngineSimple.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallSense__ProtocolSelectDialog.$(O) SmallSense__ProtocolSelectDialog.$(C) SmallSense__ProtocolSelectDialog.$(H): SmallSense__ProtocolSelectDialog.st $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractDIalog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractListDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__AbstractSelectDialog.$(H) $(INCLUDE_TOP)\stx\goodies\smallsense\SmallSense__CetegoryOrProtocolSelectDialog.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)extensions.$(O): extensions.st $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\helpers\RBMethod.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\RBBasicLintRule.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\RBBlockLintRule.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\RBContainsSmalltalkXEOLCommentRule.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\RBLintRule.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\lint\RBTransformationRule.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser\RBBlockNode.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser\RBMethodNode.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser\RBProgramNode.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser\RBStatementNode.$(H) $(INCLUDE_TOP)\stx\goodies\refactoryBrowser\parser\RBValueNode.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ConfigurableFeatures.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\IdentityDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Method.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic\UserPreferences.$(H) $(INCLUDE_TOP)\stx\libcomp\AssignmentNode.$(H) $(INCLUDE_TOP)\stx\libcomp\BlockNode.$(H) $(INCLUDE_TOP)\stx\libcomp\MessageNode.$(H) $(INCLUDE_TOP)\stx\libcomp\ParseErrorNode.$(H) $(INCLUDE_TOP)\stx\libcomp\ParseNode.$(H) $(INCLUDE_TOP)\stx\libcomp\Parser.$(H) $(INCLUDE_TOP)\stx\libcomp\PrimaryNode.$(H) $(INCLUDE_TOP)\stx\libcomp\PrimitiveNode.$(H) $(INCLUDE_TOP)\stx\libcomp\ReturnNode.$(H) $(INCLUDE_TOP)\stx\libcomp\Scanner.$(H) $(INCLUDE_TOP)\stx\libcomp\StatementNode.$(H) $(INCLUDE_TOP)\stx\libcomp\VariableNode.$(H) $(INCLUDE_TOP)\stx\libhtml\HTMLDocumentFrame.$(H) $(INCLUDE_TOP)\stx\libhtml\HTMLDocumentView.$(H) $(INCLUDE_TOP)\stx\libtool\DebugView.$(H) $(INCLUDE_TOP)\stx\libtool\InspectorView.$(H) $(INCLUDE_TOP)\stx\libtool\MultiViewToolApplication.$(H) $(INCLUDE_TOP)\stx\libtool\SystemBrowser.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__BackgroundSourceProcessingService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeCompletionService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeHighlightingService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeNavigationService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__CodeViewService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__Inspector2.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__LintService.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__NavigationState.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__NewSystemBrowser.$(H) $(INCLUDE_TOP)\stx\libtool\WorkspaceApplication.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\ModalBox.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\ToolApplicationModel.$(H) $(INCLUDE_TOP)\stx\libwidg\DialogBox.$(H) $(INCLUDE_TOP)\stx\libwidg\EditTextView.$(H) $(INCLUDE_TOP)\stx\libwidg\EditTextViewCompletionSupport.$(H) $(INCLUDE_TOP)\stx\libwidg\ListView.$(H) $(INCLUDE_TOP)\stx\libwidg\TextView.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line

# **Must be at end**

# Enforce recompilation of package definition class if Mercurial working
# copy state changes. Together with --guessVersion it ensures that package
# definition class always contains correct binary revision string.
!IFDEF HGROOT
$(OUTDIR)stx_goodies_smallsense.$(O): $(HGROOT)\.hg\dirstate
!ENDIF
