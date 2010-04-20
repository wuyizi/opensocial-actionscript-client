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
import flash.utils.flash_proxy;

import flexunit.framework.Assert;
import flexunit.framework.TestCase;

/**
 * Tests for ConstType.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ConstTypeTest extends TestCase {

  override public function setUp():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    ExternalInterface.call(
        "function() {osTestUtil.constTypesForTest = {" +
        " 'KEY_COMMON'  :'value_common'," +
        " 'KEY_VARIOUS' :'value_js'," +
        " 'KEY_JS_ONLY' :'value_js_only', " +
        " 'KEY_JS_ONLY_EX' :'value_js_only_ex'" +
        "};}");
  }

  private function getConstants():ConstType {
    return new ConstType("osTestUtil.constTypesForTest", {
        KEY_COMMON :  'value_common',
        KEY_VARIOUS : 'value_as',
        KEY_AS_ONLY : 'value_as_only'
    });
  }

  public function testHasProperty():void {
    ConstType.setUseDefault(true);
    var constType:ConstType = getConstants();
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_COMMON"));
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_VARIOUS"));
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_AS_ONLY"));
    Assert.assertFalse(constType.flash_proxy::hasProperty("KEY_JS_ONLY"));
    Assert.assertFalse(constType.flash_proxy::hasProperty("KEY_JS_ONLY_EX"));

    ConstType.setUseDefault(false);
    constType = getConstants();
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_COMMON"));
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_VARIOUS"));
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_JS_ONLY"));
    Assert.assertTrue(constType.flash_proxy::hasProperty("KEY_JS_ONLY_EX"));
    Assert.assertFalse(constType.flash_proxy::hasProperty("KEY_AS_ONLY"));

  }

  public function testGetProperty():void {
    ConstType.setUseDefault(true);
    var constType:ConstType = getConstants();
    Assert.assertEquals('value_common', constType.KEY_COMMON);
    Assert.assertEquals('value_as', constType.KEY_VARIOUS);
    Assert.assertEquals('value_as_only', constType.KEY_AS_ONLY);
    var a:int = Assert.assetionsMade;
    try {
      constType.KEY_JS_ONLY;
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    try {
      constType.KEY_JS_ONLY_EX;
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 2, Assert.assetionsMade);

    ConstType.setUseDefault(false);
    constType = getConstants();
    Assert.assertEquals('value_common', constType.KEY_COMMON);
    Assert.assertEquals('value_js', constType.KEY_VARIOUS);
    Assert.assertEquals('value_js_only', constType.KEY_JS_ONLY);
    Assert.assertEquals('value_js_only_ex', constType.KEY_JS_ONLY_EX);
    a = Assert.assetionsMade;
    try {
      constType.KEY_AS_ONLY;
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);
  }

  public function testValueOf():void {
    ConstType.setUseDefault(true);
    var constType:ConstType = getConstants();
    Assert.assertEquals("value_common", constType.valueOf("key_common"));
    Assert.assertEquals("value_as", constType.valueOf("key_various"));
    Assert.assertEquals("value_as_only", constType.valueOf("key_as_only"));
    Assert.assertNull(constType.valueOf("key_js_only"));
    Assert.assertNull(constType.valueOf("key_js_only_ex"));

    ConstType.setUseDefault(false);
    constType = getConstants();
    Assert.assertEquals("value_common", constType.valueOf("key_common"));
    Assert.assertEquals("value_js", constType.valueOf("key_various"));
    Assert.assertEquals("value_js_only", constType.valueOf("key_js_only"));
    Assert.assertEquals("value_js_only_ex", constType.valueOf("key_js_only_ex"));
    Assert.assertNull(constType.valueOf("key_as_only"));

    Assert.assertNull(constType.valueOf("random_key"));
  }

  public function testNextNameIndex():void {
    var constType:ConstType = getConstants();
    ConstType.setUseDefault(true);
    Assert.assertEquals(1, constType.flash_proxy::nextNameIndex(0));
    Assert.assertEquals(0, constType.flash_proxy::nextNameIndex(3));

    constType = getConstants();
    ConstType.setUseDefault(false);
    Assert.assertEquals(1, constType.flash_proxy::nextNameIndex(0));
    Assert.assertEquals(0, constType.flash_proxy::nextNameIndex(4));
  }

  public function testNextName():void {
    var constType:ConstType = getConstants();
    ConstType.setUseDefault(true);
    var actualSet:Object = {};
    var expectedSet:Array = ["KEY_COMMON", "KEY_VARIOUS", "KEY_AS_ONLY"];
    var len:int = 0;
    var name:String;
    for (name in constType) {
      Assert.assertUndefined(actualSet[name]);
      Assert.assertTrue(expectedSet.indexOf(name) != -1);
      actualSet[name] = name;
      len++;
    }
    Assert.assertEquals(expectedSet.length, len);

    constType = getConstants();
    ConstType.setUseDefault(false);
    actualSet = {};
    expectedSet = ["KEY_COMMON", "KEY_VARIOUS", "KEY_JS_ONLY", "KEY_JS_ONLY_EX"];
    len = 0;
    for (name in constType) {
      Assert.assertUndefined(actualSet[name]);
      Assert.assertTrue(expectedSet.indexOf(name) != -1);
      actualSet[name] = name;
      len++;
    }
    Assert.assertEquals(expectedSet.length, len);
  }

  public function testNextValue():void {
    var constType:ConstType = getConstants();
    ConstType.setUseDefault(true);
    var actualSet:Object = {};
    var expectedSet:Array = ["value_common", "value_as", "value_as_only"];
    var len:int = 0;
    var value:*;
    for each (value in constType) {
      Assert.assertUndefined(actualSet[value]);
      Assert.assertTrue(expectedSet.indexOf(value) != -1);
      actualSet[value] = value;
      len++;
    }
    Assert.assertEquals(expectedSet.length, len);

    constType = getConstants();
    ConstType.setUseDefault(false);
    actualSet = {};
    expectedSet = ["value_common", "value_js", "value_js_only", "value_js_only_ex"];
    len = 0;
    for each (value in constType) {
      Assert.assertUndefined(actualSet[value]);
      Assert.assertTrue(expectedSet.indexOf(value) != -1);
      actualSet[value] = value;
      len++;
    }
    Assert.assertEquals(expectedSet.length, len);
  }
}
}
