// Test sentence iteration of BreakIterator.
// Copyright (c) 1999  Cygnus Solutions
// Copyright (c) 2002  Free Software Foundation, Inc.
// Written by Tom Tromey <tromey@cygnus.com>
// This file is part of Mauve.
// Mauve is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
// Mauve is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// You should have received a copy of the GNU General Public License
// along with Mauve; see the file COPYING.  If not, write to
// the Free Software Foundation, 59 Temple Place - Suite 330,
// Boston, MA 02111-1307, USA.
// Tags: JDK1.1
package gnu.testlet.java.text.BreakIterator;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;

import java.text.BreakIterator;
import java.util.Locale;

public class sentiter implements Testlet {

    public void check(String name, String in, String[] out, BreakIterator bi,
          TestHarness harness) {
        harness.checkPoint(name);
        bi.setText(in);

        int index = 0;
        int from = bi.current();
        harness.check(from, 0);

        while (true) {
            int to = bi.next();
            if (to == BreakIterator.DONE) {
                break;
            }
            harness.check(in.substring(from, to), out[index]);
            ++index;
            from = to;
        }

        harness.check(index, out.length);


        harness.checkPoint("backwards " + name);
        bi.last();
        index = out.length - 1;
        from = bi.current();
        harness.check(from, in.length());

        while (true) {
            int to = bi.previous();
            if (to == BreakIterator.DONE) {
                break;
            }
            harness.check(in.substring(to, from), out[index]);
            --index;
            from = to;
        }

        harness.check(index, -1);
    }

    public void test(TestHarness harness) {
        // Just to be explicit: we're only testing the US locale here.
        Locale loc = Locale.US;
        Locale.setDefault(loc);

        BreakIterator bi = BreakIterator.getSentenceInstance(loc);

        String[] r1 = {"How much time is left?  ",
            "We don't know."};
        check("How much", "How much time is left?  We don't know.", r1,
              bi, harness);

        String[] r2 = {"Having a sentence end with a dot.return.\n",
            "Should also work."};
        check("dot.return", "Having a sentence end with a dot.return.\n"
              + "Should also work.", r2, bi, harness);
    }
}
