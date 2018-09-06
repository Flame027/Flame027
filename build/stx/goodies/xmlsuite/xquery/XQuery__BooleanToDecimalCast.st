"{ Package: 'stx:goodies/xmlsuite/xquery' }"

"{ NameSpace: XQuery }"

AnyAtomicTypeToAnyAtomicTypeCast subclass:#BooleanToDecimalCast
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'XQuery-TypeCasting'
!


!BooleanToDecimalCast methodsFor:'casting'!

cast
    | value |
    "If ST is xs:boolean, SV is converted to 1.0 if SV is 1 or true and to 0.0 
        if SV is 0 or false and the conversion is complete.    "

    atomicValue nodeId ifTrue:
    [
        value := 1.0.
    ]
    ifFalse:
    [
        value := 0.0.
    ].

    ^ AtomicItem withValue: value asType: anotherType typeName.

    "Created: / 17-11-2009 / 19:27:07 / Jan Kurs <kursj1@fel.cvut.cz>"
! !

!BooleanToDecimalCast class methodsFor:'documentation'!

version_SVN
    ^ '$Id$'
! !