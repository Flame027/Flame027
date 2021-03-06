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

package org.apache.commons.dbcp.datasources;

import javax.naming.RefAddr;
import javax.naming.Reference;

/**
 * A JNDI ObjectFactory which creates <code>SharedPoolDataSource</code>s
 * @version $Revision: 1.5 $ $Date: 2015-03-20 12:08:10 $
 */
public class SharedPoolDataSourceFactory
    extends InstanceKeyObjectFactory
{
    private static final String SHARED_POOL_CLASSNAME =
        SharedPoolDataSource.class.getName();

    protected boolean isCorrectClass(String className) {
        return SHARED_POOL_CLASSNAME.equals(className);
    }

    protected InstanceKeyDataSource getNewInstance(Reference ref) {
        SharedPoolDataSource spds = new SharedPoolDataSource();
        RefAddr ra = ref.get("maxActive");
        if (ra != null && ra.getContent() != null) {
            spds.setMaxActive(
                Integer.parseInt(ra.getContent().toString()));
        }

        ra = ref.get("maxIdle");
        if (ra != null && ra.getContent() != null) {
            spds.setMaxIdle(
                Integer.parseInt(ra.getContent().toString()));
        }

        ra = ref.get("maxWait");
        if (ra != null && ra.getContent() != null) {
            spds.setMaxWait(
                Integer.parseInt(ra.getContent().toString()));
        }
        
        return spds;
    }            
}

