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

"{ NameSpace: VAST }"

Object subclass:#SubApplication
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Compatibility-VisualAge'
!

SubApplication class instanceVariableNames:'ParentApplication'

"
 No other class instance variables are inherited by this class.
"
!

!SubApplication class methodsFor:'documentation'!

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

    this class is provided to allow for an initial fileIn of V'Age classes.
    Classes should then be moved to their desired position in the ST/X class hierarchy.

    Except for the required protocol mimicri,
    it does not (yet) provide any functionality.
"
! !

!SubApplication class methodsFor:'accessing'!

parentApplication:anApplication
    ParentApplication := anApplication.

    "Modified (format): / 07-02-2012 / 17:31:44 / cg"
! !

!SubApplication class methodsFor:'fileIn support'!

becomeDefault
    "encountered when filing in V'Age classes.
     Change the default application for the current fileIn"

    Smalltalk::Class changeDefaultApplicationNotificationSignal raiseWith:self.

    "Created: / 15-06-1998 / 18:22:31 / cg"
    "Modified: / 07-02-2012 / 17:35:44 / cg"
! !

!SubApplication class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/libcompat/SubApplication.st,v 1.9 2017-11-09 09:04:10 mawalch Exp $'
!

version_CVS
    ^ '$Header: /cvs/stx/stx/libcompat/SubApplication.st,v 1.9 2017-11-09 09:04:10 mawalch Exp $'
! !
