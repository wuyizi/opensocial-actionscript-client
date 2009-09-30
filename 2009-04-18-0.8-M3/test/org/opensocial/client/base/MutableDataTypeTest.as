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
 * Tests for MutableDataType.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class MutableDataTypeTest extends TestCase {
  public function testConstructor():void {
    var rawObject:Object = MutableDataType.createRawObject();
    var dataType:MutableDataType = new MutableDataType(rawObject);
    Assert.oneAssertionHasBeenMade();

    try {
      new MutableDataType(null);
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(2, Assert.assetionsMade);
  }

  public function testSetField():void {
    var rawObject:Object = MutableDataType.createRawObject();
    var dataType:MutableDataType = new MutableDataType(rawObject);
    dataType.setField("someKey", "someValue");
    Assert.assertEquals("someValue", dataType.getField("someKey"));
    dataType.setField("someKey", "someValue2");
    Assert.assertEquals("someValue2", dataType.getField("someKey"));


    var a:int = Assert.assetionsMade;
    try {
      dataType = new MutableDataType({});
      dataType.setField("someKey", "someValue");
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);
  }

  public function testToRawObject():void {
    var rawObject:Object = MutableDataType.createRawObject();
    var dataType:MutableDataType = new MutableDataType(rawObject);
    Assert.assertEquals(rawObject, dataType.toRawObject());
  }

  public function testCreateRawObject():void {
    var rawObject:Object = MutableDataType.createRawObject();
    Assert.assertNotUndefined(rawObject["fields"]);
  }
}
}