/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

package org.opensocial.client.base {

import flexunit.framework.Assert;
import flexunit.framework.TestCase;

/**
 * Tests for OpenSocialError.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class OpenSocialErrorTest extends TestCase {

  public function testConstructor():void {
    var error:OpenSocialError = new OpenSocialError("errMsg", "errCode");
    Assert.assertEquals("[OpenSocial] errMsg", error.message);
    Assert.assertEquals(17785, error.errorID);
    Assert.assertEquals("errCode", error.code);
  }
}
}
