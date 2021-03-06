// Tags: JDK1.4
// Uses: TestProvider
// Copyright (C) 2004 Sascha Brawer <brawer@dandelis.ch>
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
package gnu.testlet.javax.imageio.spi.ImageInputStreamSpi;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;

/**
 * @author <a href="mailto:brawer@dandelis.ch">Sascha Brawer</a>
 */
public class ImageInputStreamSpi
      implements Testlet {

    public void test(TestHarness h) {
        Throwable caught;
        javax.imageio.spi.ImageInputStreamSpi sp;

        // Check #1.
        sp = new TestProvider();
        h.check(sp.getVendorName(), null);

        // Check #2.
        h.check(sp.getVersion(), null);

        // Check #3.
        h.check(sp.getInputClass(), null);

        // Check #4.
        caught = null;
        try {
            new TestProvider(null, "foo", String.class);
        } catch (Exception ex) {
            caught = ex;
        }
        h.check(caught instanceof IllegalArgumentException);

        // Check #5.
        caught = null;
        try {
            new TestProvider("foo", null, String.class);
        } catch (Exception ex) {
            caught = ex;
        }
        h.check(caught instanceof IllegalArgumentException);

        // Check #6.
        caught = null;
        try {
            new TestProvider("foo", "bar", null);
        } catch (Exception ex) {
            caught = ex;
        }
        h.check(caught == null);

        // Check #7 .. #9.
        sp = new TestProvider("FSF", "1.0", String.class);
        h.check(sp.getVendorName(), "FSF");        // Check #7.
        h.check(sp.getVersion(), "1.0");           // Check #8.
        h.check(sp.getInputClass(), String.class); // Check #9.
    }
}
