# $Header$
#
# DO NOT EDIT
# automagically generated from the projectDefinition: stx_libbasic2.
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


# see stdHeader_bc for LIBBASIC2_BASE
LIB_BASE=$(LIBBASIC2_BASE)


!INCLUDE $(TOP)\rules\stdHeader_bc

!INCLUDE Make.spec

LIBNAME=libstx_libbasic2
MODULE_PATH=libbasic2
RESFILES=stx_libbasic2WINrc.$(RES)


!ifdef USEBC
WINSOCK_LIB=ws2_32.lib
!else
WINSOCK_LIB=
!endif


LOCALINCLUDES=-I$(ZLIB_DIR) -I$(BZ2LIB_DIR) -I$(INCLUDE_TOP)\stx\libbasic
LOCALDEFINES=

STCLOCALOPT=-package=$(PACKAGE) -I. $(LOCALINCLUDES) -headerDir=. $(STCLOCALOPTIMIZATIONS) $(STCWARNINGS) $(LOCALDEFINES) $(COMMONSYMBOLS) -varPrefix=$(LIBNAME)
LOCALLIBS=$(ZLIB_DIR)\$(ZLIB) $(BZ2LIB) $(WINSOCK_LIB)

OBJS= $(COMMON_OBJS) $(WIN32_OBJS)

ALL:: $(ZLIB) $(BZ2LIB) classLibRule

classLibRule: $(OUTDIR) $(OUTDIR)$(LIBNAME).dll

!INCLUDE $(TOP)\rules\stdRules_bc

# build all mandatory prerequisite packages (containing superclasses) for this package
prereq:
	pushd ..\libbasic & $(MAKE_BAT) "CFLAGS_LOCAL=$(GLOBALDEFINES) "




$(ZLIB):
	cd $(ZLIB_DIR)
	$(MAKE_BAT)
	cd ..\..\libbasic2

$(BZ2LIB):
	cd $(BZ2LIB_DIR)
	$(MAKE_BAT) 
	cd ..\..\libbasic2




test: $(TOP)\goodies\builder\reports\NUL
	pushd $(TOP)\goodies\builder\reports & $(MAKE_BAT)
	$(TOP)\goodies\builder\reports\report-runner.bat -D . -r Builder::TestReport -p $(PACKAGE)
        
clean::
	del *.$(CSUFFIX)


# BEGINMAKEDEPEND --- do not remove this line; make depend needs it
$(OUTDIR)AVLTree.$(O) AVLTree.$(C) AVLTree.$(H): AVLTree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)AbstractBackgroundJob.$(O) AbstractBackgroundJob.$(C) AbstractBackgroundJob.$(H): AbstractBackgroundJob.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ActiveObject.$(O) ActiveObject.$(C) ActiveObject.$(H): ActiveObject.st $(INCLUDE_TOP)\stx\libbasic\Lookup.$(H) $(INCLUDE_TOP)\stx\libbasic\Message.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ActorStream.$(O) ActorStream.$(C) ActorStream.$(H): ActorStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Archiver.$(O) Archiver.$(C) Archiver.$(H): Archiver.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)AutoResizingOrderedCollection.$(O) AutoResizingOrderedCollection.$(C) AutoResizingOrderedCollection.$(H): AutoResizingOrderedCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)BIG5EncodedString.$(O) BIG5EncodedString.$(C) BIG5EncodedString.$(H): BIG5EncodedString.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)BTree.$(O) BTree.$(C) BTree.$(H): BTree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BaseNCoder.$(O) BaseNCoder.$(C) BaseNCoder.$(H): BaseNCoder.st $(INCLUDE_TOP)\stx\libbasic\AspectVisitor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ObjectCoder.$(H) $(INCLUDE_TOP)\stx\libbasic\Visitor.$(H) $(STCHDR)
$(OUTDIR)Bezier.$(O) Bezier.$(C) Bezier.$(H): Bezier.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BinaryTree.$(O) BinaryTree.$(C) BinaryTree.$(H): BinaryTree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BinaryTreeNode.$(O) BinaryTreeNode.$(C) BinaryTreeNode.$(H): BinaryTreeNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)BoltLock.$(O) BoltLock.$(C) BoltLock.$(H): BoltLock.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CRC32Stream.$(O) CRC32Stream.$(C) CRC32Stream.$(H): CRC32Stream.st $(INCLUDE_TOP)\stx\libbasic\HashStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)CacheDictionary.$(O) CacheDictionary.$(C) CacheDictionary.$(H): CacheDictionary.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)CachedValue.$(O) CachedValue.$(C) CachedValue.$(H): CachedValue.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\ExecutionError.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\NotFoundError.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProceedableError.$(H) $(STCHDR)
$(OUTDIR)CharacterSet.$(O) CharacterSet.$(C) CharacterSet.$(H): CharacterSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Circle.$(O) Circle.$(C) Circle.$(H): Circle.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)CollectingReadStream.$(O) CollectingReadStream.$(C) CollectingReadStream.$(H): CollectingReadStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)CollectingSharedQueueStream.$(O) CollectingSharedQueueStream.$(C) CollectingSharedQueueStream.$(H): CollectingSharedQueueStream.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)CompressionStream.$(O) CompressionStream.$(C) CompressionStream.$(H): CompressionStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Cons.$(O) Cons.$(C) Cons.$(H): Cons.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)ConsStream.$(O) ConsStream.$(C) ConsStream.$(H): ConsStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Curve.$(O) Curve.$(C) Curve.$(H): Curve.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)DirectoryContents.$(O) DirectoryContents.$(C) DirectoryContents.$(H): DirectoryContents.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)DoubleLink.$(O) DoubleLink.$(C) DoubleLink.$(H): DoubleLink.st $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)EllipticalArc.$(O) EllipticalArc.$(C) EllipticalArc.$(H): EllipticalArc.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ExternalLong.$(O) ExternalLong.$(C) ExternalLong.$(H): ExternalLong.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\ExternalBytes.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)FileSorter.$(O) FileSorter.$(C) FileSorter.$(H): FileSorter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)FileText.$(O) FileText.$(C) FileText.$(H): FileText.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\StringCollection.$(H) $(STCHDR)
$(OUTDIR)FilteringStream.$(O) FilteringStream.$(C) FilteringStream.$(H): FilteringStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)FourByteString.$(O) FourByteString.$(C) FourByteString.$(H): FourByteString.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)Future.$(O) Future.$(C) Future.$(H): Future.st $(INCLUDE_TOP)\stx\libbasic\ProtoObject.$(H) $(STCHDR)
$(OUTDIR)GBEncodedString.$(O) GBEncodedString.$(C) GBEncodedString.$(H): GBEncodedString.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)GeometricSeries.$(O) GeometricSeries.$(C) GeometricSeries.$(H): GeometricSeries.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadOnlySequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)HTMLUtilities.$(O) HTMLUtilities.$(C) HTMLUtilities.$(H): HTMLUtilities.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)HalfFloatArray.$(O) HalfFloatArray.$(C) HalfFloatArray.$(H): HalfFloatArray.st $(INCLUDE_TOP)\stx\libbasic\AbstractNumberVector.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)HandlerCollection.$(O) HandlerCollection.$(C) HandlerCollection.$(H): HandlerCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)Heap.$(O) Heap.$(C) Heap.$(H): Heap.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)IdentityBag.$(O) IdentityBag.$(C) IdentityBag.$(H): IdentityBag.st $(INCLUDE_TOP)\stx\libbasic\Bag.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)IncrementNotification.$(O) IncrementNotification.$(C) IncrementNotification.$(H): IncrementNotification.st $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Notification.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)InterestConverterWithParameters.$(O) InterestConverterWithParameters.$(C) InterestConverterWithParameters.$(H): InterestConverterWithParameters.st $(INCLUDE_TOP)\stx\libbasic\InterestConverter.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)InternalPipeStream.$(O) InternalPipeStream.$(C) InternalPipeStream.$(H): InternalPipeStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Iterator.$(O) Iterator.$(C) Iterator.$(H): Iterator.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)JISEncodedString.$(O) JISEncodedString.$(C) JISEncodedString.$(H): JISEncodedString.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)KSCEncodedString.$(O) KSCEncodedString.$(C) KSCEncodedString.$(H): KSCEncodedString.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\TwoByteString.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)KeywordInContextIndexBuilder.$(O) KeywordInContextIndexBuilder.$(C) KeywordInContextIndexBuilder.$(H): KeywordInContextIndexBuilder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Lazy.$(O) Lazy.$(C) Lazy.$(H): Lazy.st $(INCLUDE_TOP)\stx\libbasic\ProtoObject.$(H) $(STCHDR)
$(OUTDIR)LazyArray.$(O) LazyArray.$(C) LazyArray.$(H): LazyArray.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)LazyValue.$(O) LazyValue.$(C) LazyValue.$(H): LazyValue.st $(INCLUDE_TOP)\stx\libbasic\ProtoObject.$(H) $(STCHDR)
$(OUTDIR)LineSegment.$(O) LineSegment.$(C) LineSegment.$(H): LineSegment.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)List.$(O) List.$(C) List.$(H): List.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)LoggingStream.$(O) LoggingStream.$(C) LoggingStream.$(H): LoggingStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)MacPlistBinaryDecoder.$(O) MacPlistBinaryDecoder.$(C) MacPlistBinaryDecoder.$(H): MacPlistBinaryDecoder.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MappedCollection.$(O) MappedCollection.$(C) MappedCollection.$(H): MappedCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MessageChannel.$(O) MessageChannel.$(C) MessageChannel.$(H): MessageChannel.st $(INCLUDE_TOP)\stx\libbasic\Message.$(H) $(INCLUDE_TOP)\stx\libbasic\MessageSend.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Monitor.$(O) Monitor.$(C) Monitor.$(H): Monitor.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)MultiReadStream.$(O) MultiReadStream.$(C) MultiReadStream.$(H): MultiReadStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)NameLookupError.$(O) NameLookupError.$(C) NameLookupError.$(H): NameLookupError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProceedableError.$(H) $(STCHDR)
$(OUTDIR)NumberSet.$(O) NumberSet.$(C) NumberSet.$(H): NumberSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)OperationQueue.$(O) OperationQueue.$(C) OperationQueue.$(H): OperationQueue.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PhoneticStringUtilities.$(O) PhoneticStringUtilities.$(C) PhoneticStringUtilities.$(H): PhoneticStringUtilities.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PluggableDictionary.$(O) PluggableDictionary.$(C) PluggableDictionary.$(H): PluggableDictionary.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)PluggableSet.$(O) PluggableSet.$(C) PluggableSet.$(H): PluggableSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)Polygon.$(O) Polygon.$(C) Polygon.$(H): Polygon.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PowerSet.$(O) PowerSet.$(C) PowerSet.$(H): PowerSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PrinterStream.$(O) PrinterStream.$(C) PrinterStream.$(H): PrinterStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)PrintfScanf.$(O) PrintfScanf.$(C) PrintfScanf.$(H): PrintfScanf.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)PriorityQueue.$(O) PriorityQueue.$(C) PriorityQueue.$(H): PriorityQueue.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Promise.$(O) Promise.$(C) Promise.$(H): Promise.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Queue.$(O) Queue.$(C) Queue.$(H): Queue.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Random.$(O) Random.$(C) Random.$(H): Random.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)RandomBlumBlumShub.$(O) RandomBlumBlumShub.$(C) RandomBlumBlumShub.$(H): RandomBlumBlumShub.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomKISS.$(O) RandomKISS.$(C) RandomKISS.$(H): RandomKISS.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomKISS2.$(O) RandomKISS2.$(C) RandomKISS2.$(H): RandomKISS2.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomMT19937.$(O) RandomMT19937.$(C) RandomMT19937.$(H): RandomMT19937.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomParkMiller.$(O) RandomParkMiller.$(C) RandomParkMiller.$(H): RandomParkMiller.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomRDRand.$(O) RandomRDRand.$(C) RandomRDRand.$(H): RandomRDRand.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)RandomTT800.$(O) RandomTT800.$(C) RandomTT800.$(H): RandomTT800.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)ReindexedCollection.$(O) ReindexedCollection.$(C) ReindexedCollection.$(H): ReindexedCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)RunArray.$(O) RunArray.$(C) RunArray.$(H): RunArray.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)SegmentedOrderedCollection.$(O) SegmentedOrderedCollection.$(C) SegmentedOrderedCollection.$(H): SegmentedOrderedCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)SelectingReadStream.$(O) SelectingReadStream.$(C) SelectingReadStream.$(H): SelectingReadStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)SequenceWithSentinel.$(O) SequenceWithSentinel.$(C) SequenceWithSentinel.$(H): SequenceWithSentinel.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)SequenceableCollectionSorter.$(O) SequenceableCollectionSorter.$(C) SequenceableCollectionSorter.$(H): SequenceableCollectionSorter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SerialPort.$(O) SerialPort.$(C) SerialPort.$(H): SerialPort.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)SharedCollection.$(O) SharedCollection.$(C) SharedCollection.$(H): SharedCollection.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Singleton.$(O) Singleton.$(C) Singleton.$(H): Singleton.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SmallBag.$(O) SmallBag.$(C) SmallBag.$(H): SmallBag.st $(INCLUDE_TOP)\stx\libbasic\Bag.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Socket.$(O) Socket.$(C) Socket.$(H): Socket.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)SocketAddress.$(O) SocketAddress.$(C) SocketAddress.$(H): SocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)SocketAddressInfo.$(O) SocketAddressInfo.$(C) SocketAddressInfo.$(H): SocketAddressInfo.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SortedSet.$(O) SortedSet.$(C) SortedSet.$(H): SortedSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedSet.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)SoundStream.$(O) SoundStream.$(C) SoundStream.$(H): SoundStream.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\FileStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)Spline.$(O) Spline.$(C) Spline.$(H): Spline.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)SplittingWriteStream.$(O) SplittingWriteStream.$(C) SplittingWriteStream.$(H): SplittingWriteStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(STCHDR)
$(OUTDIR)Stack.$(O) Stack.$(C) Stack.$(H): Stack.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)StringPattern.$(O) StringPattern.$(C) StringPattern.$(H): StringPattern.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)StringUtilities.$(O) StringUtilities.$(C) StringUtilities.$(H): StringUtilities.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TSTree.$(O) TSTree.$(C) TSTree.$(H): TSTree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TSTreeNode.$(O) TSTreeNode.$(C) TSTreeNode.$(H): TSTreeNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TerminalSession.$(O) TerminalSession.$(C) TerminalSession.$(H): TerminalSession.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Text.$(O) Text.$(C) Text.$(H): Text.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)TextClassifier.$(O) TextClassifier.$(C) TextClassifier.$(H): TextClassifier.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)TextStream.$(O) TextStream.$(C) TextStream.$(H): TextStream.st $(INCLUDE_TOP)\stx\libbasic\CharacterWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)TreeSet.$(O) TreeSet.$(C) TreeSet.$(H): TreeSet.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)Trie.$(O) Trie.$(C) Trie.$(H): Trie.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(STCHDR)
$(OUTDIR)URI.$(O) URI.$(C) URI.$(H): URI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)UUID.$(O) UUID.$(C) UUID.$(H): UUID.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\ByteArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)
$(OUTDIR)UndoSupport.$(O) UndoSupport.$(C) UndoSupport.$(H): UndoSupport.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)UnitConverter.$(O) UnitConverter.$(C) UnitConverter.$(H): UnitConverter.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)UnixPTYStream.$(O) UnixPTYStream.$(C) UnixPTYStream.$(H): UnixPTYStream.st $(INCLUDE_TOP)\stx\libbasic\ExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\NonPositionableExternalStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PipeStream.$(H) $(INCLUDE_TOP)\stx\libbasic\PositionableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\ReadWriteStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\WriteStream.$(H) $(STCHDR)
$(OUTDIR)ValueLink.$(O) ValueLink.$(C) ValueLink.$(H): ValueLink.st $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(STCHDR)
$(OUTDIR)VirtualArray.$(O) VirtualArray.$(C) VirtualArray.$(H): VirtualArray.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(STCHDR)
$(OUTDIR)ZipArchiveConstants.$(O) ZipArchiveConstants.$(C) ZipArchiveConstants.$(H): ZipArchiveConstants.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SharedPool.$(H) $(STCHDR)
$(OUTDIR)stx_libbasic2.$(O) stx_libbasic2.$(C) stx_libbasic2.$(H): stx_libbasic2.st $(INCLUDE_TOP)\stx\libbasic\LibraryDefinition.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProjectDefinition.$(H) $(STCHDR)
$(OUTDIR)AATree.$(O) AATree.$(C) AATree.$(H): AATree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\BinaryTree.$(H) $(STCHDR)
$(OUTDIR)AATreeNode.$(O) AATreeNode.$(C) AATreeNode.$(H): AATreeNode.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\BinaryTreeNode.$(H) $(STCHDR)
$(OUTDIR)AppletalkSocketAddress.$(O) AppletalkSocketAddress.$(C) AppletalkSocketAddress.$(H): AppletalkSocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\SocketAddress.$(H) $(STCHDR)
$(OUTDIR)Arrow.$(O) Arrow.$(C) Arrow.$(H): Arrow.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\LineSegment.$(H) $(STCHDR)
$(OUTDIR)ArrowedSpline.$(O) ArrowedSpline.$(C) ArrowedSpline.$(H): ArrowedSpline.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Spline.$(H) $(STCHDR)
$(OUTDIR)AutoResizingOrderedCollectionWithDefault.$(O) AutoResizingOrderedCollectionWithDefault.$(C) AutoResizingOrderedCollectionWithDefault.$(H): AutoResizingOrderedCollectionWithDefault.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\OrderedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic2\AutoResizingOrderedCollection.$(H) $(STCHDR)
$(OUTDIR)BZip2Stream.$(O) BZip2Stream.$(C) BZip2Stream.$(H): BZip2Stream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\CompressionStream.$(H) $(STCHDR)
$(OUTDIR)BackgroundJob.$(O) BackgroundJob.$(C) BackgroundJob.$(H): BackgroundJob.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\AbstractBackgroundJob.$(H) $(STCHDR)
$(OUTDIR)BackgroundPeriodicalJob.$(O) BackgroundPeriodicalJob.$(C) BackgroundPeriodicalJob.$(H): BackgroundPeriodicalJob.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\AbstractBackgroundJob.$(H) $(STCHDR)
$(OUTDIR)BackgroundQueueProcessingJob.$(O) BackgroundQueueProcessingJob.$(C) BackgroundQueueProcessingJob.$(H): BackgroundQueueProcessingJob.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\AbstractBackgroundJob.$(H) $(STCHDR)
$(OUTDIR)Base32Coder.$(O) Base32Coder.$(C) Base32Coder.$(H): Base32Coder.st $(INCLUDE_TOP)\stx\libbasic\AspectVisitor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ObjectCoder.$(H) $(INCLUDE_TOP)\stx\libbasic\Visitor.$(H) $(INCLUDE_TOP)\stx\libbasic2\BaseNCoder.$(H) $(STCHDR)
$(OUTDIR)Base64Coder.$(O) Base64Coder.$(C) Base64Coder.$(H): Base64Coder.st $(INCLUDE_TOP)\stx\libbasic\AspectVisitor.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ObjectCoder.$(H) $(INCLUDE_TOP)\stx\libbasic\Visitor.$(H) $(INCLUDE_TOP)\stx\libbasic2\BaseNCoder.$(H) $(STCHDR)
$(OUTDIR)BayesClassifier.$(O) BayesClassifier.$(C) BayesClassifier.$(H): BayesClassifier.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\TextClassifier.$(H) $(STCHDR)
$(OUTDIR)Bezier2Segment.$(O) Bezier2Segment.$(C) Bezier2Segment.$(H): Bezier2Segment.st $(INCLUDE_TOP)\stx\libbasic\Geometric.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\LineSegment.$(H) $(STCHDR)
$(OUTDIR)CacheDictionaryWithFactory.$(O) CacheDictionaryWithFactory.$(C) CacheDictionaryWithFactory.$(H): CacheDictionaryWithFactory.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Dictionary.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Set.$(H) $(INCLUDE_TOP)\stx\libbasic2\CacheDictionary.$(H) $(STCHDR)
$(OUTDIR)DecNetSocketAddress.$(O) DecNetSocketAddress.$(C) DecNetSocketAddress.$(H): DecNetSocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\SocketAddress.$(H) $(STCHDR)
$(OUTDIR)EpsonFX1PrinterStream.$(O) EpsonFX1PrinterStream.$(C) EpsonFX1PrinterStream.$(H): EpsonFX1PrinterStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\PrinterStream.$(H) $(STCHDR)
$(OUTDIR)FilteringLineStream.$(O) FilteringLineStream.$(C) FilteringLineStream.$(H): FilteringLineStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\FilteringStream.$(H) $(STCHDR)
$(OUTDIR)HPLjetIIPrinterStream.$(O) HPLjetIIPrinterStream.$(C) HPLjetIIPrinterStream.$(H): HPLjetIIPrinterStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\PrinterStream.$(H) $(STCHDR)
$(OUTDIR)HTMLPrinterStream.$(O) HTMLPrinterStream.$(C) HTMLPrinterStream.$(H): HTMLPrinterStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\PrinterStream.$(H) $(STCHDR)
$(OUTDIR)HierarchicalURI.$(O) HierarchicalURI.$(C) HierarchicalURI.$(H): HierarchicalURI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\URI.$(H) $(STCHDR)
$(OUTDIR)HostAddressLookupError.$(O) HostAddressLookupError.$(C) HostAddressLookupError.$(H): HostAddressLookupError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProceedableError.$(H) $(INCLUDE_TOP)\stx\libbasic2\NameLookupError.$(H) $(STCHDR)
$(OUTDIR)HostNameLookupError.$(O) HostNameLookupError.$(C) HostNameLookupError.$(H): HostNameLookupError.st $(INCLUDE_TOP)\stx\libbasic\Error.$(H) $(INCLUDE_TOP)\stx\libbasic\Exception.$(H) $(INCLUDE_TOP)\stx\libbasic\GenericException.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\ProceedableError.$(H) $(INCLUDE_TOP)\stx\libbasic2\NameLookupError.$(H) $(STCHDR)
$(OUTDIR)IPSocketAddress.$(O) IPSocketAddress.$(C) IPSocketAddress.$(H): IPSocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\SocketAddress.$(H) $(STCHDR)
$(OUTDIR)LazyCons.$(O) LazyCons.$(C) LazyCons.$(H): LazyCons.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic2\Cons.$(H) $(STCHDR)
$(OUTDIR)LineNumberReadStream.$(O) LineNumberReadStream.$(C) LineNumberReadStream.$(H): LineNumberReadStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\FilteringStream.$(H) $(STCHDR)
$(OUTDIR)PostscriptPrinterStream.$(O) PostscriptPrinterStream.$(C) PostscriptPrinterStream.$(H): PostscriptPrinterStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\PrinterStream.$(H) $(STCHDR)
$(OUTDIR)RandomGenerator.$(O) RandomGenerator.$(C) RandomGenerator.$(H): RandomGenerator.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\Random.$(H) $(STCHDR)
$(OUTDIR)SharedQueue.$(O) SharedQueue.$(C) SharedQueue.$(H): SharedQueue.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Queue.$(H) $(STCHDR)
$(OUTDIR)TSMultiTree.$(O) TSMultiTree.$(C) TSMultiTree.$(H): TSMultiTree.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\TSTree.$(H) $(STCHDR)
$(OUTDIR)TSMultiTreeNode.$(O) TSMultiTreeNode.$(C) TSMultiTreeNode.$(H): TSMultiTreeNode.st $(INCLUDE_TOP)\stx\libbasic\Array.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic2\TSTreeNode.$(H) $(STCHDR)
$(OUTDIR)TimedPromise.$(O) TimedPromise.$(C) TimedPromise.$(H): TimedPromise.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Promise.$(H) $(STCHDR)
$(OUTDIR)UDSocketAddress.$(O) UDSocketAddress.$(C) UDSocketAddress.$(H): UDSocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\SocketAddress.$(H) $(STCHDR)
$(OUTDIR)Unicode32String.$(O) Unicode32String.$(C) Unicode32String.$(H): Unicode32String.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\FourByteString.$(H) $(STCHDR)
$(OUTDIR)ValueDoubleLink.$(O) ValueDoubleLink.$(C) ValueDoubleLink.$(H): ValueDoubleLink.st $(INCLUDE_TOP)\stx\libbasic\Link.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\DoubleLink.$(H) $(STCHDR)
$(OUTDIR)ZipArchive.$(O) ZipArchive.$(C) ZipArchive.$(H): ZipArchive.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\PeekableStream.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\ZipArchiveConstants.$(H) $(STCHDR)
$(OUTDIR)ZipStream.$(O) ZipStream.$(C) ZipStream.$(H): ZipStream.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic2\CompressionStream.$(H) $(STCHDR)
$(OUTDIR)FileURI.$(O) FileURI.$(C) FileURI.$(H): FileURI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\HierarchicalURI.$(H) $(INCLUDE_TOP)\stx\libbasic2\URI.$(H) $(STCHDR)
$(OUTDIR)FtpURI.$(O) FtpURI.$(C) FtpURI.$(H): FtpURI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\HierarchicalURI.$(H) $(INCLUDE_TOP)\stx\libbasic2\URI.$(H) $(STCHDR)
$(OUTDIR)HttpURI.$(O) HttpURI.$(C) HttpURI.$(H): HttpURI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\HierarchicalURI.$(H) $(INCLUDE_TOP)\stx\libbasic2\URI.$(H) $(STCHDR)
$(OUTDIR)IPv6SocketAddress.$(O) IPv6SocketAddress.$(C) IPv6SocketAddress.$(H): IPv6SocketAddress.st $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(INCLUDE_TOP)\stx\libbasic2\IPSocketAddress.$(H) $(INCLUDE_TOP)\stx\libbasic2\SocketAddress.$(H) $(STCHDR)
$(OUTDIR)SftpURI.$(O) SftpURI.$(C) SftpURI.$(H): SftpURI.st $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\HierarchicalURI.$(H) $(INCLUDE_TOP)\stx\libbasic2\URI.$(H) $(STCHDR)
$(OUTDIR)UnlimitedSharedQueue.$(O) UnlimitedSharedQueue.$(C) UnlimitedSharedQueue.$(H): UnlimitedSharedQueue.st $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic2\Queue.$(H) $(INCLUDE_TOP)\stx\libbasic2\SharedQueue.$(H) $(STCHDR)
$(OUTDIR)extensions.$(O): extensions.st $(INCLUDE_TOP)\stx\libbasic\ArithmeticValue.$(H) $(INCLUDE_TOP)\stx\libbasic\ArrayedCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\CharacterArray.$(H) $(INCLUDE_TOP)\stx\libbasic\Collection.$(H) $(INCLUDE_TOP)\stx\libbasic\Float.$(H) $(INCLUDE_TOP)\stx\libbasic\LimitedPrecisionReal.$(H) $(INCLUDE_TOP)\stx\libbasic\Magnitude.$(H) $(INCLUDE_TOP)\stx\libbasic\Number.$(H) $(INCLUDE_TOP)\stx\libbasic\Object.$(H) $(INCLUDE_TOP)\stx\libbasic\SequenceableCollection.$(H) $(INCLUDE_TOP)\stx\libbasic\Stream.$(H) $(INCLUDE_TOP)\stx\libbasic\UninterpretedBytes.$(H) $(STCHDR)

# ENDMAKEDEPEND --- do not remove this line

# **Must be at end**

# Enforce recompilation of package definition class if Mercurial working
# copy state changes. Together with --guessVersion it ensures that package
# definition class always contains correct binary revision string.
!IFDEF HGROOT
$(OUTDIR)stx_libbasic2.$(O): $(HGROOT)\.hg\dirstate
!ENDIF
