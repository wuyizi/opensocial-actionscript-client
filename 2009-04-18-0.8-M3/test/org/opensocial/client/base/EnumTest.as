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
 * Tests for Enum.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class EnumTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testKeyValues():void {
    // Simulate the javascript wrapObject function.
    var rawObject:Object = {"key" : "someKey", "displayValue" : "someValue"};
    var enum:Enum = new Enum(rawObject);
    Assert.assertEquals("someKey", enum.getKey());
    Assert.assertEquals("someValue", enum.getDisplayValue());
    Assert.assertEquals("someValue", enum.toString());
  }

  public function testSmoker():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Enum.Smoker;}");
    for (var name:String in Enum.Smoker) {
      Assert.assertEquals(real[name], Enum.Smoker[name]);
    }
  }

  public function testDrinker():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Enum.Drinker;}");
    for (var name:String in Enum.Drinker) {
      Assert.assertEquals(real[name], Enum.Drinker[name]);
    }
  }

  public function testLookingFor():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Enum.LookingFor;}");
    for (var name:String in Enum.LookingFor) {
      Assert.assertEquals(real[name], Enum.LookingFor[name]);
    }
  }

  public function testPresence():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Enum.Presence;}");
    for (var name:String in Enum.Presence) {
      Assert.assertEquals(real[name], Enum.Presence[name]);
    }
  }

  public function testGender():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Enum.Gender;}");
    for (var name:String in Enum.Gender) {
      Assert.assertEquals(real[name], Enum.Gender[name]);
    }
  }
}
}
