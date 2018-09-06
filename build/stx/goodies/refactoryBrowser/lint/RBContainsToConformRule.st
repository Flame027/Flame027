"
 Copyright (C) 2014 Claus Gittinger

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

RBTransformationRule subclass:#RBContainsToConformRule
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Refactory-Lint-Transformation Rules'
!

!RBContainsToConformRule class methodsFor:'documentation'!

copyright
"
 Copyright (C) 2014 Claus Gittinger

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

!RBContainsToConformRule methodsFor:'accessing'!

group
	^ 'Transformations'
!

name
    ^ '"(contains:[expr not]) not" -> "conform:[expr]"'
!

rationale
    ^ 'Can rewrite <code><pre>    (contains:[:el | expr not]) not</pre></code> 
into <code><pre>    conform:[:el | expr]</pre></code>'
!

severity
        ^ SeverityInformation
! !

!RBContainsToConformRule methodsFor:'initialization'!

initialize
        super initialize.
        self rewriteRule
                replace: '(``@collection contains: [:`each | | `@temps | ( ``@Expr ) not]) not'
                with: '``@collection conform: [:`each | | `@temps | ``@Expr]';

                replace: '(``@collection contains: [:`each | | `@temps | ( ``@Expr1 ) not and:[ (``@Expr2) not]]) not'
                with: '``@collection conform: [:`each | | `@temps | ``@Expr1 or:[ ``@Expr2]]';

                replace: '(``@collection contains: [:`each | | `@temps | (``@Expr1) notNil and:[(``@Expr2) not]]) not'
                with: '``@collection conform: [:`each | | `@temps | ``@Expr1 isNil or:[ ``@Expr2]]';

                replace: '(``@collection contains: [:`each | | `@temps | (``@Expr1 ) notNil and:[(``@Expr2) notNil]]) not'
                with: '``@collection conform: [:`each | | `@temps | (``@Expr1) isNil or:[ (``@Expr2 ) isNil]]'
! !

!RBContainsToConformRule class methodsFor:'documentation'!

version
    ^ '$Header$'
!

version_CVS
    ^ '$Header$'
! !
