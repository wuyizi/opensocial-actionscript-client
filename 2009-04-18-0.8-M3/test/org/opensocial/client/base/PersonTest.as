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
 * Tests for Person.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class PersonTest extends TestCase {

  override public function setUp():void {
    ConstType.setUseDefault(true);
  }

  private function getRawObject():Object {
    return {
        "displayName" : "John Doe",
        "id" : "someId",
        "isViewer" : false,
        "isOwner" : true,
        "fields": {
            "thumbnailUrl" : "http://someplace.com/thumbnail.jpg",
            "profileUrl" : "http://someplace.com/profile.html",
            "currentLocation" : {
                "fields": {"country": "China", "locality": "Beijing"}
            }
        }
    };
  }

  public function testGetDisplayName():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals("John Doe", person.getDisplayName());
  }

  public function testGetId():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals("someId", person.getId());
  }

  public function testIsOwner():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals(true, person.isOwner());
  }

  public function testIsViewer():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals(false, person.isViewer());
  }

  public function testGetThumbnailUrl():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals("http://someplace.com/thumbnail.jpg", person.getThumbnailUrl());
  }

  public function testGetCurrentLocation():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    Assert.assertEquals("China  Beijing", person.getCurrentLocation());
  }

  public function testToString():void {
    var rawObject:Object = getRawObject();
    var person:Person = new Person(rawObject);
    assertEquals("John Doe", person.toString());
  }

  public function testField():void {
    // No test if javascript is not available.
    if (!ExternalInterface.available) return;
    var real:Object = ExternalInterface.call(
        "function() {return opensocial.Person.Field;}");
    for (var name:String in Person.Field) {
      Assert.assertEquals(real[name], Person.Field[name]);
    }
  }
}
}
