/* RemoveAllTest.java -- test for removeAll. 
Copyright (C) 2007 Mario Torre <neugens@limasoftware.net>
This file is part of Mauve.

Mauve is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2, or (at your option)
any later version.

Mauve is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with Mauve; see the file COPYING.  If not, write to the
Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
02110-1301 USA.

 */
// Tags: JDK1.5
package gnu.testlet.java.util.concurrent.CopyOnWriteArrayList;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import java.util.concurrent.CopyOnWriteArrayList;

import gnu.testlet.TestHarness;
import gnu.testlet.Testlet;

/**
 * @author Mario Torre <neugens@limasoftware.net>
 */
public class RemoveAllTest
      implements Testlet {

    public void test(TestHarness harness) {
        CopyOnWriteArrayList<String> list = new CopyOnWriteArrayList<String>();
        for (int i = 0; i < 10; i++) {
            list.add("#" + i);
        }

        List<String> list2 = new ArrayList<String>();

        for (int i = 3; i < 20; i++) {
            list2.add("#" + i);
        }

        list.removeAll(list2);

        harness.check(list.size() == 3);

        int i = 0;
        for (ListIterator<String> elements = list.listIterator();
              elements.hasNext();) {
            harness.check(elements.next().equals("#" + i));
            i++;
        }
    }
}
