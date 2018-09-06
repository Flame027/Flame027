"
 COPYRIGHT (c) 2000 by eXept Software AG
              All Rights Reserved

 This software is furnished under a license and may be used
 only in accordance with the terms of that license and with the
 inclusion of the above copyright notice.   This software may not
 be provided or otherwise made available to, or used by, any
 other person.  No title to or ownership of the software is
 hereby transferred.
"
"{ Package: 'stx:libcompat' }"

"{ NameSpace: Smalltalk }"

Controller subclass:#MouseMenuController
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Compatibility-Squeak'
!

!MouseMenuController class methodsFor:'documentation'!

copyright
"
 COPYRIGHT (c) 2000 by eXept Software AG
              All Rights Reserved

 This software is furnished under a license and may be used
 only in accordance with the terms of that license and with the
 inclusion of the above copyright notice.   This software may not
 be provided or otherwise made available to, or used by, any
 other person.  No title to or ownership of the software is
 hereby transferred.
"
!

documentation
"
    DO NOT DIRECTLY REFER TO THIS CLASS OR USE IT OTHERWISE IN YOUR CODE:

    This is a dummy, mimicry class to allow some squeak code to be filed in.
    Its protocol is neither complete, nor fully compatible with the corresponding
    squeak original class.
"
! !

!MouseMenuController methodsFor:'accessing'!

yellowButtonMenu:aMenu yellowButtonMessages:selectors
    "/ menu := aMenu selectors:selectors
self halt.
! !

!MouseMenuController class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/libcompat/MouseMenuController.st,v 1.7 2017-03-07 20:09:12 cg Exp $'
!

version_CVS
    ^ '$Header: /cvs/stx/stx/libcompat/MouseMenuController.st,v 1.7 2017-03-07 20:09:12 cg Exp $'
! !
