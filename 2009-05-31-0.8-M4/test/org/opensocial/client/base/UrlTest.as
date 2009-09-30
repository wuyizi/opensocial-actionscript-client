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
 * Tests for Url.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class UrlTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  public function testToString():void {
    var rawObject:Object =
        {"fields": {"address" : "http://somelink", "linkText" : "Click Me", "type" : "Blog"}};
    var url:Url = new Url(rawObject);
    Assert.assertEquals("<a href=\"http://somelink\" target=_blank>Click Me</a>", url.toString());

    rawObject = {"fields": {"address" : "http://somelink", "type" : "Blog"}};
    url = new Url(rawObject);
    Assert.assertEquals("<a href=\"http://somelink\" target=_blank>Blog</a>", url.toString());

    rawObject = {"fields": {"address" : "http://somelink"}};
    url = new Url(rawObject);
    Assert.assertEquals("<a href=\"http://somelink\" target=_blank>URL</a>", url.toString());
  }

  public function testField():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Url.Field;}");
    for (var name:String in Url.Field) {
      Assert.assertEquals(real[name], Url.Field[name]);
    }
  }
}
}
