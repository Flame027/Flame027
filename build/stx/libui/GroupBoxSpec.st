"
 COPYRIGHT (c) 1996 by Claus Gittinger
              All Rights Reserved

 This software is furnished under a license and may be used
 only in accordance with the terms of that license and with the
 inclusion of the above copyright notice.   This software may not
 be provided or otherwise made available to, or used by, any
 other person.  No title to or ownership of the software is
 hereby transferred.
"




"{ Package: 'stx:libui' }"

FramedBoxSpec subclass:#GroupBoxSpec
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'Interface-Support-UI-Specs'
!

!GroupBoxSpec class methodsFor:'documentation'!

copyright
"
 COPYRIGHT (c) 1996 by Claus Gittinger
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
    Not normally used by applications.

    Notice: 
        In ST/X, a groupBox is a framedBox.
        this class was implemented using protocol information
        from alpha testers, literature and by read public domain code
        - it may not be complete or compatible to
        the corresponding ST-80 class. 
        If you encounter any incompatibilities, please forward a note 
        describing the incompatibility verbal (i.e. no code) to the ST/X team.

    [author:]
        Claus Atzkern

    [see also:]
        UIBuilder
        UIPainter
"
! !

!GroupBoxSpec methodsFor:'queries'!

viewClass
    ^ FramedBox


! !

!GroupBoxSpec class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/libui/GroupBoxSpec.st,v 1.8 2000-09-03 13:25:18 cg Exp $'
! !