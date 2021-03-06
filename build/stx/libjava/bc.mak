# $Header$
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libjava.
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

LIBNAME=libstx_libjava
MODULE_PATH=libjava
RESFILES=stx_libjavaWINrc.$(RES)

    
!if defined(USEMINGW32) || defined(USEMINGW64)
! if defined(USEMINGW32)
LIBFDM_TARGET = i686-pc-mingw32
! else 
LIBFDM_TARGET = x86_64-w64-mingw32
! endif
LIBFDM=support\fdlibm\$(LIBFDM_TARGET)\libfdm.a
!else
LIBFDM=$(LIBFDM_DIR)\fdlibm\libfdm.a
!endif




LOCALINCLUDES=-I$(ZLIB_DIR) -Isupport\fdlibm -I$(INCLUDE_TOP)\stx\libbasic -I$(INCLUDE_TOP)\stx\libbasic2 -I$(INCLUDE_TOP)\stx\libbasic3 -I$(INCLUDE_TOP)\stx\libcomp -I$(INCLUDE_TOP)\stx\libhtml -I$(INCLUDE_TOP)\stx\libtool -I$(INCLUDE_TOP)\stx\libview -I$(INCLUDE_TOP)\stx\libview2 -I$(INCLUDE_TOP)\stx\libwidg -I$(INCLUDE_TOP)\stx\libwidg2
LOCALDEFINES=

STCLOCALOPT=-package=$(PACKAGE) -I. $(LOCALINCLUDES) -headerDir=. $(STCLOCALOPTIMIZATIONS) $(STCWARNINGS) $(LOCALDEFINES)  -varPrefix=$(LIBNAME)
LOCALLIBS=$(ZLIB_DIR)\$(ZLIB) $(LIBFDM)

OBJS= $(COMMON_OBJS) $(WIN32_OBJS)

ALL:: $(ZLIB) $(LIBFDM) classLibRule

classLibRule: $(OUTDIR) $(OUTDIR)$(LIBNAME).dll

!INCLUDE $(TOP)\rules\stdRules_bc

# build all mandatory prerequisite packages (containing superclasses) for this package
prereq:
	pushd ..\libbasic & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libbasic2 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libbasic3 & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "
	pushd ..\libview & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "




java_clean:
	ant -f java\build.xml clean

clean:: java_clean


java_compile:
	ant -f java\build.xml compile

ALL:: java_compile


doc:
	pushd docs\user & $(MAKE_BAT) html

doc-install:
	pushd docs\user & $(MAKE_BAT) html-install


clean::
	pushd docs\user & $(MAKE_BAT) clean


$(ZLIB):
	cd $(ZLIB_DIR)
	$(MAKE) $(MAKE_ZLIB_ARG) $(ZLIB)
	cd ..\..\libjava

$(BZ2LIB):
	cd $(BZ2LIB_DIR)
	$(MAKE) $(MAKE_BZ2LIB_ARG) bz2.lib
	cd ..\..\libjava

!ifdef USEMINGW64
$(LIBFDM):
    set "PATH=C:\MSYS64\usr\bin;C:\MINGW\MSYS\1.0\bin;C:\MSYS\1.0\bin;%%PATH%%" & make -C support\fdlibm OUTDIR=$(LIBFDM_TARGET)
!else
! ifdef USEMINGW32
$(LIBFDM):
    set "PATH=C:\MSYS64\usr\bin;C:\MINGW\MSYS\1.0\bin;C:\MSYS\1.0\bin;%%PATH%%" & make -C support\fdlibm OUTDIR=$(LIBFDM_TARGET)
! else
$(LIBFDM):
    set "PATH=C:\MSYS64\usr\bin;C:\MINGW\MSYS\1.0\bin;C:\MSYS\1.0\bin;%%PATH%%" & make -C support\fdlibm
! endif
!endif         




test: $(TOP)\goodies\builder\reports\NUL
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	-del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)GroovyCompiler.$(O) GroovyCompiler.$(C) GroovyCompiler.$(H): GroovyCompiler.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)GroovyEvaluator.$(O) GroovyEvaluator.$(C) GroovyEvaluator.$(H): GroovyEvaluator.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)GroovyLanguage.$(O) GroovyLanguage.$(C) GroovyLanguage.$(H): GroovyLanguage.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProgrammingLanguage.$(H) $(STCHDR)
$(OUTDIR)GroovySourceFileWriter.$(O) GroovySourceFileWriter.$(C) GroovySourceFileWriter.$(H): GroovySourceFileWriter.st $(INCLUDE_TOP)\stx\libbasic\AbstractSourceFileWriter.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotation.$(O) JavaAnnotation.$(C) JavaAnnotation.$(H): JavaAnnotation.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationContainer.$(O) JavaAnnotationContainer.$(C) JavaAnnotationContainer.$(H): JavaAnnotationContainer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationDefault.$(O) JavaAnnotationDefault.$(C) JavaAnnotationDefault.$(H): JavaAnnotationDefault.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationDictionary.$(O) JavaAnnotationDictionary.$(C) JavaAnnotationDictionary.$(H): JavaAnnotationDictionary.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationValue.$(O) JavaAnnotationValue.$(C) JavaAnnotationValue.$(H): JavaAnnotationValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaArray.$(O) JavaArray.$(C) JavaArray.$(H): JavaArray.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)JavaBooleanArray.$(O) JavaBooleanArray.$(C) JavaBooleanArray.$(H): JavaBooleanArray.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\ByteArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)JavaByte.$(O) JavaByte.$(C) JavaByte.$(H): JavaByte.st $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\Integer.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaByteCodeProcessor.$(O) JavaByteCodeProcessor.$(C) JavaByteCodeProcessor.$(H): JavaByteCodeProcessor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaClassAccessor.$(O) JavaClassAccessor.$(C) JavaClassAccessor.$(H): JavaClassAccessor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaClassEnvironment.$(O) JavaClassEnvironment.$(C) JavaClassEnvironment.$(H): JavaClassEnvironment.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic3\SystemEnvironment.$(H) $(STCHDR)
$(OUTDIR)JavaClassQuery.$(O) JavaClassQuery.$(C) JavaClassQuery.$(H): JavaClassQuery.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Query.$(H) $(STCHDR)
$(OUTDIR)JavaClassReloader.$(O) JavaClassReloader.$(C) JavaClassReloader.$(H): JavaClassReloader.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaCodeLibraryOrBundle.$(O) JavaCodeLibraryOrBundle.$(C) JavaCodeLibraryOrBundle.$(H): JavaCodeLibraryOrBundle.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaCompilerForSmalltalkExtensionsOnly.$(O) JavaCompilerForSmalltalkExtensionsOnly.$(C) JavaCompilerForSmalltalkExtensionsOnly.$(H): JavaCompilerForSmalltalkExtensionsOnly.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaCompiler_Eclipse.$(O) JavaCompiler_Eclipse.$(C) JavaCompiler_Eclipse.$(H): JavaCompiler_Eclipse.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaConstantPool.$(O) JavaConstantPool.$(C) JavaConstantPool.$(H): JavaConstantPool.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)JavaConstants.$(O) JavaConstants.$(C) JavaConstants.$(H): JavaConstants.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SharedPool.$(H) $(STCHDR)
$(OUTDIR)JavaContext.$(O) JavaContext.$(C) JavaContext.$(H): JavaContext.st $(INCLUDE_TOP)\stx\libbasic\Context.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaDecompiler.$(O) JavaDecompiler.$(C) JavaDecompiler.$(H): JavaDecompiler.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaDescriptor.$(O) JavaDescriptor.$(C) JavaDescriptor.$(H): JavaDescriptor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaError.$(O) JavaError.$(C) JavaError.$(H): JavaError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaExceptionTable.$(O) JavaExceptionTable.$(C) JavaExceptionTable.$(H): JavaExceptionTable.st $(INCLUDE_TOP)\stx\libbasic\AbstractNumberVector.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UnboxedIntegerArray.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\WordArray.$(H) $(STCHDR)
$(OUTDIR)JavaField.$(O) JavaField.$(C) JavaField.$(H): JavaField.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaFinalizationRegistry.$(O) JavaFinalizationRegistry.$(C) JavaFinalizationRegistry.$(H): JavaFinalizationRegistry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaInnerClasses.$(O) JavaInnerClasses.$(C) JavaInnerClasses.$(H): JavaInnerClasses.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)JavaLanguage.$(O) JavaLanguage.$(C) JavaLanguage.$(H): JavaLanguage.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProgrammingLanguage.$(H) $(STCHDR)
$(OUTDIR)JavaLibraries.$(O) JavaLibraries.$(C) JavaLibraries.$(H): JavaLibraries.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaLocalVariableTable.$(O) JavaLocalVariableTable.$(C) JavaLocalVariableTable.$(H): JavaLocalVariableTable.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)JavaLocalVariableTableEntry.$(O) JavaLocalVariableTableEntry.$(C) JavaLocalVariableTableEntry.$(H): JavaLocalVariableTableEntry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaLookup.$(O) JavaLookup.$(C) JavaLookup.$(H): JavaLookup.st $(INCLUDE_TOP)\stx\libbasic\Lookup.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaMetaclass.$(O) JavaMetaclass.$(C) JavaMetaclass.$(H): JavaMetaclass.st $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Metaclass.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaMonitor.$(O) JavaMonitor.$(C) JavaMonitor.$(H): JavaMonitor.st $(INCLUDE_TOP)\stx\libbasic\AbstractLock.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaNameAndType2.$(O) JavaNameAndType2.$(C) JavaNameAndType2.$(H): JavaNameAndType2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMemory.$(O) JavaNativeMemory.$(C) JavaNativeMemory.$(H): JavaNativeMemory.st $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaNioSupport.$(O) JavaNioSupport.$(C) JavaNioSupport.$(H): JavaNioSupport.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaObject.$(O) JavaObject.$(C) JavaObject.$(H): JavaObject.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaObjectDictionary.$(O) JavaObjectDictionary.$(C) JavaObjectDictionary.$(H): JavaObjectDictionary.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaPopUpView.$(O) JavaPopUpView.$(C) JavaPopUpView.$(H): JavaPopUpView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\PopUpView.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)JavaProcess.$(O) JavaProcess.$(C) JavaProcess.$(H): JavaProcess.st $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Process.$(H) $(STCHDR)
$(OUTDIR)JavaRef2.$(O) JavaRef2.$(C) JavaRef2.$(H): JavaRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaRelease.$(O) JavaRelease.$(C) JavaRelease.$(H): JavaRelease.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaResolver.$(O) JavaResolver.$(C) JavaResolver.$(H): JavaResolver.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaShort.$(O) JavaShort.$(C) JavaShort.$(H): JavaShort.st $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\Integer.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaSocket.$(O) JavaSocket.$(C) JavaSocket.$(H): JavaSocket.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic2\Socket.$(H) $(STCHDR)
$(OUTDIR)JavaSourceCodeCache.$(O) JavaSourceCodeCache.$(C) JavaSourceCodeCache.$(H): JavaSourceCodeCache.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaSourceFileWriter.$(O) JavaSourceFileWriter.$(C) JavaSourceFileWriter.$(H): JavaSourceFileWriter.st $(INCLUDE_TOP)\stx\libbasic\AbstractSourceFileWriter.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaTestsLoader.$(O) JavaTestsLoader.$(C) JavaTestsLoader.$(H): JavaTestsLoader.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaTopView.$(O) JavaTopView.$(C) JavaTopView.$(H): JavaTopView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\StandardSystemView.$(H) $(INCLUDE_TOP)\stx\libview\TopView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)JavaUnresolvedCompilationError.$(O) JavaUnresolvedCompilationError.$(C) JavaUnresolvedCompilationError.$(H): JavaUnresolvedCompilationError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaUnresolvedConstant.$(O) JavaUnresolvedConstant.$(C) JavaUnresolvedConstant.$(H): JavaUnresolvedConstant.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaUtilities.$(O) JavaUtilities.$(C) JavaUtilities.$(H): JavaUtilities.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaVMData.$(O) JavaVMData.$(C) JavaVMData.$(H): JavaVMData.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SharedPool.$(H) $(STCHDR)
$(OUTDIR)JavaView.$(O) JavaView.$(C) JavaView.$(H): JavaView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)JavaZipDeflater.$(O) JavaZipDeflater.$(C) JavaZipDeflater.$(H): JavaZipDeflater.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JavaZipFile.$(O) JavaZipFile.$(C) JavaZipFile.$(H): JavaZipFile.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\ZipArchive.$(H) $(STCHDR)
$(OUTDIR)JavaZipInflater.$(O) JavaZipInflater.$(C) JavaZipInflater.$(H): JavaZipInflater.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ProxyMethod.$(O) ProxyMethod.$(C) ProxyMethod.$(H): ProxyMethod.st $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Method.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodCompiler.$(O) ProxyMethodCompiler.$(C) ProxyMethodCompiler.$(H): ProxyMethodCompiler.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodNode.$(O) ProxyMethodNode.$(C) ProxyMethodNode.$(H): ProxyMethodNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmalltalkAppletContext.$(O) SmalltalkAppletContext.$(C) SmalltalkAppletContext.$(H): SmalltalkAppletContext.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmalltalkAppletStub.$(O) SmalltalkAppletStub.$(C) SmalltalkAppletStub.$(H): SmalltalkAppletStub.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)stx_libjava.$(O) stx_libjava.$(C) stx_libjava.$(H): stx_libjava.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)
$(OUTDIR)GroovyMetaclass.$(O) GroovyMetaclass.$(C) GroovyMetaclass.$(H): GroovyMetaclass.st $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Metaclass.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMetaclass.$(H) $(STCHDR)
$(OUTDIR)Java.$(O) Java.$(C) Java.$(H): Java.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationArrayValue.$(O) JavaAnnotationArrayValue.$(C) JavaAnnotationArrayValue.$(H): JavaAnnotationArrayValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationValue.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationClassValue.$(O) JavaAnnotationClassValue.$(C) JavaAnnotationClassValue.$(H): JavaAnnotationClassValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationValue.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationEnumValue.$(O) JavaAnnotationEnumValue.$(C) JavaAnnotationEnumValue.$(H): JavaAnnotationEnumValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationValue.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationNestedAnnotationValue.$(O) JavaAnnotationNestedAnnotationValue.$(C) JavaAnnotationNestedAnnotationValue.$(H): JavaAnnotationNestedAnnotationValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationValue.$(H) $(STCHDR)
$(OUTDIR)JavaAnnotationPrimitiveValue.$(O) JavaAnnotationPrimitiveValue.$(C) JavaAnnotationPrimitiveValue.$(H): JavaAnnotationPrimitiveValue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationValue.$(H) $(STCHDR)
$(OUTDIR)JavaBehavior.$(O) JavaBehavior.$(C) JavaBehavior.$(H): JavaBehavior.st $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaByteCodeDisassembler.$(O) JavaByteCodeDisassembler.$(C) JavaByteCodeDisassembler.$(H): JavaByteCodeDisassembler.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessor.$(H) $(STCHDR)
$(OUTDIR)JavaByteCodeProcessorAdapter.$(O) JavaByteCodeProcessorAdapter.$(C) JavaByteCodeProcessorAdapter.$(H): JavaByteCodeProcessorAdapter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessor.$(H) $(STCHDR)
$(OUTDIR)JavaClassAnnotationContainer.$(O) JavaClassAnnotationContainer.$(C) JavaClassAnnotationContainer.$(H): JavaClassAnnotationContainer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationContainer.$(H) $(STCHDR)
$(OUTDIR)JavaClassFormatError.$(O) JavaClassFormatError.$(C) JavaClassFormatError.$(H): JavaClassFormatError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaError.$(H) $(STCHDR)
$(OUTDIR)JavaClassMemberRef2.$(O) JavaClassMemberRef2.$(C) JavaClassMemberRef2.$(H): JavaClassMemberRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaClassReader.$(O) JavaClassReader.$(C) JavaClassReader.$(H): JavaClassReader.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(STCHDR)
$(OUTDIR)JavaClassRef2.$(O) JavaClassRef2.$(C) JavaClassRef2.$(H): JavaClassRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaClassRegistry.$(O) JavaClassRegistry.$(C) JavaClassRegistry.$(H): JavaClassRegistry.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic3\SystemEnvironment.$(H) $(INCLUDE_TOP)\stx\libjava\JavaClassEnvironment.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaCodeBundle.$(O) JavaCodeBundle.$(C) JavaCodeBundle.$(H): JavaCodeBundle.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaCodeLibraryOrBundle.$(H) $(STCHDR)
$(OUTDIR)JavaCodeLibrary.$(O) JavaCodeLibrary.$(C) JavaCodeLibrary.$(H): JavaCodeLibrary.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaCodeLibraryOrBundle.$(H) $(STCHDR)
$(OUTDIR)JavaEmbeddedFrameView.$(O) JavaEmbeddedFrameView.$(C) JavaEmbeddedFrameView.$(H): JavaEmbeddedFrameView.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaView.$(H) $(INCLUDE_TOP)\stx\libview\DisplaySurface.$(H) $(INCLUDE_TOP)\stx\libview\GraphicsMedium.$(H) $(INCLUDE_TOP)\stx\libview\SimpleView.$(H) $(INCLUDE_TOP)\stx\libview\View.$(H) $(STCHDR)
$(OUTDIR)JavaFieldAnnotationContainer.$(O) JavaFieldAnnotationContainer.$(C) JavaFieldAnnotationContainer.$(H): JavaFieldAnnotationContainer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationContainer.$(H) $(STCHDR)
$(OUTDIR)JavaFieldDescriptor.$(O) JavaFieldDescriptor.$(C) JavaFieldDescriptor.$(H): JavaFieldDescriptor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaDescriptor.$(H) $(STCHDR)
$(OUTDIR)JavaFieldDescriptorWithUnionType.$(O) JavaFieldDescriptorWithUnionType.$(C) JavaFieldDescriptorWithUnionType.$(H): JavaFieldDescriptorWithUnionType.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaDescriptor.$(H) $(STCHDR)
$(OUTDIR)JavaInvokeDynamic2.$(O) JavaInvokeDynamic2.$(C) JavaInvokeDynamic2.$(H): JavaInvokeDynamic2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMethod.$(O) JavaMethod.$(C) JavaMethod.$(H): JavaMethod.st $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(STCHDR)
$(OUTDIR)JavaMethodAnnotationContainer.$(O) JavaMethodAnnotationContainer.$(C) JavaMethodAnnotationContainer.$(H): JavaMethodAnnotationContainer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaAnnotationContainer.$(H) $(STCHDR)
$(OUTDIR)JavaMethodDescriptor.$(O) JavaMethodDescriptor.$(C) JavaMethodDescriptor.$(H): JavaMethodDescriptor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaDescriptor.$(H) $(STCHDR)
$(OUTDIR)JavaMethodHandle2.$(O) JavaMethodHandle2.$(C) JavaMethodHandle2.$(H): JavaMethodHandle2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMethodType2.$(O) JavaMethodType2.$(C) JavaMethodType2.$(H): JavaMethodType2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMirror.$(O) JavaMirror.$(C) JavaMirror.$(H): JavaMirror.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_OpenJDK6.$(O) JavaNativeMethodImpl_OpenJDK6.$(C) JavaNativeMethodImpl_OpenJDK6.$(H): JavaNativeMethodImpl_OpenJDK6.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaStringRef2.$(O) JavaStringRef2.$(C) JavaStringRef2.$(H): JavaStringRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaUnhandledExceptionError.$(O) JavaUnhandledExceptionError.$(C) JavaUnhandledExceptionError.$(H): JavaUnhandledExceptionError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaError.$(H) $(STCHDR)
$(OUTDIR)JavaUnhandledThreadDeathError.$(O) JavaUnhandledThreadDeathError.$(C) JavaUnhandledThreadDeathError.$(H): JavaUnhandledThreadDeathError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaError.$(H) $(STCHDR)
$(OUTDIR)JavaUnresolvedClassConstant.$(O) JavaUnresolvedClassConstant.$(C) JavaUnresolvedClassConstant.$(H): JavaUnresolvedClassConstant.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaUnresolvedConstant.$(H) $(STCHDR)
$(OUTDIR)JavaUnresolvedStringConstant.$(O) JavaUnresolvedStringConstant.$(C) JavaUnresolvedStringConstant.$(H): JavaUnresolvedStringConstant.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaUnresolvedConstant.$(H) $(STCHDR)
$(OUTDIR)JavaVM.$(O) JavaVM.$(C) JavaVM.$(H): JavaVM.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodConditionNode.$(O) ProxyMethodConditionNode.$(C) ProxyMethodConditionNode.$(H): ProxyMethodConditionNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodGuardNode.$(O) ProxyMethodGuardNode.$(C) ProxyMethodGuardNode.$(H): ProxyMethodGuardNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodInvocationNode.$(O) ProxyMethodInvocationNode.$(C) ProxyMethodInvocationNode.$(H): ProxyMethodInvocationNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodJavaFieldAccessor.$(O) ProxyMethodJavaFieldAccessor.$(C) ProxyMethodJavaFieldAccessor.$(H): ProxyMethodJavaFieldAccessor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)JavaAlienMirror.$(O) JavaAlienMirror.$(C) JavaAlienMirror.$(H): JavaAlienMirror.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMirror.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaArrayMirror.$(O) JavaArrayMirror.$(C) JavaArrayMirror.$(H): JavaArrayMirror.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMirror.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaByteCodePreresolver.$(O) JavaByteCodePreresolver.$(C) JavaByteCodePreresolver.$(H): JavaByteCodePreresolver.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessor.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessorAdapter.$(H) $(STCHDR)
$(OUTDIR)JavaClass.$(O) JavaClass.$(C) JavaClass.$(H): JavaClass.st $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\KeyedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\MethodDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaBehavior.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaClassMirror.$(O) JavaClassMirror.$(C) JavaClassMirror.$(H): JavaClassMirror.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMirror.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaClassPathBundle.$(O) JavaClassPathBundle.$(C) JavaClassPathBundle.$(H): JavaClassPathBundle.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaCodeBundle.$(H) $(INCLUDE_TOP)\stx\libjava\JavaCodeLibraryOrBundle.$(H) $(STCHDR)
$(OUTDIR)JavaFieldRef2.$(O) JavaFieldRef2.$(C) JavaFieldRef2.$(H): JavaFieldRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaClassMemberRef2.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMethodAnalyzer.$(O) JavaMethodAnalyzer.$(C) JavaMethodAnalyzer.$(H): JavaMethodAnalyzer.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessor.$(H) $(INCLUDE_TOP)\stx\libjava\JavaByteCodeProcessorAdapter.$(H) $(STCHDR)
$(OUTDIR)JavaMethodRef2.$(O) JavaMethodRef2.$(C) JavaMethodRef2.$(H): JavaMethodRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaClassMemberRef2.$(H) $(INCLUDE_TOP)\stx\libjava\JavaConstants.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMethodWithException.$(O) JavaMethodWithException.$(C) JavaMethodWithException.$(H): JavaMethodWithException.st $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethod.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_AppleJDK6.$(O) JavaNativeMethodImpl_AppleJDK6.$(C) JavaNativeMethodImpl_AppleJDK6.$(H): JavaNativeMethodImpl_AppleJDK6.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_OpenJDK7.$(O) JavaNativeMethodImpl_OpenJDK7.$(C) JavaNativeMethodImpl_OpenJDK7.$(H): JavaNativeMethodImpl_OpenJDK7.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_SunJDK6.$(O) JavaNativeMethodImpl_SunJDK6.$(C) JavaNativeMethodImpl_SunJDK6.$(H): JavaNativeMethodImpl_SunJDK6.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(STCHDR)
$(OUTDIR)JavaPrimitiveMirror.$(O) JavaPrimitiveMirror.$(C) JavaPrimitiveMirror.$(H): JavaPrimitiveMirror.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMirror.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodAndNode.$(O) ProxyMethodAndNode.$(C) ProxyMethodAndNode.$(H): ProxyMethodAndNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodConditionNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodBlockInvocationNode.$(O) ProxyMethodBlockInvocationNode.$(C) ProxyMethodBlockInvocationNode.$(H): ProxyMethodBlockInvocationNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodInvocationNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodJavaFieldGetter.$(O) ProxyMethodJavaFieldGetter.$(C) ProxyMethodJavaFieldGetter.$(H): ProxyMethodJavaFieldGetter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodJavaFieldAccessor.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodJavaFieldSetter.$(O) ProxyMethodJavaFieldSetter.$(C) ProxyMethodJavaFieldSetter.$(H): ProxyMethodJavaFieldSetter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodJavaFieldAccessor.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodMethodInvocationNode.$(O) ProxyMethodMethodInvocationNode.$(C) ProxyMethodMethodInvocationNode.$(H): ProxyMethodMethodInvocationNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodInvocationNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodTypeCheckNode.$(O) ProxyMethodTypeCheckNode.$(C) ProxyMethodTypeCheckNode.$(H): ProxyMethodTypeCheckNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodConditionNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)GroovyClass.$(O) GroovyClass.$(C) GroovyClass.$(H): GroovyClass.st $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaBehavior.$(H) $(INCLUDE_TOP)\stx\libjava\JavaClass.$(H) $(STCHDR)
$(OUTDIR)JavaInterfaceMethodRef2.$(O) JavaInterfaceMethodRef2.$(C) JavaInterfaceMethodRef2.$(H): JavaInterfaceMethodRef2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaClassMemberRef2.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethodRef2.$(H) $(INCLUDE_TOP)\stx\libjava\JavaRef2.$(H) $(STCHDR)
$(OUTDIR)JavaMethodWithHandler.$(O) JavaMethodWithHandler.$(C) JavaMethodWithHandler.$(H): JavaMethodWithHandler.st $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethod.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethodWithException.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_OpenJDK8.$(O) JavaNativeMethodImpl_OpenJDK8.$(C) JavaNativeMethodImpl_OpenJDK8.$(H): JavaNativeMethodImpl_OpenJDK8.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK7.$(H) $(INCLUDE_TOP)\stx\libjava\JavaVMData.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_OracleJDK7.$(O) JavaNativeMethodImpl_OracleJDK7.$(C) JavaNativeMethodImpl_OracleJDK7.$(H): JavaNativeMethodImpl_OracleJDK7.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK7.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodJavaMethodInvocationNode.$(O) ProxyMethodJavaMethodInvocationNode.$(C) ProxyMethodJavaMethodInvocationNode.$(H): ProxyMethodJavaMethodInvocationNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodInvocationNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodMethodInvocationNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(STCHDR)
$(OUTDIR)ProxyMethodJavaTypeCheckNode.$(O) ProxyMethodJavaTypeCheckNode.$(C) ProxyMethodJavaTypeCheckNode.$(H): ProxyMethodJavaTypeCheckNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodConditionNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodNode.$(H) $(INCLUDE_TOP)\stx\libjava\ProxyMethodTypeCheckNode.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethod.$(O) JavaNativeMethod.$(C) JavaNativeMethod.$(H): JavaNativeMethod.st $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethod.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethodWithException.$(H) $(INCLUDE_TOP)\stx\libjava\JavaMethodWithHandler.$(H) $(STCHDR)
$(OUTDIR)JavaNativeMethodImpl_OracleJDK8.$(O) JavaNativeMethodImpl_OracleJDK8.$(C) JavaNativeMethodImpl_OracleJDK8.$(H): JavaNativeMethodImpl_OracleJDK8.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK6.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK7.$(H) $(INCLUDE_TOP)\stx\libjava\JavaNativeMethodImpl_OpenJDK8.$(H) $(STCHDR)
$(OUTDIR)extensions.$(O): extensions.st $(INCLUDE_TOP)\stx\libbasic\AbstractNumberVector.$(H) $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Behavior.$(H) $(INCLUDE_TOP)\stx\libbasic\Boolean.$(H) $(INCLUDE_TOP)\stx\libbasic\ByteArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Character.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Class.$(H) $(INCLUDE_TOP)\stx\libbasic\ClassDescription.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\CompiledCode.$(H) $(INCLUDE_TOP)\stx\libbasic\ConfigurableFeatures.$(H) $(INCLUDE_TOP)\stx\libbasic\Delay.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\DoubleArray.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutableFunction.$(H) $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Float.$(H) $(INCLUDE_TOP)\stx\libbasic\FloatArray.$(H) $(INCLUDE_TOP)\stx\libbasic\IdentityDictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Integer.$(H) $(INCLUDE_TOP)\stx\libbasic\LargeInteger.$(H) $(INCLUDE_TOP)\stx\libbasic\LimitedPrecisionReal.$(H) $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Method.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Process.$(H) $(INCLUDE_TOP)\stx\libbasic\ProgrammingLanguage.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Semaphore.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic\ShortFloat.$(H) $(INCLUDE_TOP)\stx\libbasic\SignedIntegerArray.$(H) $(INCLUDE_TOP)\stx\libbasic\SignedLongIntegerArray.$(H) $(INCLUDE_TOP)\stx\libbasic\SignedWordArray.$(H) $(INCLUDE_TOP)\stx\libbasic\SmallInteger.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\String.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UnboxedIntegerArray.$(H) $(INCLUDE_TOP)\stx\libbasic\UndefinedObject.$(H) $(INCLUDE_TOP)\stx\libbasic\Unicode16String.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\UserPreferences.$(H) $(INCLUDE_TOP)\stx\libbasic\WordArray.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic2\Socket.$(H) $(INCLUDE_TOP)\stx\libbasic2\ZipArchive.$(H) $(INCLUDE_TOP)\stx\libbasic3\WrappedMethod.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line

# **Must be at end**

# Enforce recompilation of package definition class if Mercurial working
# copy state changes. Together with --guessVersion it ensures that package
# definition class always contains correct binary revision string.
!IFDEF HGROOT
$(OUTDIR)stx_libjava.$(O): $(HGROOT)\.hg\dirstate
!ENDIF
