"
jv:libgdbs - GNU Debugger Interface Library
Copyright (C) 2015-now Jan Vrany

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License. 

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
"
"{ Package: 'jv:libgdbs' }"

"{ NameSpace: Smalltalk }"

GDBMICommand subclass:#GDBMI_inferior_tty_show
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'GDB-Core-Commands-MI'
!

!GDBMI_inferior_tty_show class methodsFor:'documentation'!

copyright
"
jv:libgdbs - GNU Debugger Interface Library
Copyright (C) 2015-now Jan Vrany

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License. 

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
"
!

documentation
"
The `-inferior-tty-show' Command
--------------------------------

Synopsis
--------

     -inferior-tty-show

   Show terminal for future runs of program being debugged.

{No value for `GDBN'} Command
-----------------------------

The corresponding {No value for `GDBN'} command is `show inferior-tty'.

Example
-------

     (gdb)
     -inferior-tty-set /dev/pts/1
     ^done
     (gdb)
     -inferior-tty-show
     ^done,inferior_tty_terminal='/dev/pts/1'
     (gdb)


"
! !

!GDBMI_inferior_tty_show methodsFor:'accessing'!

operation
	^ 'inferior-tty-show'
! !
