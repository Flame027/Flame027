// Tags: JDK1.2
// Copyright (C) 2005 David Gilbert <david.gilbert@object-refinery.com>
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
package gnu.testlet.java.text.SimpleDateFormat;

import gnu.testlet.TestHarness;
import gnu.testlet.Testlet;

import java.text.SimpleDateFormat;
import java.util.Locale;

/**
 * Some checks for the toLocalizedPattern() method in the SimpleDateFormat
 * class.  
 */
public class toLocalizedPattern implements Testlet {

    /**
     * Runs the test using the specified harness.
     * 
     * @param harness  the test harness (<code>null</code> not allowed).
     */
    public void test(TestHarness harness) {
        SimpleDateFormat f = new SimpleDateFormat("yyyy", Locale.CHINA);
        harness.check(f.toLocalizedPattern(), "aaaa");
        f.applyPattern("d-MMM-yyyy");
        harness.check(f.toLocalizedPattern(), "j-nnn-aaaa");
    }
}
