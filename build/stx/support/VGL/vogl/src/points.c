#include "vogl.h"

/*
 * pnt
 *
 * plot a point in x, y, z.
 * This is just the old VOGLE routine point.
 *
 */
void
pnt(x, y, z)
	float 	x, y, z;
{

	if(!vdevice.initialised) {
		verror("pnt: vogl not initialised");
		return;
	}

	move(x, y, z);  
	draw(x, y, z);	
}

#define pnt(_x,_y,_z) \
    { \
	float   __x = (float)_x, \
		__y = (float)_y, \
		__z = (float)_z; \
	if(!vdevice.initialised) { \
	    verror("pnt: vogl not initialised"); \
	    return; \
	} \
	move(__x, __y, __z); \
	draw(__x, __y, __z); \
    }

/*
 * pnts
 *
 * plot a point (short integer version)
 *
 */
void
pnts(x, y, z)
	Scoord	x, y;
{
	pnt((Coord)x, (Coord)y, (Coord)z);
}

/*
 * pnti
 *
 * plot a point (short integer version)
 *
 */
void
pnti(x, y, z)
	Icoord	x, y, z;
{
	pnt((Coord)x, (Coord)y, (Coord)z);
}

/*
 * pnt2
 *
 * plot a point in x, y.
 *
 */
void
pnt2(x, y)
	Coord	x, y;
{
#ifdef ORIGINAL
	move(x, y, 0.0);
	draw(x, y, 0.0);
#else
	pnt((Coord)x, (Coord)y, 0.0);
#endif
}

/*
 * pnt2s in x, y
 *
 * plot a point (short integer version)
 *
 */
void
pnt2s(x, y)
	Scoord	x, y;
{
	pnt2((Coord)x, (Coord)y);
}

/*
 * pnt2i in x, y
 *
 * plot a point (short integer version)
 *
 */
void
pnt2i(x, y)
	Icoord	x, y;
{
	pnt2((Coord)x, (Coord)y);
}

/*
 * bgnpoint
 *
 * 	Flags that all v*() routine points will be building up a point list.
 */
void
bgnpoint()
{
	if (vdevice.bgnmode != NONE) {
		verror("vogl: bgnpoint mode already belongs to some other bgn routine");
		return;
	}

	vdevice.bgnmode = VPNT;
	vdevice.save = 0;
}

/*
 * endpoint
 *
 * 	Flags that all v*() routine points will be simply setting the 
 * 	current position.
 */
void
endpoint()
{
#ifndef ORIGINAL
        if (vdevice.bgnmode != VPNT) {
            verror("vogl: endpoint, without beginpoint");
            return;
        }
#endif
	vdevice.bgnmode = NONE;
	vdevice.save = 0;
}
