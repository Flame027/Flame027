// $Id: getInstance14.java,v 1.2 2015-03-20 13:29:50 vrany Exp $
//
// Copyright (C) 2003, Free Software Foundation, Inc.
//
// This file is part of Mauve.
//
// Mauve is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
//
// Mauve is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Mauve; see the file COPYING.  If not, write to
// the Free Software Foundation, 59 Temple Place - Suite 330,
// Boston, MA 02111-1307, USA.
//
// Tags: JDK1.4
// Uses: MauveAlgorithm
package gnu.testlet.java.security.AlgorithmParameterGenerator;

import gnu.testlet.Testlet;
import gnu.testlet.TestHarness;
import java.security.AlgorithmParameterGenerator;
import java.security.Provider;
import java.security.NoSuchAlgorithmException;
import java.security.Security;

public class getInstance14 extends Provider implements Testlet {

    public getInstance14() {
        super("AlgorithmParameterGenerator", 1.0, "");

        put("AlgorithmParameterGenerator.foo",
              "gnu.testlet.java.security.AlgorithmParameterGenerator.MauveAlgorithm");
        put("Alg.Alias.AlgorithmParameterGenerator.bar", "foo");
    }

    public void test(TestHarness harness) {
        harness.checkPoint("AlgorithmParameterGenerator");

        AlgorithmParameterGenerator spi;
        Provider provider = this;
        Security.addProvider(provider);
        String signature;

        spi = null;
        signature = "getInstance(\"foo\", provider)";
        try {
            spi = AlgorithmParameterGenerator.getInstance("foo", provider);
            harness.check(spi != null, signature);
        } catch (NoSuchAlgorithmException x) {
            harness.fail(signature);
            harness.debug(x);
        }

        spi = null;
        signature = "getInstance(\"FOO\", provider)";
        try {
            spi = AlgorithmParameterGenerator.getInstance("FOO", provider);
            harness.check(spi != null, signature);
        } catch (NoSuchAlgorithmException x) {
            harness.fail(signature);
            harness.debug(x);
        }

        spi = null;
        signature = "getInstance(\"bar\", provider)";
        try {
            spi = AlgorithmParameterGenerator.getInstance("bar", provider);
            harness.check(spi != null, signature);
        } catch (NoSuchAlgorithmException x) {
            harness.fail(signature);
            harness.debug(x);
        }

        spi = null;
        signature = "getInstance(\"BAR\", provider)";
        try {
            spi = AlgorithmParameterGenerator.getInstance("BAR", provider);
            harness.check(spi != null, signature);
        } catch (NoSuchAlgorithmException x) {
            harness.fail(signature);
            harness.debug(x);
        }
    }
}
