"
 COPYRIGHT (c) 2006 by eXept Software AG
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

Object subclass:#Win32Shell
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Compatibility-Squeak'
!

!Win32Shell class methodsFor:'documentation'!

copyright
"
 COPYRIGHT (c) 2006 by eXept Software AG
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

!Win32Shell methodsFor:'operations'!

shellExecute:hwnd lpOperation:lpOperation lpFile:lpFile lpParameters:lpParameters lpDirectory:lpDirectory nShowCmd:nShowCmd 
    ^ OperatingSystem
        shellExecute:hwnd 
        lpOperation:lpOperation 
        lpFile:lpFile 
        lpParameters:lpParameters 
        lpDirectory:lpDirectory 
        nShowCmd:nShowCmd 
! !

!Win32Shell class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/libcompat/Win32Shell.st,v 1.3 2017-01-28 00:00:09 cg Exp $'
! !
