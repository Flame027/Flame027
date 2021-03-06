# $Header: /cvs/stx/stx/libcompat/bc.mak,v 1.58 2018-08-26 19:44:46 cg Exp $
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libcompat.
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

LIBNAME=libstx_libcompat
MODULE_PATH=libcompat
RESFILES=stx_libcompatWINrc.$(RES)


# see stdHeader_nt for LIBCOMPAT_BASE
LIB_BASE_LD_ARG=-b:$(LIBCOMPAT_BASE)


LOCALINCLUDES= -I$(INCLUDE_TOP)\stx\libbasic -I$(INCLUDE_TOP)\stx\libbasic2 -I$(INCLUDE_TOP)\stx\libbasic3 -I$(INCLUDE_TOP)\stx\libview -I$(INCLUDE_TOP)\stx\libview2 -I$(INCLUDE_TOP)\stx\libwidg -I$(INCLUDE_TOP)\stx\libwidg2
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
	pushd ..\libbasic2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libbasic3 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libview & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libview2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libwidg & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libwidg2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "







test: $(TOP)\goodies\builder\reports\
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	-del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)ActionButton.$(O) ActionButton.$(C) ActionButton.$(H): ActionButton.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ActionButtonView.$(O) ActionButtonView.$(C) ActionButtonView.$(H): ActionButtonView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ActionMenu.$(O) ActionMenu.$(C) ActionMenu.$(H): ActionMenu.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Alien.$(O) Alien.$(C) Alien.$(H): Alien.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\ExternalBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)Author.$(O) Author.$(C) Author.$(H): Author.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BinaryStream.$(O) BinaryStream.$(C) BinaryStream.$(H): BinaryStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)BindingReference.$(O) BindingReference.$(C) BindingReference.$(H): BindingReference.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BorderDecorator.$(O) BorderDecorator.$(C) BorderDecorator.$(H): BorderDecorator.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CEnvironment.$(O) CEnvironment.$(C) CEnvironment.$(H): CEnvironment.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CachedImage.$(O) CachedImage.$(C) CachedImage.$(H): CachedImage.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Image.$(H) $(STCHDR)
$(OUTDIR)CharacterAttributes.$(O) CharacterAttributes.$(C) CharacterAttributes.$(H): CharacterAttributes.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CharacterBlockScanner.$(O) CharacterBlockScanner.$(C) CharacterBlockScanner.$(H): CharacterBlockScanner.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CodeController.$(O) CodeController.$(C) CodeController.$(H): CodeController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)ColorForm.$(O) ColorForm.$(C) ColorForm.$(H): ColorForm.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Form.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(STCHDR)
$(OUTDIR)ColorPreferencesCollection.$(O) ColorPreferencesCollection.$(C) ColorPreferencesCollection.$(H): ColorPreferencesCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\IdentityDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)ComposedText.$(O) ComposedText.$(C) ComposedText.$(H): ComposedText.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ComposedTextView.$(O) ComposedTextView.$(C) ComposedTextView.$(H): ComposedTextView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\EditTextView.$(H) $(INCLUDE_TOP)\stx\libwidg\ListView.$(H) $(INCLUDE_TOP)\stx\libwidg\TextView.$(H) $(STCHDR)
$(OUTDIR)CompositeView.$(O) CompositeView.$(C) CompositeView.$(H): CompositeView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)CompositionScanner.$(O) CompositionScanner.$(C) CompositionScanner.$(H): CompositionScanner.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CoveragePalette.$(O) CoveragePalette.$(C) CoveragePalette.$(H): CoveragePalette.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libview\ColorPalette.$(H) $(INCLUDE_TOP)\stx\libview\Colormap.$(H) $(STCHDR)
$(OUTDIR)CustomHelp.$(O) CustomHelp.$(C) CustomHelp.$(H): CustomHelp.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)DialogCompositeController.$(O) DialogCompositeController.$(C) DialogCompositeController.$(H): DialogCompositeController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)DisplayScanner.$(O) DisplayScanner.$(C) DisplayScanner.$(H): DisplayScanner.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__ClassCategoriesReader.$(O) Dolphin__ClassCategoriesReader.$(C) Dolphin__ClassCategoriesReader.$(H): Dolphin__ClassCategoriesReader.st $(INCLUDE_TOP)\stx\libbasic\ClassCategoryReader.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__DeafObject.$(O) Dolphin__DeafObject.$(C) Dolphin__DeafObject.$(H): Dolphin__DeafObject.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Singleton.$(H) $(STCHDR)
$(OUTDIR)Dolphin__Error.$(O) Dolphin__Error.$(C) Dolphin__Error.$(H): Dolphin__Error.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__File.$(O) Dolphin__File.$(C) Dolphin__File.$(H): Dolphin__File.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__FileDialog.$(O) Dolphin__FileDialog.$(C) Dolphin__FileDialog.$(H): Dolphin__FileDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__IXMLDOMDocument.$(O) Dolphin__IXMLDOMDocument.$(C) Dolphin__IXMLDOMDocument.$(H): Dolphin__IXMLDOMDocument.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__IXMLDOMNamedNodeMap.$(O) Dolphin__IXMLDOMNamedNodeMap.$(C) Dolphin__IXMLDOMNamedNodeMap.$(H): Dolphin__IXMLDOMNamedNodeMap.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__ListPrompter.$(O) Dolphin__ListPrompter.$(C) Dolphin__ListPrompter.$(H): Dolphin__ListPrompter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\ModalBox.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\DialogBox.$(H) $(STCHDR)
$(OUTDIR)Dolphin__LookupTable.$(O) Dolphin__LookupTable.$(C) Dolphin__LookupTable.$(H): Dolphin__LookupTable.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)Dolphin__MessageBox.$(O) Dolphin__MessageBox.$(C) Dolphin__MessageBox.$(H): Dolphin__MessageBox.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\ModalBox.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\DialogBox.$(H) $(STCHDR)
$(OUTDIR)Dolphin__MethodCategoriesReader.$(O) Dolphin__MethodCategoriesReader.$(C) Dolphin__MethodCategoriesReader.$(H): Dolphin__MethodCategoriesReader.st $(INCLUDE_TOP)\stx\libbasic\ClassCategoryReader.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__Mutex.$(O) Dolphin__Mutex.$(C) Dolphin__Mutex.$(H): Dolphin__Mutex.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\RecursionLock.$(H) $(INCLUDE_TOP)\stx\libbasic\Semaphore.$(H) $(STCHDR)
$(OUTDIR)Dolphin__Notification.$(O) Dolphin__Notification.$(C) Dolphin__Notification.$(H): Dolphin__Notification.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__PluggableLookupTable.$(O) Dolphin__PluggableLookupTable.$(C) Dolphin__PluggableLookupTable.$(H): Dolphin__PluggableLookupTable.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic2\PluggableDictionary.$(H) $(STCHDR)
$(OUTDIR)Dolphin__Prompter.$(O) Dolphin__Prompter.$(C) Dolphin__Prompter.$(H): Dolphin__Prompter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\ModalBox.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\DialogBox.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SWEnvironment.$(O) Dolphin__SWEnvironment.$(C) Dolphin__SWEnvironment.$(H): Dolphin__SWEnvironment.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SearchPolicy.$(O) Dolphin__SearchPolicy.$(C) Dolphin__SearchPolicy.$(H): Dolphin__SearchPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SessionManager.$(O) Dolphin__SessionManager.$(C) Dolphin__SessionManager.$(H): Dolphin__SessionManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SharedLookupTable.$(O) Dolphin__SharedLookupTable.$(C) Dolphin__SharedLookupTable.$(H): Dolphin__SharedLookupTable.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SharedSet.$(O) Dolphin__SharedSet.$(C) Dolphin__SharedSet.$(H): Dolphin__SharedSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Dolphin__Shell.$(O) Dolphin__Shell.$(C) Dolphin__Shell.$(H): Dolphin__Shell.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)DragDropManager.$(O) DragDropManager.$(C) DragDropManager.$(H): DragDropManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)DragDropManagerTracker.$(O) DragDropManagerTracker.$(C) DragDropManagerTracker.$(H): DragDropManagerTracker.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ErrorDiffusion.$(O) ErrorDiffusion.$(C) ErrorDiffusion.$(H): ErrorDiffusion.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ExternalReadStream.$(O) ExternalReadStream.$(C) ExternalReadStream.$(H): ExternalReadStream.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)ExternalWriteStream.$(O) ExternalWriteStream.$(C) ExternalWriteStream.$(H): ExternalWriteStream.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)FileDirectory.$(O) FileDirectory.$(C) FileDirectory.$(H): FileDirectory.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)FractionalWidgetView.$(O) FractionalWidgetView.$(C) FractionalWidgetView.$(H): FractionalWidgetView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\Scroller.$(H) $(INCLUDE_TOP)\stx\libwidg2\Slider.$(H) $(STCHDR)
$(OUTDIR)GapString.$(O) GapString.$(C) GapString.$(H): GapString.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)IOAccessor.$(O) IOAccessor.$(C) IOAccessor.$(H): IOAccessor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ISO8859L1String.$(O) ISO8859L1String.$(C) ISO8859L1String.$(H): ISO8859L1String.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\String.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)InputState.$(O) InputState.$(C) InputState.$(H): InputState.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)InstructionClient.$(O) InstructionClient.$(C) InstructionClient.$(H): InstructionClient.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)InstructionStream.$(O) InstructionStream.$(C) InstructionStream.$(H): InstructionStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)LabeledBooleanView.$(O) LabeledBooleanView.$(C) LabeledBooleanView.$(H): LabeledBooleanView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\Button.$(H) $(INCLUDE_TOP)\stx\libwidg\Label.$(H) $(STCHDR)
$(OUTDIR)ListItemWrapper.$(O) ListItemWrapper.$(C) ListItemWrapper.$(H): ListItemWrapper.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MczInstaller.$(O) MczInstaller.$(C) MczInstaller.$(H): MczInstaller.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MemoryPolicy.$(O) MemoryPolicy.$(C) MemoryPolicy.$(H): MemoryPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MenuBuilder.$(O) MenuBuilder.$(C) MenuBuilder.$(H): MenuBuilder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MinimalShellInterface.$(O) MinimalShellInterface.$(C) MinimalShellInterface.$(H): MinimalShellInterface.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MockMedium.$(O) MockMedium.$(C) MockMedium.$(H): MockMedium.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MouseMenuController.$(O) MouseMenuController.$(C) MouseMenuController.$(H): MouseMenuController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)MultiSelectionSequenceView.$(O) MultiSelectionSequenceView.$(C) MultiSelectionSequenceView.$(H): MultiSelectionSequenceView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libwidg\ScrollableView.$(H) $(INCLUDE_TOP)\stx\libwidg\SequenceView.$(H) $(STCHDR)
$(OUTDIR)NameSpaceOrganizer.$(O) NameSpaceOrganizer.$(C) NameSpaceOrganizer.$(H): NameSpaceOrganizer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)NetNameResolver.$(O) NetNameResolver.$(C) NetNameResolver.$(H): NetNameResolver.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)NonInteractiveCompilerErrorHandler.$(O) NonInteractiveCompilerErrorHandler.$(C) NonInteractiveCompilerErrorHandler.$(H): NonInteractiveCompilerErrorHandler.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)OpaqueImage.$(O) OpaqueImage.$(C) OpaqueImage.$(H): OpaqueImage.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)OrderedDither.$(O) OrderedDither.$(C) OrderedDither.$(H): OrderedDither.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PackageInfo.$(O) PackageInfo.$(C) PackageInfo.$(H): PackageInfo.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ParagraphEditor.$(O) ParagraphEditor.$(C) ParagraphEditor.$(H): ParagraphEditor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)PassivityWrapper.$(O) PassivityWrapper.$(C) PassivityWrapper.$(H): PassivityWrapper.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Pixmap.$(O) Pixmap.$(C) Pixmap.$(H): Pixmap.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Form.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(STCHDR)
$(OUTDIR)PluggableListView.$(O) PluggableListView.$(C) PluggableListView.$(H): PluggableListView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libwidg\HVScrollableView.$(H) $(INCLUDE_TOP)\stx\libwidg\ScrollableView.$(H) $(STCHDR)
$(OUTDIR)PluggableTextView.$(O) PluggableTextView.$(C) PluggableTextView.$(H): PluggableTextView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libwidg\HVScrollableView.$(H) $(INCLUDE_TOP)\stx\libwidg\ScrollableView.$(H) $(STCHDR)
$(OUTDIR)Polyline.$(O) Polyline.$(C) Polyline.$(H): Polyline.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Polygon.$(H) $(STCHDR)
$(OUTDIR)Preferences.$(O) Preferences.$(C) Preferences.$(H): Preferences.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ProtocolClient.$(O) ProtocolClient.$(C) ProtocolClient.$(H): ProtocolClient.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ProvideAnswerNotification.$(O) ProvideAnswerNotification.$(C) ProvideAnswerNotification.$(H): ProvideAnswerNotification.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\UserConfirmation.$(H) $(STCHDR)
$(OUTDIR)RWBinaryOrTextStream.$(O) RWBinaryOrTextStream.$(C) RWBinaryOrTextStream.$(H): RWBinaryOrTextStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)RasterOp.$(O) RasterOp.$(C) RasterOp.$(H): RasterOp.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ReadMe__ST80_ReadMe.$(O) ReadMe__ST80_ReadMe.$(C) ReadMe__ST80_ReadMe.$(H): ReadMe__ST80_ReadMe.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ScannerTable.$(O) ScannerTable.$(C) ScannerTable.$(H): ScannerTable.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)ScheduledControllers.$(O) ScheduledControllers.$(C) ScheduledControllers.$(H): ScheduledControllers.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ScrollValueHolder.$(O) ScrollValueHolder.$(C) ScrollValueHolder.$(H): ScrollValueHolder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ScrollWrapper.$(O) ScrollWrapper.$(C) ScrollWrapper.$(H): ScrollWrapper.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SelectionInListController.$(O) SelectionInListController.$(C) SelectionInListController.$(H): SelectionInListController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)SelectionMenu.$(O) SelectionMenu.$(C) SelectionMenu.$(H): SelectionMenu.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\PopUpView.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(INCLUDE_TOP)\stx\libwidg\PopUpMenu.$(H) $(STCHDR)
$(OUTDIR)SelectionTracker.$(O) SelectionTracker.$(C) SelectionTracker.$(H): SelectionTracker.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmartRefStream.$(O) SmartRefStream.$(C) SmartRefStream.$(H): SmartRefStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SourceCodeStream.$(O) SourceCodeStream.$(C) SourceCodeStream.$(H): SourceCodeStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Squeak__ClassCommentReader.$(O) Squeak__ClassCommentReader.$(C) Squeak__ClassCommentReader.$(H): Squeak__ClassCommentReader.st $(INCLUDE_TOP)\stx\libbasic\ClassCategoryReader.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Squeak__TextAnchor.$(O) Squeak__TextAnchor.$(C) Squeak__TextAnchor.$(H): Squeak__TextAnchor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Squeak__TextColor.$(O) Squeak__TextColor.$(C) Squeak__TextColor.$(H): Squeak__TextColor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Squeak__TextEmphasis.$(O) Squeak__TextEmphasis.$(C) Squeak__TextEmphasis.$(H): Squeak__TextEmphasis.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Squeak__TextFontChange.$(O) Squeak__TextFontChange.$(C) Squeak__TextFontChange.$(H): Squeak__TextFontChange.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Squeak__TextURL.$(O) Squeak__TextURL.$(C) Squeak__TextURL.$(H): Squeak__TextURL.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)StrikeFont.$(O) StrikeFont.$(C) StrikeFont.$(H): StrikeFont.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)StringCollationPolicy.$(O) StringCollationPolicy.$(C) StringCollationPolicy.$(H): StringCollationPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)StringHolder.$(O) StringHolder.$(C) StringHolder.$(H): StringHolder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SystemDictionary.$(O) SystemDictionary.$(C) SystemDictionary.$(H): SystemDictionary.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SystemOrganization.$(O) SystemOrganization.$(C) SystemOrganization.$(H): SystemOrganization.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SystemUtils.$(O) SystemUtils.$(C) SystemUtils.$(H): SystemUtils.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SystemVersion.$(O) SystemVersion.$(C) SystemVersion.$(H): SystemVersion.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SystemWindow.$(O) SystemWindow.$(C) SystemWindow.$(H): SystemWindow.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)TTFontDescription.$(O) TTFontDescription.$(C) TTFontDescription.$(H): TTFontDescription.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\FontDescription.$(H) $(STCHDR)
$(OUTDIR)TextAttributes.$(O) TextAttributes.$(C) TextAttributes.$(H): TextAttributes.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TextController.$(O) TextController.$(C) TextController.$(H): TextController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\Controller.$(H) $(STCHDR)
$(OUTDIR)TextLines.$(O) TextLines.$(C) TextLines.$(H): TextLines.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TextList.$(O) TextList.$(C) TextList.$(H): TextList.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TextStyle.$(O) TextStyle.$(C) TextStyle.$(H): TextStyle.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TimeProfileBrowser.$(O) TimeProfileBrowser.$(C) TimeProfileBrowser.$(H): TimeProfileBrowser.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TriggerButtonController.$(O) TriggerButtonController.$(C) TriggerButtonController.$(H): TriggerButtonController.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TwoByteSymbol.$(O) TwoByteSymbol.$(C) TwoByteSymbol.$(H): TwoByteSymbol.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)UILookPolicy.$(O) UILookPolicy.$(C) UILookPolicy.$(H): UILookPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)UIManager.$(O) UIManager.$(C) UIManager.$(H): UIManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)UISettings.$(O) UISettings.$(C) UISettings.$(H): UISettings.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libview\ResourcePack.$(H) $(STCHDR)
$(OUTDIR)UnixProcess.$(O) UnixProcess.$(C) UnixProcess.$(H): UnixProcess.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Utilities.$(O) Utilities.$(C) Utilities.$(H): Utilities.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__ApplicationCoordinator.$(O) V__ApplicationCoordinator.$(C) V__ApplicationCoordinator.$(H): V__ApplicationCoordinator.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview2\ApplicationModel.$(H) $(INCLUDE_TOP)\stx\libview2\Model.$(H) $(STCHDR)
$(OUTDIR)V__Dynalink32.$(O) V__Dynalink32.$(C) V__Dynalink32.$(H): V__Dynalink32.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__File.$(O) V__File.$(C) V__File.$(H): V__File.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__GDIDLL.$(O) V__GDIDLL.$(C) V__GDIDLL.$(H): V__GDIDLL.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__GraphPane.$(O) V__GraphPane.$(C) V__GraphPane.$(H): V__GraphPane.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)V__MainWindow.$(O) V__MainWindow.$(C) V__MainWindow.$(H): V__MainWindow.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)V__OLEControlSitePane.$(O) V__OLEControlSitePane.$(C) V__OLEControlSitePane.$(H): V__OLEControlSitePane.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__OLEStructure.$(O) V__OLEStructure.$(C) V__OLEStructure.$(H): V__OLEStructure.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)V__ViewManager.$(O) V__ViewManager.$(C) V__ViewManager.$(H): V__ViewManager.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwDataInterchangeConverter.$(O) CwDataInterchangeConverter.$(C) CwDataInterchangeConverter.$(H): CwDataInterchangeConverter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwGlobalMemoryTransferMechanism.$(O) CwGlobalMemoryTransferMechanism.$(C) CwGlobalMemoryTransferMechanism.$(H): CwGlobalMemoryTransferMechanism.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwMainWindow.$(O) CwMainWindow.$(C) CwMainWindow.$(H): CwMainWindow.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwPrimitive.$(O) CwPrimitive.$(C) CwPrimitive.$(H): CwPrimitive.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwTransferMechanism.$(O) CwTransferMechanism.$(C) CwTransferMechanism.$(H): CwTransferMechanism.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CwWidget.$(O) CwWidget.$(C) CwWidget.$(H): CwWidget.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)VAST__ExError.$(O) VAST__ExError.$(C) VAST__ExError.$(H): VAST__ExError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)LookupTable.$(O) LookupTable.$(C) LookupTable.$(H): LookupTable.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)OSComposite.$(O) OSComposite.$(C) OSComposite.$(H): OSComposite.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)OSDialogBox.$(O) OSDialogBox.$(C) OSDialogBox.$(H): OSDialogBox.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SubApplication.$(O) SubApplication.$(C) SubApplication.$(H): SubApplication.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)VAST__System.$(O) VAST__System.$(C) VAST__System.$(H): VAST__System.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)VAST__VastSignal.$(O) VAST__VastSignal.$(C) VAST__VastSignal.$(H): VAST__VastSignal.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Signal.$(H) $(STCHDR)
$(OUTDIR)VW5PackageExporter.$(O) VW5PackageExporter.$(C) VW5PackageExporter.$(H): VW5PackageExporter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)WidgetWrapper.$(O) WidgetWrapper.$(C) WidgetWrapper.$(H): WidgetWrapper.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Win32Shell.$(O) Win32Shell.$(C) Win32Shell.$(H): Win32Shell.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)stx_libcompat.$(O) stx_libcompat.$(C) stx_libcompat.$(H): stx_libcompat.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)
$(OUTDIR)DataStream.$(O) DataStream.$(C) DataStream.$(H): DataStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(INCLUDE_TOP)\stx\libcompat\RWBinaryOrTextStream.$(H) $(STCHDR)
$(OUTDIR)Dolphin__FileOpenDialog.$(O) Dolphin__FileOpenDialog.$(C) Dolphin__FileOpenDialog.$(H): Dolphin__FileOpenDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\Dolphin__FileDialog.$(H) $(STCHDR)
$(OUTDIR)Dolphin__FileSaveDialog.$(O) Dolphin__FileSaveDialog.$(C) Dolphin__FileSaveDialog.$(H): Dolphin__FileSaveDialog.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\Dolphin__FileDialog.$(H) $(STCHDR)
$(OUTDIR)Dolphin__SharedIdentitySet.$(O) Dolphin__SharedIdentitySet.$(C) Dolphin__SharedIdentitySet.$(H): Dolphin__SharedIdentitySet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\Dolphin__SharedSet.$(H) $(STCHDR)
$(OUTDIR)LookPreferences.$(O) LookPreferences.$(C) LookPreferences.$(H): LookPreferences.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\IdentityDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libcompat\ColorPreferencesCollection.$(H) $(STCHDR)
$(OUTDIR)MacLookPolicy.$(O) MacLookPolicy.$(C) MacLookPolicy.$(H): MacLookPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\UILookPolicy.$(H) $(STCHDR)
$(OUTDIR)V__DynalinkUnderTest.$(O) V__DynalinkUnderTest.$(C) V__DynalinkUnderTest.$(H): V__DynalinkUnderTest.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\V__Dynalink32.$(H) $(STCHDR)
$(OUTDIR)Application.$(O) Application.$(C) Application.$(H): Application.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\SubApplication.$(H) $(STCHDR)
$(OUTDIR)Win3LookPolicy.$(O) Win3LookPolicy.$(C) Win3LookPolicy.$(H): Win3LookPolicy.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\UILookPolicy.$(H) $(STCHDR)
$(OUTDIR)ReferenceStream.$(O) ReferenceStream.$(C) ReferenceStream.$(H): ReferenceStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(INCLUDE_TOP)\stx\libcompat\DataStream.$(H) $(INCLUDE_TOP)\stx\libcompat\RWBinaryOrTextStream.$(H) $(STCHDR)
$(OUTDIR)Kernel.$(O) Kernel.$(C) Kernel.$(H): Kernel.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libcompat\Application.$(H) $(INCLUDE_TOP)\stx\libcompat\SubApplication.$(H) $(STCHDR)
$(OUTDIR)extensions.$(O): extensions.st $(INCLUDE_TOP)\stx\libbasic\AbstractTime.$(H) $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\ByteArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Character.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\FileStream.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Integer.$(H) $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Metaclass.$(H) $(INCLUDE_TOP)\stx\libbasic\Method.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Process.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic\Smalltalk.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\String.$(H) $(INCLUDE_TOP)\stx\libbasic\Symbol.$(H) $(INCLUDE_TOP)\stx\libbasic\Time.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic2\Socket.$(H) $(INCLUDE_TOP)\stx\libbasic2\ZipArchive.$(H) $(INCLUDE_TOP)\stx\libbasic3\ChangeSet.$(H) $(INCLUDE_TOP)\stx\libbasic3\ClassOrganizer.$(H) $(INCLUDE_TOP)\stx\libview\Color.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line
