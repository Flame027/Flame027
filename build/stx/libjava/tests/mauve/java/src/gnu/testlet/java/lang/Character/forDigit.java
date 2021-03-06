// Tags: JDK1.0
// Copyright (C) 1998 Cygnus Solutions
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
package gnu.testlet.java.lang.Character;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;

public class forDigit implements Testlet {

    public void test(TestHarness harness) {
        harness.check(Character.forDigit(-1, 5), 0);
        harness.check(Character.forDigit(7, 5), 0);
        harness.check(Character.forDigit(0, 1), 0);
        harness.check(Character.forDigit(5, 37), 0);
        harness.check(Character.forDigit(8, 10), '8');
        harness.check(Character.forDigit(12, 16), 'c');
        harness.check(Character.forDigit(34, 36), 'y');
    }
}
