"
 COPYRIGHT (c) 1992 by Claus Gittinger
              All Rights Reserved

 This software is furnished under a license and may be used
 only in accordance with the terms of that license and with the
 inclusion of the above copyright notice.   This software may not
 be provided or otherwise made available to, or used by, any
 other person.  No title to or ownership of the software is
 hereby transferred.

 This is a demo example:

 THIS SOFTWARE IS PROVIDED BY THE CONTRIBUTOR ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE CONTRIBUTOR BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.
"



"{ NameSpace: CodingExamples_GUI }"

ApplicationModel subclass:#PathDemo3
	instanceVariableNames:''
	classVariableNames:''
	poolDictionaries:''
	category:'examples-Paths'
!

!PathDemo3 class methodsFor:'documentation'!

copyright
"
 COPYRIGHT (c) 1992 by Claus Gittinger
              All Rights Reserved

 This software is furnished under a license and may be used
 only in accordance with the terms of that license and with the
 inclusion of the above copyright notice.   This software may not
 be provided or otherwise made available to, or used by, any
 other person.  No title to or ownership of the software is
 hereby transferred.

 This is a demo example:

 THIS SOFTWARE IS PROVIDED BY THE CONTRIBUTOR ``AS IS'' AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED.  IN NO EVENT SHALL THE CONTRIBUTOR BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 SUCH DAMAGE.
"


!

documentation
"
    Demonstration of Spline & GeometricWrappers.

    draws splines with various styles, such as solid & doubleDashed;
    filled and unfilled.

    [author:]
        Claus Gittinger (written Dec-92 / changed for Geometry May-96)

    [see also:]
        Spline LineSegment Polygon 
        Geometric
        StrokingWrapper FillingWrapper
        PathDemo1 PathDemo2 PathDemo4 PathDemo5 PathDemo6 PathDemo7

    [start with:]
        PathDemo3 open
"
! !

!PathDemo3 methodsFor:'initialization'!

initElementsIn:aView
    "add various splines as visual components to aView"

    |v|

    "Display the star example from the Blue Book, pg. 403."

    v := OrderedCollection new.
    v add:0 @ 85.
    v add:250 @ 85.
    v add:35 @ 230.
    v add:130 @ 0.
    v add:225 @ 230.
    v add:0 @ 85.
    aView addComponent:((FillingWrapper on:(Spline controlPoints:v))
                        foregroundColor:(Image fromFile:'woodV.tiff')).

    v := OrderedCollection new.
    v add:50 @ 135.
    v add:300 @ 135.
    v add:85 @ 280.
    v add:180 @ 50.
    v add:275 @ 280.
    v add:50 @ 135.
    aView addComponent:((StrokingWrapper on:(Spline controlPoints:v))
                        lineWidth:5).

    v := OrderedCollection new.
    v add:150 @ 235.
    v add:400 @ 235.
    v add:185 @ 380.
    v add:280 @ 150.
    v add:375 @ 380.
    v add:150 @ 235.

    aView addComponent:((StrokingWrapper on:(Spline controlPoints:v))
                        lineWidth:5;
                        lineStyle:#doubleDashed;
                        foregroundColor:(Color blue);
                        backgroundColor:(Color white)).
!

openInterface
    "create a topView, define its extent & window label"

    |top|

    top := StandardSystemView new.
    top extent:(400 @ 400).
    top label:'Splines'.

    self initElementsIn:top.

    top open.

    "
     PathDemo3 open
    "


! !

!PathDemo3 class methodsFor:'documentation'!

version
    ^ '$Header: /cvs/stx/stx/doc/coding/View-drawing-path3.st,v 1.12 1997-01-03 20:34:30 cg Exp $'
! !