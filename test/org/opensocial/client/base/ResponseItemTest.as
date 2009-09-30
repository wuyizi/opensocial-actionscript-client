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

import flash.external.ExternalInterface;

import flexunit.framework.Assert;
import flexunit.framework.TestCase;

/**
 * Tests for ResponseItem.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ResponseItemTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testConstructor():void {
    var data:Object = {"data1": 123, "data2": "abc"};
    var responseItem:ResponseItem = new ResponseItem(data, "errCode", "errMsg");

    Assert.assertEquals(123, responseItem.getData()["data1"]);
    Assert.assertEquals("abc", responseItem.getData()["data2"]);
    Assert.assertEquals("errCode", responseItem.getErrorCode());
    Assert.assertEquals("errMsg", responseItem.getErrorMessage());

    var responseItem2:ResponseItem = new ResponseItem(responseItem);
    Assert.assertEquals(123, responseItem2.getData()["data1"]);
    Assert.assertEquals("abc", responseItem2.getData()["data2"]);
    Assert.assertEquals("errCode", responseItem2.getErrorCode());
    Assert.assertEquals("errMsg", responseItem2.getErrorMessage());
  }

  public function testHadError():void {
    var responseItem:ResponseItem = new ResponseItem({}, "errCode", "errMsg");
    Assert.assertTrue(responseItem.hadError());

    responseItem = new ResponseItem({});
    Assert.assertFalse(responseItem.hadError());
  }

  public function testError():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.ResponseItem.Error;}");
    for (var name:String in ResponseItem.Error) {
      Assert.assertEquals(real[name], ResponseItem.Error[name]);
    }
  }
}
}
