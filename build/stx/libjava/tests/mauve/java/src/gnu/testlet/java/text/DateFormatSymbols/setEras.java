// Tags: JDK1.2
// Copyright (C) 2004 David Gilbert <david.gilbert@object-refinery.com>
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
// Boston, MA 02111-1307, USA.  */
package gnu.testlet.java.text.DateFormatSymbols;

import gnu.testlet.TestHarness;
import gnu.testlet.Testlet;

import java.text.DateFormatSymbols;
import java.util.Locale;

/**
 * Some checks for the setEras() method in the DateFormatSymbols
 * class.  
 */
public class setEras implements Testlet {

    /**
     * Runs the test using the specified harness.
     * 
     * @param harness  the test harness (<code>null</code> not allowed).
     */
    public void test(TestHarness harness) {

        // check null argument - it isn't mentioned in the spec that this
        // should throw a NullPointerException, but that is such common
        // behaviour elsewhere that I'm assuming this is the expected 
        // result
        DateFormatSymbols dfs = new DateFormatSymbols(Locale.UK);
        try {
            dfs.setEras(null);
            harness.check(false);
        } catch (NullPointerException e) {
            harness.check(true);
        }
    }
}
