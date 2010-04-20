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
 * Tests for NavigationParameters.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class NavigationParametersTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testNewInstance():void {
    var params:Object = {"data1" : 123, "data2" : "abc"};

    var navParams:NavigationParameters = NavigationParameters.newInstance(
        "CANVAS", "someId", params);
    Assert.assertEquals(
        GadgetsViews.ViewType.CANVAS, navParams.getFieldString(NavigationParameters.Field.VIEW));
    Assert.assertEquals("someId", navParams.getFieldString(NavigationParameters.Field.OWNER));
    Assert.assertEquals(123, navParams.getField(NavigationParameters.Field.PARAMETERS)["data1"]);
    Assert.assertEquals("abc", navParams.getField(NavigationParameters.Field.PARAMETERS)["data2"]);
  }

  public function testField():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.NavigationParameters.Field;}");
    for (var name:String in NavigationParameters.Field) {
      Assert.assertEquals(real[name], NavigationParameters.Field[name]);
    }
  }

  public function testDestinationType():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.NavigationParameters.DestinationType;}");
    for (var name:String in NavigationParameters.DestinationType) {
      Assert.assertEquals(real[name], NavigationParameters.DestinationType[name]);
    }
  }
}
}
