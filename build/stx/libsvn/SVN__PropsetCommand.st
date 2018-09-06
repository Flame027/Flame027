"
 Copyright (c) 2007-2010 Jan Vrany
 Copyright (c) 2009-2010 eXept Software AG

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
"{ Package: 'stx:libsvn' }"

"{ NameSpace: SVN }"

WCPathCommand subclass:#PropsetCommand
	instanceVariableNames:'name value'
	classVariableNames:''
	poolDictionaries:''
	category:'SVN-Private-Commands'
!

!PropsetCommand class methodsFor:'documentation'!

copyright
"
 Copyright (c) 2007-2010 Jan Vrany
 Copyright (c) 2009-2010 eXept Software AG

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
! !

!PropsetCommand class methodsFor:'others'!

version_CVS
    ^ '$Header$'
! !

!PropsetCommand methodsFor:'accessing'!

name
    ^ name

    "Created: / 10-10-2008 / 12:43:37 / Jan Vrany <vranyj1@fel.cvut.cz>"
!

name:aString
    name := aString.

    "Created: / 10-10-2008 / 12:43:37 / Jan Vrany <vranyj1@fel.cvut.cz>"
!

value
    ^ value

    "Created: / 10-10-2008 / 12:43:37 / Jan Vrany <vranyj1@fel.cvut.cz>"
!

value:aString
    value := aString.

    "Created: / 10-10-2008 / 12:43:37 / Jan Vrany <vranyj1@fel.cvut.cz>"
! !

!PropsetCommand methodsFor:'executing - private'!

svnCmd
    "raise an error: must be redefined in concrete subclass(es)"

    ^'propset'

    "Created: / 10-10-2008 / 12:43:04 / Jan Vrany <vranyj1@fel.cvut.cz>"
!

svnCmdArgumentsOn:arg
    "raise an error: must be redefined in concrete subclass(es)"

    arg
	nextPut: name;
	nextPut: value;
	nextPutAll:paths asArray

    "Created: / 10-10-2008 / 12:44:41 / Jan Vrany <vranyj1@fel.cvut.cz>"
! !

!PropsetCommand class methodsFor:'documentation'!

version
    ^ '$Header$'
!

version_SVN
    ^ '�Id: SVN__PropsetCommand.st 363 2011-08-08 13:49:48Z vranyj1 �'
! !