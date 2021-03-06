# $Header$
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libsvn.
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
TOP=..
INCLUDE_TOP=$(TOP)\..



!INCLUDE $(TOP)\rules\stdHeader_bc

!INCLUDE Make.spec

LIBNAME=libstx_libsvn
MODULE_PATH=libsvn
RESFILES=libsvn.$(RES)



LOCALINCLUDES= -I$(INCLUDE_TOP)\stx\goodies\xml\vw -I$(INCLUDE_TOP)\stx\libbasic -I$(INCLUDE_TOP)\stx\libbasic2 -I$(INCLUDE_TOP)\stx\libbasic3 -I$(INCLUDE_TOP)\stx\libtool -I$(INCLUDE_TOP)\stx\libtool2 -I$(INCLUDE_TOP)\stx\libview -I$(INCLUDE_TOP)\stx\libview2 -I$(INCLUDE_TOP)\stx\libwidg -I$(INCLUDE_TOP)\stx\libwidg2
LOCALDEFINES=

STCLOCALOPT=-package=$(PACKAGE) -I. $(LOCALINCLUDES) -headerDir=. $(STCLOCALOPTIMIZATIONS) $(STCWARNINGS) $(LOCALDEFINES)  -varPrefix=$(LIBNAME)
LOCALLIBS=

OBJS= $(COMMON_OBJS) $(WIN32_OBJS)

ALL::  classLibRule

classLibRule: $(OUTDIR) $(OUTDIR)$(LIBNAME).dll

!INCLUDE $(TOP)\rules\stdRules_bc

# build all mandatory prerequisite packages (containing superclasses) for this package
prereq:
	pushd ..\libbasic & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\goodies\refactoryBrowser\parser & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libbasic2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libbasic3 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libcomp & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libui & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libview & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libview2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libwidg & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libwidg2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libtool & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "







test: $(TOP)\goodies\builder\reports\NUL
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)SVN__Branch.$(O) SVN__Branch.$(H): SVN__Branch.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__BranchQuery.$(O) SVN__BranchQuery.$(H): SVN__BranchQuery.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Query.$(H) $(STCHDR)
$(OUTDIR)SVN__Browser.$(O) SVN__Browser.$(H): SVN__Browser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__Cache.$(O) SVN__Cache.$(H): SVN__Cache.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)SVN__CacheEntry.$(O) SVN__CacheEntry.$(H): SVN__CacheEntry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Command.$(O) SVN__Command.$(H): SVN__Command.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__CompatModeQuery.$(O) SVN__CompatModeQuery.$(H): SVN__CompatModeQuery.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Query.$(H) $(STCHDR)
$(OUTDIR)SVN__Configuration.$(O) SVN__Configuration.$(H): SVN__Configuration.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__ConfigurationApp.$(O) SVN__ConfigurationApp.$(H): SVN__ConfigurationApp.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\AbstractSettingsApplication.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__Credentials.$(O) SVN__Credentials.$(H): SVN__Credentials.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Dialog.$(O) SVN__Dialog.$(H): SVN__Dialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__DiffViewApp.$(O) SVN__DiffViewApp.$(H): SVN__DiffViewApp.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\DiffTextView.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__DiffCodeView2.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libwidg2\SyncedMultiColumnTextView.$(H) $(INCLUDE_TOP)\stx\libwidg2\TwoColumnTextView.$(H) $(STCHDR)
$(OUTDIR)SVN__Entry.$(O) SVN__Entry.$(H): SVN__Entry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Enum.$(O) SVN__Enum.$(H): SVN__Enum.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__ExternalMergeTool.$(O) SVN__ExternalMergeTool.$(H): SVN__ExternalMergeTool.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__IconLibrary.$(O) SVN__IconLibrary.$(H): SVN__IconLibrary.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__MergeBrowser.$(O) SVN__MergeBrowser.$(H): SVN__MergeBrowser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__ChangeSetDiffTool.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__OSProcess.$(O) SVN__OSProcess.$(H): SVN__OSProcess.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__PackagePattern.$(O) SVN__PackagePattern.$(H): SVN__PackagePattern.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Property.$(O) SVN__Property.$(H): SVN__Property.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Repository.$(O) SVN__Repository.$(H): SVN__Repository.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__RepositoryConfiguration.$(O) SVN__RepositoryConfiguration.$(H): SVN__RepositoryConfiguration.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__RepositoryManager.$(O) SVN__RepositoryManager.$(H): SVN__RepositoryManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Revision.$(O) SVN__Revision.$(H): SVN__Revision.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionRange.$(O) SVN__RevisionRange.$(H): SVN__RevisionRange.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__SVNError.$(O) SVN__SVNError.$(H): SVN__SVNError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__Task.$(O) SVN__Task.$(H): SVN__Task.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__WCAction.$(O) SVN__WCAction.$(H): SVN__WCAction.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionNotification.$(O) SVN__WCActionNotification.$(H): SVN__WCActionNotification.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__WCError.$(O) SVN__WCError.$(H): SVN__WCError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__WizardPane.$(O) SVN__WizardPane.$(H): SVN__WizardPane.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__WorkingCopy.$(O) SVN__WorkingCopy.$(H): SVN__WorkingCopy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVN__XMLObject.$(O) SVN__XMLObject.$(H): SVN__XMLObject.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SVNSourceCodeManager.$(O) SVNSourceCodeManager.$(H): SVNSourceCodeManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic3\AbstractSourceCodeManager.$(H) $(INCLUDE_TOP)\stx\libbasic3\SourceCodeManagerUtilities.$(H) $(STCHDR)
$(OUTDIR)stx_libsvn.$(O) stx_libsvn.$(H): stx_libsvn.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)
$(OUTDIR)SVN__AuthorizationError.$(O) SVN__AuthorizationError.$(H): SVN__AuthorizationError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__SVNError.$(H) $(STCHDR)
$(OUTDIR)SVN__BranchAndRevisionSelectionDialog.$(O) SVN__BranchAndRevisionSelectionDialog.$(H): SVN__BranchAndRevisionSelectionDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__BranchCommand.$(O) SVN__BranchCommand.$(H): SVN__BranchCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__BranchSelectionDialog.$(O) SVN__BranchSelectionDialog.$(H): SVN__BranchSelectionDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__CVSTask.$(O) SVN__CVSTask.$(H): SVN__CVSTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__CommitDialog2.$(O) SVN__CommitDialog2.$(H): SVN__CommitDialog2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__ConfigurationDialog.$(O) SVN__ConfigurationDialog.$(H): SVN__ConfigurationDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__CreateRepositoryCommand.$(O) SVN__CreateRepositoryCommand.$(H): SVN__CreateRepositoryCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__CredentialsDialog.$(O) SVN__CredentialsDialog.$(H): SVN__CredentialsDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__FileoutLikeTask.$(O) SVN__FileoutLikeTask.$(H): SVN__FileoutLikeTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__KDiff3.$(O) SVN__KDiff3.$(H): SVN__KDiff3.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__ExternalMergeTool.$(H) $(STCHDR)
$(OUTDIR)SVN__MergeViewApp.$(O) SVN__MergeViewApp.$(H): SVN__MergeViewApp.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__DiffViewApp.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKind.$(O) SVN__NodeKind.$(H): SVN__NodeKind.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(STCHDR)
$(OUTDIR)SVN__NonExistentURLError.$(O) SVN__NonExistentURLError.$(H): SVN__NonExistentURLError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__SVNError.$(H) $(STCHDR)
$(OUTDIR)SVN__ProgressDialog.$(O) SVN__ProgressDialog.$(H): SVN__ProgressDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__RepositoryDialog.$(O) SVN__RepositoryDialog.$(H): SVN__RepositoryDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__RepositoryEntry.$(O) SVN__RepositoryEntry.$(H): SVN__RepositoryEntry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Entry.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionBase.$(O) SVN__RevisionBase.$(H): SVN__RevisionBase.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Revision.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionDate.$(O) SVN__RevisionDate.$(H): SVN__RevisionDate.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Revision.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionHead.$(O) SVN__RevisionHead.$(H): SVN__RevisionHead.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Revision.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionLogBrowser.$(O) SVN__RevisionLogBrowser.$(H): SVN__RevisionLogBrowser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Browser.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionLogEntry.$(O) SVN__RevisionLogEntry.$(H): SVN__RevisionLogEntry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__XMLObject.$(H) $(STCHDR)
$(OUTDIR)SVN__RevisionNumber.$(O) SVN__RevisionNumber.$(H): SVN__RevisionNumber.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Revision.$(H) $(STCHDR)
$(OUTDIR)SVN__Status.$(O) SVN__Status.$(H): SVN__Status.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(STCHDR)
$(OUTDIR)SVN__UnknownError.$(O) SVN__UnknownError.$(H): SVN__UnknownError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__SVNError.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionAdded.$(O) SVN__WCActionAdded.$(H): SVN__WCActionAdded.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionConflict.$(O) SVN__WCActionConflict.$(H): SVN__WCActionConflict.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionDeleted.$(O) SVN__WCActionDeleted.$(H): SVN__WCActionDeleted.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionMerged.$(O) SVN__WCActionMerged.$(H): SVN__WCActionMerged.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionModified.$(O) SVN__WCActionModified.$(H): SVN__WCActionModified.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionNone.$(O) SVN__WCActionNone.$(H): SVN__WCActionNone.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionRestored.$(O) SVN__WCActionRestored.$(H): SVN__WCActionRestored.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCActionUpdated.$(O) SVN__WCActionUpdated.$(H): SVN__WCActionUpdated.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCAction.$(H) $(STCHDR)
$(OUTDIR)SVN__WCCommand.$(O) SVN__WCCommand.$(H): SVN__WCCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__WCEntry.$(O) SVN__WCEntry.$(H): SVN__WCEntry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Entry.$(H) $(STCHDR)
$(OUTDIR)SVN__WCEntryInfo.$(O) SVN__WCEntryInfo.$(H): SVN__WCEntryInfo.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__XMLObject.$(H) $(STCHDR)
$(OUTDIR)SVN__Wizard.$(O) SVN__Wizard.$(H): SVN__Wizard.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__WorkingCopyBrowser.$(O) SVN__WorkingCopyBrowser.$(H): SVN__WorkingCopyBrowser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Browser.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)SVN__WorkingCopyLockedError.$(O) SVN__WorkingCopyLockedError.$(H): SVN__WorkingCopyLockedError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__SVNError.$(H) $(STCHDR)
$(OUTDIR)SVN__CatCommand.$(O) SVN__CatCommand.$(H): SVN__CatCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__CleanupCommand.$(O) SVN__CleanupCommand.$(H): SVN__CleanupCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__CommitTask.$(O) SVN__CommitTask.$(H): SVN__CommitTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__FileoutLikeTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__CommitWizard.$(O) SVN__CommitWizard.$(H): SVN__CommitWizard.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Dialog.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Wizard.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WizardPane.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libview2\SimpleDialog.$(H) $(STCHDR)
$(OUTDIR)SVN__CopyCommand.$(O) SVN__CopyCommand.$(H): SVN__CopyCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__ExportCommand.$(O) SVN__ExportCommand.$(H): SVN__ExportCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__ImportFromCVSTask.$(O) SVN__ImportFromCVSTask.$(H): SVN__ImportFromCVSTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__CVSTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__ListCommand.$(O) SVN__ListCommand.$(H): SVN__ListCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__LogCommand.$(O) SVN__LogCommand.$(H): SVN__LogCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__MoveCommand.$(O) SVN__MoveCommand.$(H): SVN__MoveCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKindDir.$(O) SVN__NodeKindDir.$(H): SVN__NodeKindDir.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__NodeKind.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKindExternal.$(O) SVN__NodeKindExternal.$(H): SVN__NodeKindExternal.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__NodeKind.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKindFile.$(O) SVN__NodeKindFile.$(H): SVN__NodeKindFile.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__NodeKind.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKindNone.$(O) SVN__NodeKindNone.$(H): SVN__NodeKindNone.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__NodeKind.$(H) $(STCHDR)
$(OUTDIR)SVN__NodeKindUnknown.$(O) SVN__NodeKindUnknown.$(H): SVN__NodeKindUnknown.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__NodeKind.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusAdded.$(O) SVN__StatusAdded.$(H): SVN__StatusAdded.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusConflicted.$(O) SVN__StatusConflicted.$(H): SVN__StatusConflicted.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusDeleted.$(O) SVN__StatusDeleted.$(H): SVN__StatusDeleted.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusExternal.$(O) SVN__StatusExternal.$(H): SVN__StatusExternal.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusIgnored.$(O) SVN__StatusIgnored.$(H): SVN__StatusIgnored.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusIncomplete.$(O) SVN__StatusIncomplete.$(H): SVN__StatusIncomplete.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusMissing.$(O) SVN__StatusMissing.$(H): SVN__StatusMissing.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusModified.$(O) SVN__StatusModified.$(H): SVN__StatusModified.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusNormal.$(O) SVN__StatusNormal.$(H): SVN__StatusNormal.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusObstructed.$(O) SVN__StatusObstructed.$(H): SVN__StatusObstructed.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusReplaced.$(O) SVN__StatusReplaced.$(H): SVN__StatusReplaced.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusUnversioned.$(O) SVN__StatusUnversioned.$(H): SVN__StatusUnversioned.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Enum.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Status.$(H) $(STCHDR)
$(OUTDIR)SVN__SyncWithCVSTask.$(O) SVN__SyncWithCVSTask.$(H): SVN__SyncWithCVSTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__CVSTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__UpdateLikeCommand.$(O) SVN__UpdateLikeCommand.$(H): SVN__UpdateLikeCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(STCHDR)
$(OUTDIR)SVN__UpdateLikeTask.$(O) SVN__UpdateLikeTask.$(H): SVN__UpdateLikeTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__FileoutLikeTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(STCHDR)
$(OUTDIR)SVN__WCPathCommand.$(O) SVN__WCPathCommand.$(H): SVN__WCPathCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__AddCommand.$(O) SVN__AddCommand.$(H): SVN__AddCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__CheckoutCommand.$(O) SVN__CheckoutCommand.$(H): SVN__CheckoutCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__UpdateLikeCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__CommitCommand.$(O) SVN__CommitCommand.$(H): SVN__CommitCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__DeleteCommand.$(O) SVN__DeleteCommand.$(H): SVN__DeleteCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__InfoCommand.$(O) SVN__InfoCommand.$(H): SVN__InfoCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__MergeCommand.$(O) SVN__MergeCommand.$(H): SVN__MergeCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__UpdateLikeCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__MergeTask.$(O) SVN__MergeTask.$(H): SVN__MergeTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__FileoutLikeTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__UpdateLikeTask.$(H) $(STCHDR)
$(OUTDIR)SVN__PropsetCommand.$(O) SVN__PropsetCommand.$(H): SVN__PropsetCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__ResolvedCommand.$(O) SVN__ResolvedCommand.$(H): SVN__ResolvedCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__RevertCommand.$(O) SVN__RevertCommand.$(H): SVN__RevertCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__StatusCommand.$(O) SVN__StatusCommand.$(H): SVN__StatusCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__WCPathCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__UpdateCommand.$(O) SVN__UpdateCommand.$(H): SVN__UpdateCommand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__BranchCommand.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Command.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__UpdateLikeCommand.$(H) $(STCHDR)
$(OUTDIR)SVN__UpdateTask.$(O) SVN__UpdateTask.$(H): SVN__UpdateTask.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__FileoutLikeTask.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__Task.$(H) $(INCLUDE_TOP)\stx\libsvn\SVN__UpdateLikeTask.$(H) $(STCHDR)
$(OUTDIR)extensions.$(O): extensions.st $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\Date.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Filename.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\IdentityDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Integer.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Method.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic\String.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\UserNotification.$(H) $(INCLUDE_TOP)\stx\libbasic\UserPreferences.$(H) $(INCLUDE_TOP)\stx\libbasic3\Change.$(H) $(INCLUDE_TOP)\stx\libbasic3\ChangeSet.$(H) $(INCLUDE_TOP)\stx\libbasic3\ClassChange.$(H) $(INCLUDE_TOP)\stx\libbasic3\MethodChange.$(H) $(INCLUDE_TOP)\stx\libtool\AbstractFileBrowser.$(H) $(INCLUDE_TOP)\stx\libtool\SystemBrowser.$(H) $(INCLUDE_TOP)\stx\libtool\Tools__NewSystemBrowser.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(INCLUDE_TOP)\stx\libwidg2\FilenameWidgetWithHistory.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line

# **Must be at end**

# Enforce recompilation of package definition class if Mercurial working
# copy state changes. Together with --guessVersion it ensures that package
# definition class always contains correct binary revision string.
!IFDEF HGROOT
$(OUTDIR)stx_libsvn.$(O): $(HGROOT)\.hg\dirstate
!ENDIF
