/*************************************************************************
/* MarkReset.java -- StringBufferInputStream mark/reset test
/*
/* Copyright (c) 1998 Free Software Foundation, Inc.
/* Written by Aaron M. Renn (arenn@urbanophile.com)
/*
/* This program is free software; you can redistribute it and/or modify
/* it under the terms of the GNU General Public License as published 
/* by the Free Software Foundation, either version 2 of the License, or
/* (at your option) any later version.
/*
/* This program is distributed in the hope that it will be useful, but
/* WITHOUT ANY WARRANTY; without even the implied warranty of
/* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/* GNU General Public License for more details.
/*
/* You should have received a copy of the GNU General Public License
/* along with this program; if not, write to the Free Software Foundation
/* Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307 USA
/*************************************************************************/
// Tags: JDK1.0
package gnu.testlet.java.io.StringBufferInputStream;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;
import java.io.*;

public class MarkReset implements Testlet {

    public void test(TestHarness harness) {
        String str = "Between my freshman and sophomore years of high school\n"
              + "we moved into a brand new building.  The old high school was turned\n"
              + "into an elementary school.\n";

        StringBufferInputStream sbis = new StringBufferInputStream(str);

        try {
            boolean passed = true;

            byte[] read_buf = new byte[12];
            sbis.read(read_buf);
            harness.check(sbis.available(), str.length() - read_buf.length,
                  "available pre skip");
            harness.check(sbis.skip(5), 5, "skip");
            harness.check(sbis.available(), str.length() - (read_buf.length + 5),
                  "available post skip");
            harness.check(!sbis.markSupported(), "markSupported");
            sbis.reset();
            harness.check(sbis.available(), str.length(), "reset()");
        } catch (IOException e) {
            harness.debug(e);
            harness.check(false);
        }
    }
}
