// $Id: MauveAlgorithm.java,v 1.2 2015-03-20 13:29:50 vrany Exp $
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
// Tags: not-a-test
package gnu.testlet.java.security.KeyPairGenerator;

import java.security.KeyPairGeneratorSpi;
import java.security.SecureRandom;
import java.security.KeyPair;

public class MauveAlgorithm extends KeyPairGeneratorSpi {

    public void initialize(int keysize, SecureRandom random) {
    }

    public KeyPair generateKeyPair() {
        return null;
    }
}
