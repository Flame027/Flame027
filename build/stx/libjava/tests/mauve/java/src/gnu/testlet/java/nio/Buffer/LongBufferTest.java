// Tags: JDK1.4
// Uses: BufferFactory PlainBufferTest WrappedWithOffsetBufferTest
// Copyright (C) 2004 Max Gilead <gilead@yellowhedgehog.com>
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
package gnu.testlet.java.nio.Buffer;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;

import java.nio.Buffer;
import java.nio.LongBuffer;

public class LongBufferTest implements Testlet {

    public void test(TestHarness h) {
        h.debug("Testing LongBufferTest.allocate(int) Buffer");
        new PlainBufferTest().test(h, new BufferFactory() {

            public Buffer newInstance() {
                return LongBuffer.allocate(10);
            }
        });

        h.debug("Testing LongBufferTest.wrap(long[]) Buffer");
        new PlainBufferTest().test(h, new BufferFactory() {

            public Buffer newInstance() {
                return LongBuffer.wrap(new long[10]);
            }
        });

        h.debug("Testing LongBufferTest.wrap(long[], int, int) Buffer");
        new WrappedWithOffsetBufferTest().test(h, new BufferFactory() {

            public Buffer newInstance() {
                return LongBuffer.wrap(new long[20], 10, 10);
            }
        });
    }
}
