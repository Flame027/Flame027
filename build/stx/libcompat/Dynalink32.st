"{ Package: 'stx:libcompat' }"

"{ NameSpace: V }"

Object subclass:#Dynalink32
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Compatibility-ST/V'
!

!Dynalink32 class methodsFor:'documentation'!

documentation
"
    Dummy ST-V compatibility class.
    This may be required when existing code has to be ported to ST/X;
    however, it may not be complete and more protocol may be added in the future.
    The code here was created when public domain code (Manchester) had to
    be ported to ST/X and missing classes/methods were encountered, and code added
    by reasoning 'what the original class could probably do there'.

    No Warranty, no functionality: all this class exists for is to allow subclasses
    to be filed in and find some home to allow porting...

    [author:]
        Claus Gittinger
"
! !

!Dynalink32 methodsFor:'error handling'!

invalidArgument
    self primitiveFailed:'invalid argument'
! !

!Dynalink32 class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/libcompat/Dynalink32.st,v 1.4 2009-08-13 21:21:27 cg Exp $'
! !