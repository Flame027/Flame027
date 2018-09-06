"
 Copyright (C) Original SmallLint Authors
 Copyright (C) The Squeak Team
 Copyright (C) The Pharo Team
 Copyright (C) 2011-2013 Jan Vrany (porting, Smalltalk/X rules & tweaks)
 Copyright (C) 2011-2013 Claus Gittinger (porting, Smalltalk/X rules & tweaks)

 Permission is hereby granted, free of charge, to any 
 person obtaining a copy of this software and associated 
 documentation files (the 'Software'), to deal in the 
 Software without restriction, including without limitation 
 the rights to use, copy, modify, merge, publish, distribute, 
 sublicense, and/or sell copies of the Software, and to 
 permit persons to whom the Software is furnished to do so, 
 subject to the following conditions:

 The above copyright notice and this permission notice shall 
 be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
"{ Package: 'stx:goodies/refactoryBrowser/lint' }"

"{ NameSpace: Smalltalk }"

RBParseTreeLintRule subclass:#RBEqualNotUsedRule
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Refactory-Lint-Parse-tree Rules'
!

!RBEqualNotUsedRule class methodsFor:'documentation'!

copyright
"
 Copyright (C) Original SmallLint Authors
 Copyright (C) The Squeak Team
 Copyright (C) The Pharo Team
 Copyright (C) 2011-2013 Jan Vrany (porting, Smalltalk/X rules & tweaks)
 Copyright (C) 2011-2013 Claus Gittinger (porting, Smalltalk/X rules & tweaks)

 Permission is hereby granted, free of charge, to any 
 person obtaining a copy of this software and associated 
 documentation files (the 'Software'), to deal in the 
 Software without restriction, including without limitation 
 the rights to use, copy, modify, merge, publish, distribute, 
 sublicense, and/or sell copies of the Software, and to 
 permit persons to whom the Software is furnished to do so, 
 subject to the following conditions:

 The above copyright notice and this permission notice shall 
 be included in all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, 
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
 IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
 CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
 TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
 SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
"
! !

!RBEqualNotUsedRule methodsFor:'accessing'!

group
        ^ 'Possible Bugs'
!

name
        ^ 'Doesn''t use the result of "=", "~=", etc. messages'

    "Modified: / 07-04-2012 / 13:16:10 / cg"
!

rationale
        ^ 'Checks for senders of comparator messages that do not use the result.
<P>Sometimes this is a typing error, and an assignment ":=" was the actual intention
(ex C/Java-programmers sometimes fall into this trap).'
! !

!RBEqualNotUsedRule methodsFor:'initialization'!

initialize
        super initialize.
        self matcher 
                matches: '`{:node | node isMessage and: [node isUsed not and: [#(#= #== #~= #~~ #< #> #<= #>=) includes: node selectorString]]}'
                do: [ :node :answer | node ]
! !

!RBEqualNotUsedRule class methodsFor:'documentation'!

version
    ^ '$Header$'
!

version_CVS
    ^ '$Header$'
!

version_SVN
    ^ '$Id$'
! !
