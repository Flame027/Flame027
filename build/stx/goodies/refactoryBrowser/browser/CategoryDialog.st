"{ Package: 'stx:goodies/refactoryBrowser/browser' }"

BrowserDialog subclass:#CategoryDialog
	instanceVariableNames:'categoryList nameHolder organizer'
	classVariableNames:''
	poolDictionaries:''
	category:'Refactory-Browser'
!


!CategoryDialog class methodsFor:'interface specs'!

windowSpec
	"UIPainter new openOnClass: self andSelector: #windowSpec"

	<resource: #canvas>
	^#(#FullSpec 
		#window: 
		#(#WindowSpec 
			#label: 'Category Dialog' 
			#bounds: #(#Rectangle 359 339 654 591 ) 
			#isEventDriven: true ) 
		#component: 
		#(#SpecCollection 
			#collection: #(
				#(#SequenceViewSpec 
					#layout: #(#LayoutFrame 5 0 5 0 -55 1 -75 1 ) 
					#name: #categoryList 
					#model: #categoryList 
					#useModifierKeys: true 
					#selectionType: #highlight ) 
				#(#ActionButtonSpec 
					#layout: #(#LayoutFrame -50 1 5 0 -5 1 50 0 ) 
					#name: #up 
					#isOpaque: true 
					#model: #up 
					#label: #upImage 
					#hasCharacterOrientedLabel: false ) 
				#(#ActionButtonSpec 
					#layout: #(#LayoutFrame -50 1 -120 1 -5 1 -75 1 ) 
					#name: #down 
					#isOpaque: true 
					#model: #down 
					#label: #downImage 
					#hasCharacterOrientedLabel: false ) 
				#(#InputFieldSpec 
					#layout: #(#LayoutFrame 5 0 -70 1 -55 1 -40 1 ) 
					#name: #nameHolder 
					#model: #nameHolder ) 
				#(#ActionButtonSpec 
					#layout: #(#LayoutFrame -50 1 -70 1 -5 1 -40 1 ) 
					#name: #addCategory 
					#flags: 40 
					#model: #addCategory 
					#label: 'Add' ) 
				#(#ActionButtonSpec 
					#layout: #(#AlignmentOrigin 0 0.333333 -5 1 0.5 1 ) 
					#name: #accept 
					#flags: 40 
					#model: #accept 
					#label: 'OK' ) 
				#(#ActionButtonSpec 
					#layout: #(#AlignmentOrigin 0 0.666666 -5 1 0.5 1 ) 
					#name: #cancel 
					#model: #cancel 
					#label: 'Cancel' ) 
				#(#DividerSpec 
					#layout: #(#LayoutFrame 0 0 -36 1 0 1 -34 1 ) ) ) ) )
! !

!CategoryDialog methodsFor:'accessing'!

categoryName
	^self categoryList selection
!

currentCategory: aCategoryName 
	self categoryList selection: aCategoryName
! !

!CategoryDialog methodsFor:'actions'!

addCategory
	| category index |
	category := self nameHolder value asSymbol.
	organizer addCategory: category before: self categoryList selection.
	index := self categoryList selectionIndex.
	index == 0
		ifTrue: [self categoryList list add: category]
		ifFalse: [self categoryList list add: category beforeIndex: index].
	self categoryList selection: category
!

down
	| list index |
	list := self categoryList list.
	index := self categoryList selectionIndex.
	organizer addCategory: (list at: index + 1)
		before: (list at: index).
	list swap: index with: index + 1.
	self categoryList selectionIndex: index + 1
!

up
	| list index |
	list := self categoryList list.
	index := self categoryList selectionIndex.
	organizer addCategory: (list at: index)
		before: (list at: index - 1).
	list swap: index with: index - 1.
	self categoryList selectionIndex: index - 1
! !

!CategoryDialog methodsFor:'aspects'!

categoryList
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^categoryList isNil
		ifTrue:
			[categoryList := SelectionInList new]
		ifFalse:
			[categoryList]
!

nameHolder
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."

	^nameHolder isNil
		ifTrue:
			[nameHolder := String new asValue]
		ifFalse:
			[nameHolder]
! !

!CategoryDialog methodsFor:'changing'!

changedName
	self nameHolder value isEmpty
		ifTrue: [self disable: #addCategory]
		ifFalse: [self enable: #addCategory]
!

changedSelection
	| index |
	index := self categoryList selectionIndex.
	index > 1
		ifTrue: [self enable: #up]
		ifFalse: [self disable: #up].
	index < self categoryList list size & (index > 0)
		ifTrue: [self enable: #down]
		ifFalse: [self disable: #down].
	index > 0
		ifTrue: [self enable: #accept]
		ifFalse: [self disable: #accept]
! !

!CategoryDialog methodsFor:'initialize-release'!

initialize
	super initialize.
	self categoryList selectionIndexHolder onChangeSend: #changedSelection to: self.
	self nameHolder onChangeSend: #changedName to: self
!

organizer: aClassOrganizer 
	organizer := aClassOrganizer.
	self categoryList list: organizer categories asList
! !

!CategoryDialog methodsFor:'interface opening'!

postBuildWith: aBuilder 
	super postBuildWith: aBuilder.
	self changedSelection.
	self changedName
!

postOpenWith: aBuilder 
	super postOpenWith: aBuilder.

	"Reset the selection so that the list will scroll to the selected entry."
	self categoryList selection: self categoryList selection
! !

!CategoryDialog class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/goodies/refactoryBrowser/browser/CategoryDialog.st,v 1.5 2003-09-23 10:45:15 cg Exp $'
! !