"{ Package: 'stx:goodies/petitparser/parsers/java' }"

"{ NameSpace: Smalltalk }"

PJStatementNode subclass:#PJLocalVariableDeclarationStatementNode
	instanceVariableNames:'modifiers type declarators'
	classVariableNames:''
	poolDictionaries:''
	category:'PetitJava-AST'
!

PJLocalVariableDeclarationStatementNode comment:'Node representing a local variable declaration statement.
!

!PJLocalVariableDeclarationStatementNode methodsFor:'accessing'!

acceptVisitor: aVisitor

	^ aVisitor visitLocalVariableDeclarationStatementNode: self
!

declarators
	^ declarators
!

declarators: anObject
	declarators := anObject
!

modifiers
	^ modifiers
!

modifiers: anObject
	modifiers := anObject
!

type
	^ type
!

type: anObject
	type := anObject
! !
