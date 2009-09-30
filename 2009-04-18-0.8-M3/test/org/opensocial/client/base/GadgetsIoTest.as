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
public class GadgetsIoTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testNewGetRequestParams():void {
    var params:Object = GadgetsIo.newGetRequestParams();
    Assert.assertEquals("GET", params["METHOD"]);
    Assert.assertUndefined(params["CONTENT_TYPE"]);
    Assert.assertUndefined(params["AUTHORIZATION"]);
    Assert.assertUndefined(params["HEADERS"]);

    params = GadgetsIo.newGetRequestParams(GadgetsIo.ContentType.JSON,
                                           GadgetsIo.AuthorizationType.SIGNED);
    Assert.assertEquals("GET", params["METHOD"]);
    Assert.assertEquals("JSON", params["CONTENT_TYPE"]);
    Assert.assertEquals("SIGNED", params["AUTHORIZATION"]);
    Assert.assertUndefined(params["HEADERS"]);
  }

  public function testNewPostRequestParams():void {
    var params:Object = GadgetsIo.newPostRequestParams(null);
    Assert.assertEquals("POST", params["METHOD"]);
    Assert.assertNull(params["POST_DATA"]);
    Assert.assertUndefined(params["CONTENT_TYPE"]);
    Assert.assertUndefined(params["AUTHORIZATION"]);
    Assert.assertUndefined(params["HEADERS"]);

    var postData:Object = {"data1" : 123, "data2" : "abc"};
    params = GadgetsIo.newPostRequestParams(postData,
                                           GadgetsIo.ContentType.TEXT,
                                           GadgetsIo.AuthorizationType.OAUTH);
    Assert.assertEquals("POST", params["METHOD"]);
    Assert.assertEquals(123, params["POST_DATA"]["data1"]);
    Assert.assertEquals("abc", params["POST_DATA"]["data2"]);
    Assert.assertEquals("TEXT", params["CONTENT_TYPE"]);
    Assert.assertEquals("OAUTH", params["AUTHORIZATION"]);
    Assert.assertUndefined(params["HEADERS"]);
  }

  public function testRequestParameters():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return gadgets.io.RequestParameters;}");
    for (var name:String in GadgetsIo.RequestParameters) {
      Assert.assertEquals(real[name], GadgetsIo.RequestParameters[name]);
    }
  }

  public function testMethodType():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return gadgets.io.MethodType;}");
    for (var name:String in GadgetsIo.MethodType) {
      Assert.assertEquals(real[name], GadgetsIo.MethodType[name]);
    }
  }

  public function testContentType():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return gadgets.io.ContentType;}");
    for (var name:String in GadgetsIo.ContentType) {
      Assert.assertEquals(real[name], GadgetsIo.ContentType[name]);
    }
  }

  public function testAuthorizationType():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return gadgets.io.AuthorizationType;}");
    for (var name:String in GadgetsIo.AuthorizationType) {
      Assert.assertEquals(real[name], GadgetsIo.AuthorizationType[name]);
    }
  }
}
}
