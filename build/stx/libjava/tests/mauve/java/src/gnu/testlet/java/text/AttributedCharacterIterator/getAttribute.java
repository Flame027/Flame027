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
// the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, 
// Boston, MA 02110-1301 USA.
package gnu.testlet.java.text.AttributedCharacterIterator;

import gnu.testlet.TestHarness;
import gnu.testlet.Testlet;

import java.awt.font.TextAttribute;
import java.text.AttributedCharacterIterator;
import java.text.AttributedString;

/**
 * Some checks for the getAttribute() methods in the 
 * {@link AttributedCharacterIterator} interface.  
 */
public class getAttribute implements Testlet {

    /**
     * Runs the test using the specified harness. 
     * 
     * @param harness  the test harness (<code>null</code> not allowed).
     */
    public void test(TestHarness harness) {
        harness.checkPoint("getAttribute(AttributedCharacterIterator.Attribute);");

        AttributedString as = new AttributedString("ABCDEFG");
        as.addAttribute(TextAttribute.LANGUAGE, "English");
        AttributedCharacterIterator aci = as.getIterator();

        harness.check(aci.getAttribute(TextAttribute.LANGUAGE), "English");
        harness.check(aci.getAttribute(TextAttribute.FONT), null);

        // try null attribute
        harness.check(aci.getAttribute(null), null);
    }
}
