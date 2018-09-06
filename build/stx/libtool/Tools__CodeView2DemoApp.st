"
 COPYRIGHT (c) 2010 by Jan Vrany, SWING Research Group. CTU in Prague
              All Rights Reserved

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the 'Software'), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
"
"{ Package: 'stx:libtool' }"

"{ NameSpace: Tools }"

ApplicationModel subclass:#CodeView2DemoApp
	instanceVariableNames:'modifiedChannel'
	classVariableNames:''
	poolDictionaries:''
	category:'Interface-CodeView'
!

!CodeView2DemoApp class methodsFor:'documentation'!

copyright
"
 COPYRIGHT (c) 2010 by Jan Vrany, SWING Research Group. CTU in Prague
              All Rights Reserved

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the 'Software'), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
"
!

examples
"
  Starting the application:
                                                                [exBegin]
    Tools::CodeView2DemoApp open

                                                                [exEnd]

  more examples to be added:
                                                                [exBegin]
    ... add code fragment for 
    ... executable example here ...
                                                                [exEnd]
"
! !

!CodeView2DemoApp class methodsFor:'interface specs'!

windowSpec
    "This resource specification was automatically generated
     by the UIPainter of ST/X."

    "Do not manually edit this!! If it is corrupted,
     the UIPainter may not be able to read the specification."

    "
     UIPainter new openOnClass:Tools::CodeView2DemoApp andSelector:#windowSpec
     Tools::CodeView2DemoApp new openInterface:#windowSpec
     Tools::CodeView2DemoApp open
    "

    <resource: #canvas>

    ^ 
     #(FullSpec
        name: windowSpec
        window: 
       (WindowSpec
          label: 'CodeView2 Demo App'
          name: 'CodeView2 Demo App'
          min: (Point 10 10)
          bounds: (Rectangle 0 0 509 392)
        )
        component: 
       (SpecCollection
          collection: (
           (TextEditorSpec
              name: 'CodeView2'
              layout: (LayoutFrame 0 0 30 0 0 1 0 1)
              hasHorizontalScrollBar: true
              hasVerticalScrollBar: true
              hasKeyboardFocusInitially: false
              viewClassName: 'Tools::CodeView2'
            )
           )
         
        )
      )
! !

!CodeView2DemoApp methodsFor:'aspects'!

modifiedChannel
    <resource: #uiAspect>

    "automatically generated by UIPainter ..."

    "*** the code below creates a default model when invoked."
    "*** (which may not be the one you wanted)"
    "*** Please change as required and accept it in the browser."
    "*** (and replace this comment by something more useful ;-)"

    modifiedChannel isNil ifTrue:[
        modifiedChannel := ValueHolder with: false
    ].
    ^ modifiedChannel.

    "Modified: / 06-02-2010 / 20:03:23 / Jan Vrany <jan.vrany@fit.cvut.cz>"
! !

!CodeView2DemoApp class methodsFor:'documentation'!

version_CVS
    ^ '�Header: /cvs/stx/stx/libtool/Tools__CodeView2DemoApp.st,v 1.2 2011/07/03 17:50:09 cg Exp �'
!

version_HG

    ^ '$Changeset: <not expanded> $'
!

version_SVN
    ^ '$Id: Tools__CodeView2DemoApp.st 7567 2010-04-17 10:59:53Z vranyj1 $'
! !
