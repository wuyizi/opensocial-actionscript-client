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
 * Tests for Globals.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class GlobalsTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testCreateActivityPriority():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.CreateActivityPriority;}");
    for (var name:String in Globals.CreateActivityPriority) {
      Assert.assertEquals(real[name], Globals.CreateActivityPriority[name]);
    }
  }

  public function testEscapeType():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.EscapeType;}");
    for (var name:String in Globals.EscapeType) {
      Assert.assertEquals(real[name], Globals.EscapeType[name]);
    }
  }

  public function testPermission():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Permission;}");
    for (var name:String in Globals.Permission) {
      Assert.assertEquals(real[name], Globals.Permission[name]);
    }
  }
}
}
