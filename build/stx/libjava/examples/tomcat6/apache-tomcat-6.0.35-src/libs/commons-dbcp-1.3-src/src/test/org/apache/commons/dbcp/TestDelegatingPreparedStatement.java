/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 * 
 *      http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.commons.dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;

import junit.framework.Test;
import junit.framework.TestCase;
import junit.framework.TestSuite;

/**
 * @author Rodney Waldhoff
 * @author Dirk Verbeeck
 * @version $Revision: 1.5 $ $Date: 2015-03-20 12:08:10 $
 */
public class TestDelegatingPreparedStatement extends TestCase {
    public TestDelegatingPreparedStatement(String testName) {
        super(testName);
    }

    public static Test suite() {
        return new TestSuite(TestDelegatingPreparedStatement.class);
    }

    private DelegatingConnection conn = null;
    private Connection delegateConn = null;
    private DelegatingPreparedStatement stmt = null;
    private PreparedStatement delegateStmt = null;

    public void setUp() throws Exception {
        delegateConn = new TesterConnection("test", "test");
        conn = new DelegatingConnection(delegateConn);
    }

    public void testExecuteQueryReturnsNull() throws Exception {
        delegateStmt = new TesterPreparedStatement(delegateConn,"null");
        stmt = new DelegatingPreparedStatement(conn,delegateStmt);
        assertNull(stmt.executeQuery());
    }

    public void testExecuteQueryReturnsNotNull() throws Exception {
        delegateStmt = new TesterPreparedStatement(delegateConn,"select * from foo");
        stmt = new DelegatingPreparedStatement(conn,delegateStmt);
        assertTrue(null != stmt.executeQuery());
    }

    public void testGetDelegate() throws Exception {
        delegateStmt = new TesterPreparedStatement(delegateConn,"select * from foo");
        stmt = new DelegatingPreparedStatement(conn,delegateStmt);
        assertEquals(delegateStmt,stmt.getDelegate());
    }

    public void testHashCodeNull() {
        stmt = new DelegatingPreparedStatement(conn, null);
        assertEquals(0, stmt.hashCode());
    }
    
    public void testHashCode() {
        delegateStmt = new TesterPreparedStatement(delegateConn,"select * from foo");
        DelegatingPreparedStatement stmt1 = new DelegatingPreparedStatement(conn,delegateStmt);
        DelegatingPreparedStatement stmt2 = new DelegatingPreparedStatement(conn,delegateStmt);
        assertEquals(stmt1.hashCode(), stmt2.hashCode());
    }
    
    public void testEquals() {
        delegateStmt = new TesterPreparedStatement(delegateConn,"select * from foo");
        PreparedStatement del = new TesterPreparedStatement(delegateConn,"select * from foo");
        DelegatingPreparedStatement stmt1 = new DelegatingPreparedStatement(conn, delegateStmt);
        DelegatingPreparedStatement stmt2 = new DelegatingPreparedStatement(conn, delegateStmt);
        DelegatingPreparedStatement stmt3 = new DelegatingPreparedStatement(conn, null);
        DelegatingPreparedStatement stmt4 = new DelegatingPreparedStatement(conn, del);
        
        // Nothing is equal to null
        assertFalse(stmt1.equals(null));
        assertFalse(stmt2.equals(null));
        assertFalse(stmt3.equals(null));
        assertFalse(stmt4.equals(null));
        
        // 1 & 2 are equivalent
        assertTrue(stmt1.equals(stmt2));
        assertTrue(stmt2.equals(stmt1)); // reflexive

        // 1 & 3 are not (different statements, one null)
        assertFalse(stmt1.equals(stmt3));
        assertFalse(stmt3.equals(stmt1)); // reflexive

        // 1 & 4 are not (different statements)
        assertFalse(stmt1.equals(stmt4));
        assertFalse(stmt4.equals(stmt1)); // reflexive

        // Check self-equals
        assertTrue(stmt1.equals(stmt1));
        assertTrue(stmt2.equals(stmt2));
        assertFalse(stmt3.equals(stmt3)); // because underlying statement is null
        assertTrue(stmt4.equals(stmt4));
        
        DelegatingStatement dstmt1 = stmt1;
        
        // 1 & 2 are equivalent
        assertTrue(dstmt1.equals(stmt2));
        assertTrue(stmt2.equals(dstmt1)); // reflexive

    }

}
