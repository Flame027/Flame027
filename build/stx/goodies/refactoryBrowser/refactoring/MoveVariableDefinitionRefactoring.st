"{ Package: 'stx:goodies/refactoryBrowser/refactoring' }"

MethodRefactoring subclass:#MoveVariableDefinitionRefactoring
	instanceVariableNames:'selector interval name parseTree blockNodes definingNode'
	classVariableNames:''
	poolDictionaries:''
	category:'Refactory-Refactorings'
!


!MoveVariableDefinitionRefactoring class methodsFor:'instance creation'!

bindTight: anInterval in: aClass selector: aSelector 
	^self new
		class: aClass
		selector: aSelector
		interval: anInterval
!

model: aRBSmalltalk bindTight: anInterval in: aClass selector: aSelector 
	^(self new)
		model: aRBSmalltalk;
		class: aClass
			selector: aSelector
			interval: anInterval;
		yourself
! !

!MoveVariableDefinitionRefactoring methodsFor:'initialize-release'!

class: aClass selector: aSelector interval: anInterval 
	interval := anInterval.
	class := self classObjectFor: aClass.
	selector := aSelector
! !

!MoveVariableDefinitionRefactoring methodsFor:'preconditions'!

preconditions
        ^(RBCondition definesSelector: selector in: class) 
                & (RBCondition withBlock: 
                                        [| methodSource |
                                        interval first <= interval last 
                                                ifFalse: [self refactoringError: 'Invalid variable name'].
                                        methodSource := class sourceCodeFor: selector.
                                        methodSource size >= interval last 
                                                ifFalse: [self refactoringError: 'Invalid range for variable'].
                                        name := methodSource copyFrom: interval first to: interval last.
                                        (self checkInstanceVariableName: name in: class) 
                                                ifFalse: 
                                                        [self 
                                                                refactoringError: name , ' does not seem to be a valid variable name.'].
                                        parseTree := class parseTreeFor: selector.
                                        self checkParseTree.
                                        true])
! !

!MoveVariableDefinitionRefactoring methodsFor:'printing'!

storeOn: aStream 
	aStream nextPut: $(.
	self class storeOn: aStream.
	aStream nextPutAll: ' bindTight: '.
	interval storeOn: aStream.
	aStream nextPutAll: ' in: '.
	class storeOn: aStream.
	aStream
		nextPutAll: ' selector: #';
		nextPutAll: selector.
	aStream nextPut: $)
! !

!MoveVariableDefinitionRefactoring methodsFor:'transforming'!

checkNodes: sequenceNodes 
	(sequenceNodes 
		detect: [:each | RBReadBeforeWrittenTester isVariable: name readBeforeWrittenIn: each]
		ifNone: [nil]) notNil 
		ifTrue: [^false].
	sequenceNodes do: 
			[:each | 
			(self usesDirectly: each body) 
				ifTrue: [blockNodes add: each]
				ifFalse: 
					[(self checkNodes: (self subblocksIn: each body)) 
						ifFalse: [blockNodes add: each]]].
	^true
!

checkParseTree
	| node |
	blockNodes := OrderedCollection new.
	node := self whichVariableNode: parseTree
				inInterval: interval
				name: name.
	node isNil
		ifTrue: [self refactoringError: 'Unable to locate node in parse tree'].
	definingNode := node whoDefines: name.
	definingNode isNil
		ifTrue: [self refactoringError: 'Cannot locate variable definition'].
	definingNode isSequence
		ifFalse: [self refactoringError: 'Variable is an argument'].
	(self usesDirectly: definingNode)
		ifTrue: [self refactoringError: 'Variable already bound tightly as possible'].
	(self checkNodes: (self subblocksIn: definingNode))
		ifFalse: [self refactoringError: 'Variable is possibly read before written']
!

subblocksIn: aParseTree 
	| searcher |
	searcher := ParseTreeSearcher new.
	searcher matches: '[:`@blockTemps | | `@temps | `@.Statements]'
		do: 
			[:aNode :answer | 
			(aNode references: name)
				ifTrue: [answer add: aNode].
			answer].
	^searcher executeTree: aParseTree initialAnswer: OrderedCollection new
!

transform
	definingNode removeTemporaryNamed: name.
	blockNodes do: [:each | each body addTemporaryNamed: name].
	class compileTree: parseTree
!

usesDirectly: aParseTree 
	| searcher |
	searcher := ParseTreeSearcher new.
	searcher
		matches: '[:`@args | | `@temps | `@.Statements]'
			do: [:aNode :answer | answer];
		matches: name do: [:aNode :answer | true].
	^searcher executeTree: aParseTree initialAnswer: false
! !

!MoveVariableDefinitionRefactoring class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/goodies/refactoryBrowser/refactoring/MoveVariableDefinitionRefactoring.st,v 1.11 2004-06-18 08:14:51 ca Exp $'
! !