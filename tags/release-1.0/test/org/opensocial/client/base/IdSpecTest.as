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
 * Tests for GadgetsIo.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class IdSpecTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testNewInstance():void {
    var idSpec:IdSpec = IdSpec.newInstance("VIEWER");
    Assert.assertEquals(IdSpec.PersonId.VIEWER, idSpec.getFieldString(IdSpec.Field.USER_ID));
    Assert.assertNull(idSpec.getField(IdSpec.Field.GROUP_ID));
    Assert.assertNull(idSpec.getField(IdSpec.Field.NETWORK_DISTANCE));

    idSpec = IdSpec.newInstance("OWNER", "FRIENDS", 10);
    Assert.assertEquals(IdSpec.PersonId.OWNER, idSpec.getFieldString(IdSpec.Field.USER_ID));
    Assert.assertEquals(IdSpec.GroupId.FRIENDS, idSpec.getFieldString(IdSpec.Field.GROUP_ID));
    Assert.assertEquals(10, idSpec.getFieldNumber(IdSpec.Field.NETWORK_DISTANCE));

    idSpec = IdSpec.newInstance("randomUserId", "randomGroupId");
    Assert.assertNull(idSpec.getField(IdSpec.Field.USER_ID));
    Assert.assertNull(idSpec.getField(IdSpec.Field.GROUP_ID));
  }

  public function testField():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.IdSpec.Field;}");
    for (var name:String in IdSpec.Field) {
      Assert.assertEquals(real[name], IdSpec.Field[name]);
    }
  }

  public function testPersonId():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.IdSpec.PersonId;}");
    for (var name:String in IdSpec.PersonId) {
      Assert.assertEquals(real[name], IdSpec.PersonId[name]);
    }
  }

  public function testGroupId():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.IdSpec.GroupId;}");
    for (var name:String in IdSpec.GroupId) {
      Assert.assertEquals(real[name], IdSpec.GroupId[name]);
    }
  }

}
}
