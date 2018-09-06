"{ NameSpace: CodingExamples_GUI }"

ApplicationModel subclass:#DSVExampleDB
	instanceVariableNames:'persDB loadedKeys modifiedRows'
	classVariableNames:''
	poolDictionaries:''
	category:'examples-DataSetView'
!

Object subclass:#Row
	instanceVariableNames:'key table modified rawData'
	classVariableNames:'modifiedBackgroundColor'
	poolDictionaries:''
	privateIn:DSVExampleDB
!


!DSVExampleDB class methodsFor:'constants'!

dataBaseHKey
    ^ 'HDR'
!

dataBaseName
    ^ 'pers.db'
! !

!DSVExampleDB class methodsFor:'interface specs'!

windowSpec
    "this window spec was automatically generated by the ST/X UIPainter"

    "do not manually edit this - the painter/builder may not be able to
     handle the specification if its corrupted."

    "
     UIPainter new openOnClass:CodingExamples_GUI::DSVExampleDB andSelector:#windowSpec
     CodingExamples_GUI::DSVExampleDB new openInterface:#windowSpec
    "
    "CodingExamples_GUI::DSVExampleDB open"

    <resource: #canvas>

    ^
     
       #(#FullSpec
          #'window:' 
           #(#WindowSpec
              #'name:' 'DataSet Example DB'
              #'layout:' #(#LayoutFrame 216 0 173 0 677 0 443 0)
              #'label:' 'DataSet Example DB'
              #'min:' #(#Point 10 10)
              #'max:' #(#Point 1152 900)
              #'bounds:' #(#Rectangle 216 173 678 444)
              #'usePreferredExtent:' false
          )
          #'component:' 
           #(#SpecCollection
              #'collection:' 
               #(
                 #(#DataSetSpec
                    #'name:' 'dataSet'
                    #'layout:' #(#LayoutFrame 0 0.0 0 0.0 0 1.0 -30 1.0)
                    #'model:' #selectionHolder
                    #'hasHorizontalScrollBar:' true
                    #'hasVerticalScrollBar:' true
                    #'rowIfAbsent:' #'retrieveRowAt:'
                    #'dataList:' #listHolder
                    #'has3Dsepartors:' true
                    #'columns:' 
                     #(
                       #(#DataSetColumnSpec
                          #'label:' 'Name'
                          #'minWidth:' 100
                          #'editorType:' #InputField
                          #'model:' #name
                          #'backgroundSelector:' #modifiedBackgroundColor
                      )
                       #(#DataSetColumnSpec
                          #'label:' 'Employee Number'
                          #'minWidth:' 100
                          #'editorType:' #InputField
                          #'model:' #employeeNumber
                          #'backgroundSelector:' #modifiedBackgroundColor
                      )
                       #(#DataSetColumnSpec
                          #'label:' 'German Citizen'
                          #'editorType:' #CheckToggle
                          #'rendererType:' #CheckToggle
                          #'model:' #isGerman
                          #'backgroundSelector:' #modifiedBackgroundColor
                      )
                    )
                )
                 #(#HorizontalPanelViewSpec
                    #'name:' 'panel'
                    #'layout:' #(#LayoutFrame 0 0.0 -30 1.0 0 1.0 0 1.0)
                    #'component:' 
                     #(#SpecCollection
                        #'collection:' 
                         #(
                           #(#ActionButtonSpec
                              #'name:' 'recoverButton'
                              #'label:' 'recover'
                              #'model:' #'changes:'
                              #'enableChannel:' #modifiedChannel
                              #'actionValue:' 'recover'
                              #'extent:' #(#Point 226 24)
                          )
                           #(#ActionButtonSpec
                              #'name:' 'commitButton'
                              #'label:' 'commit'
                              #'model:' #'changes:'
                              #'enableChannel:' #modifiedChannel
                              #'actionValue:' 'commit'
                              #'extent:' #(#Point 227 24)
                          )
                        )
                    )
                    #'horizontalLayout:' #fitSpace
                    #'verticalLayout:' #fitSpace
                    #'horizontalSpace:' 3
                    #'verticalSpace:' 3
                )
              )
          )
      )
! !

!DSVExampleDB class methodsFor:'test'!

createDataBase
"
DSVExampleDB createDataBase
"

     |dbMg isG size row|

     size := 2000.
     isG  := false.
     row  := Row new.
     dbMg := PersistencyManager file:(self dataBaseName).

     dbMg store:size key:(self dataBaseHKey) sync:false.

     1 to:size do:[:aKey||key|
        key := aKey printString.
        isG := isG not.
        row key:aKey table:nil.
        row name:('name ', key) number:key isGerman:isG.
        row storeTo:dbMg.
     ].
     dbMg sync.
     dbMg release

! !

!DSVExampleDB methodsFor:'actions'!

changes:what

    |list view|

    view := builder componentAt:#dataSet.
    view deselect.
    list := self listHolder.

    what = 'commit' ifTrue:[ modifiedRows do:[:r|r storeTo:persDB] ].
    modifiedRows do:[:r| list at:(r key) put:nil ].
    modifiedRows := OrderedCollection new.
    persDB sync.
    view forceRedraw.
    self modifiedChannel value:false.

!

retrieveRowAt:aRowNr

    |list row|

    list := self listHolder.

    loadedKeys size > 200 ifTrue:[
        loadedKeys from:1 to:100 do:[:i| list at:i put:nil ].
        loadedKeys removeFromIndex:1 toIndex:100.
    ].
    row := Row key:aRowNr table:self.
    row retrieveFrom:persDB.
    loadedKeys add:aRowNr.
  ^ list at:aRowNr put:row.

! !

!DSVExampleDB methodsFor:'aspects'!

listHolder
    "automatically generated by UIPainter ..."

    |holder size|

    (holder := builder bindingAt:#listHolder) isNil ifTrue:[
        self openDataBase ifFalse:[
            size := 0
        ] ifTrue:[
            size := persDB retrieve:(self class dataBaseHKey)
        ].
        holder := List new:size.
        holder addAll:(Array new:size).
        builder aspectAt:#listHolder put:holder.
    ].
    ^ holder
!

modifiedChannel
    "automatically generated by UIPainter ..."

    |holder|

    (holder := builder bindingAt:#modifiedChannel) isNil ifTrue:[
        builder aspectAt:#modifiedChannel put:(holder :=  ValueHolder new).
    ].
    ^ holder
!

selectionHolder
    "automatically generated by UIPainter ..."

    |holder|

    (holder := builder bindingAt:#selectionHolder) isNil ifTrue:[
        builder aspectAt:#selectionHolder put:(holder :=  ValueHolder new).
    ].
    ^ holder
! !

!DSVExampleDB methodsFor:'change & update'!

modified:changedRow
    |rowNr|

    self modifiedChannel value:true.
    modifiedRows add:changedRow.
    rowNr := changedRow key.

    loadedKeys removeIdentical:rowNr ifAbsent:nil.
    (builder componentAt:#dataSet) redrawRowAt:rowNr
! !

!DSVExampleDB methodsFor:'initialization'!

closeRequest
    persDB notNil ifTrue:[persDB release].
    super closeRequest.
! !

!DSVExampleDB methodsFor:'private'!

openDataBase

    persDB isNil ifTrue:[
        PersistencyManager openErrorSignal handle:[:ex |
            self warn:ex errorString.
            ex return
        ] do:[
            persDB := PersistencyManager file:(self class dataBaseName).
        ].
        loadedKeys   := OrderedCollection new.
        modifiedRows := OrderedCollection new.
    ].
    ^ persDB notNil
! !

!DSVExampleDB::Row class methodsFor:'defaults'!

modifiedBackgroundColor

    modifiedBackgroundColor isNil ifTrue:[
        modifiedBackgroundColor := Color grey
    ].
    ^ modifiedBackgroundColor
! !

!DSVExampleDB::Row class methodsFor:'instance creation'!

key:aKey table:aTable
    ^ self new key:aKey table:aTable
!

new
    ^ self basicNew initialize
! !

!DSVExampleDB::Row methodsFor:'accessing colors'!

modifiedBackgroundColor
    "returns background color for a cell; if row is modified a color
     is returned otherwise nil (useing default background color)
    "
    ^ modified ifFalse:[nil] ifTrue:[self class modifiedBackgroundColor]

! !

!DSVExampleDB::Row methodsFor:'accessing readSelector'!

employeeNumber
    "automatically generated by DataSetBuilder ..."

    ^ rawData at:2
!

isGerman
    "automatically generated by DataSetBuilder ..."

    ^ rawData at:3
!

name
    "automatically generated by DataSetBuilder ..."

    ^ rawData at:1
! !

!DSVExampleDB::Row methodsFor:'accessing writeSelector'!

employeeNumber:aValue
    "automatically generated by DataSetBuilder ..."

    self at:2 put:aValue
!

isGerman:aValue
    "automatically generated by DataSetBuilder ..."

    self at:3 put:aValue

!

name:aValue
    "automatically generated by DataSetBuilder ..."

    self at:1 put:aValue

! !

!DSVExampleDB::Row methodsFor:'initialize'!

initialize
    super initialize.
    modified := false.
!

key:aKey table:aTable

    key   := aKey.
    table := aTable.
!

name:aName number:aNumber isGerman:aBool

    rawData  := Array with:aName with:aNumber with:aBool.
    modified := false.
! !

!DSVExampleDB::Row methodsFor:'persistency'!

key
    ^ key
!

retrieveFrom:aDB
    "read data from database
    "
    Object keyNotFoundSignal handle:[:ex| ex return]
                                 do:[ rawData := aDB retrieve:key ].
    modified := false.

!

storeTo:aDataBase
    "store to database
    "
    aDataBase store:rawData key:key sync:false.
    modified := false.
! !

!DSVExampleDB::Row methodsFor:'private'!

at:anIndex put:something

    (rawData at:anIndex) = something ifFalse:[
        rawData at:anIndex put:something.

        modified ifFalse:[
            modified := true.
            table modified:self
        ]
    ]
!

raiseModification

    modified ifFalse:[
        modified := true.
        table modified:self.
    ]
! !

!DSVExampleDB class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/clients/Demos/DSVExampleDB.st,v 1.6 1998-09-03 11:51:16 cg Exp $'
! !