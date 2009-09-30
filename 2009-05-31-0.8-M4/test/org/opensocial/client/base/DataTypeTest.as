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

import mx.utils.ObjectUtil;

/**
 * Tests for DataType.as
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class DataTypeTest extends TestCase {

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
            },
            "hasApp" : true,
            "age" : 20,
            "dateOfBirth" : new Date(2007, 11, 13),
            "gender" : {"key" : "MALE", "displayValue" : "Male"},
            "interests" : ["sports", "movie", "music"],
            "emails" : [
              {"fields" : {"type": "work", "address": "somename@somecompany.com"}},
              {"fields" : {"type": "home", "address": "somename@somemail.net"}}
            ]
        }
    };
  }

  private function getRandomObject():Object {
    return {
        "data1" : 123,
        "data2" : "abc"
    };
  }

  public function testConstructor():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    Assert.oneAssertionHasBeenMade();

    try {
      new DataTypeForTest(null);
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(2, Assert.assetionsMade);
  }

  public function testProtectedAccessors():void {
    var rawObject:Object = getRawObject();
    var dataType:DataTypeForTest = new DataTypeForTest(rawObject);
    Assert.assertEquals(rawObject, dataType.getRawObjForTest());
    Assert.assertEquals(rawObject["id"], dataType.getRawPropertyForTest("id"));
    Assert.assertTrue(dataType.hasFieldsForTest());
    Assert.assertEquals(rawObject["fields"], dataType.getFieldsForTest());
    var a:int = Assert.assetionsMade;
    try {
      dataType.getRawPropertyForTest("randomProperty");
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);

    rawObject = getRandomObject();
    dataType = new DataTypeForTest(rawObject);
    Assert.assertEquals(rawObject, dataType.getRawObjForTest());
    Assert.assertFalse(dataType.hasFieldsForTest());
    a = Assert.assetionsMade;
    try {
      dataType.getFieldsForTest();
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);
  }

  public function testGetField():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);

    Assert.assertEquals("http://someplace.com/thumbnail.jpg", dataType.getField("thumbnailUrl"));
    Assert.assertNull(dataType.getField("randomField"));

    var a:int = Assert.assetionsMade;
    try {
      dataType = new DataType(getRandomObject());
      dataType.getField("randomField");
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);
  }

  public function testGetFieldString():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    Assert.assertEquals("http://someplace.com/profile.html", dataType.getFieldString("profileUrl"));
    Assert.assertNull(dataType.getFieldString("randomField"));
  }

  public function testGetFieldNumber():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    Assert.assertEquals(20, dataType.getFieldNumber("age"));
    Assert.assertEquals(0, dataType.getFieldNumber("randomField"));
  }

  public function testGetFieldBoolean():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    Assert.assertEquals(true, dataType.getFieldBoolean("hasApp"));
    Assert.assertEquals(false, dataType.getFieldBoolean("randomField"));
  }

  public function testGetFieldDate():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    var actualDate:Date = dataType.getFieldDate("dateOfBirth");
    Assert.assertTrue(ObjectUtil.dateCompare(new Date(2007, 11, 13), actualDate) == 0);

    Assert.assertNull(dataType.getFieldDate("randomField"));
    Assert.assertNull(dataType.getFieldDate("profileUrl"));

  }

  public function testGetFieldData():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);
    var address:Address = dataType.getFieldData("currentLocation", Address) as Address;
    Assert.assertEquals("Beijing", address.getField("locality"));

    var gender:Enum = dataType.getFieldData("gender", Enum) as Enum;
    Assert.assertEquals("MALE", gender.getKey());

    Assert.assertNull(dataType.getFieldData("randomField", DataTypeForTest));

    var a:int = Assert.assetionsMade;
    try {
      dataType.getFieldData("randomField", TestCase);
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);

    // Warning
    var warningData:DataTypeForTest = dataType.getFieldData("profileUrl", DataTypeForTest)
        as DataTypeForTest;
    Assert.assertEquals(dataType.getField("profileUrl"), warningData.getRawObjForTest());
  }

  public function testGetFieldArray():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);

    var array:ArrayType = dataType.getFieldArray("interests");
    Assert.assertTrue(ObjectUtil.compare(["sports", "movie", "music"], array) == 0);

    Assert.assertTrue(ObjectUtil.compare([], dataType.getFieldArray("randomField")) == 0);
    Assert.assertTrue(ObjectUtil.compare([], dataType.getFieldArray("profileUrl")) == 0);
  }

  public function testGetFieldDataArray():void {
    var rawObject:Object = getRawObject();
    var dataType:DataType = new DataType(rawObject);

    var array:ArrayType = dataType.getFieldDataArray("emails", Email);
    var e0:Email = array[0] as Email;
    var e1:Email = array[1] as Email;

    Assert.assertEquals("work", e0.getField("type"));
    Assert.assertEquals("somename@somecompany.com", e0.getField("address"));
    Assert.assertEquals("home", e1.getField("type"));
    Assert.assertEquals("somename@somemail.net", e1.getField("address"));

    Assert.assertTrue(ObjectUtil.compare(
        [], dataType.getFieldDataArray("randomField", DataTypeForTest)) == 0);
    Assert.assertTrue(ObjectUtil.compare(
        [], dataType.getFieldDataArray("profileUrl", DataTypeForTest)) == 0);

    var a:int = Assert.assetionsMade;
    try {
      dataType.getFieldDataArray("randomField", Object);
      Assert.fail();
    } catch (e:OpenSocialError) {
      Assert.oneAssertionHasBeenMade();
    }
    Assert.assertEquals(a + 1, Assert.assetionsMade);

    // Warning
    var warningArray:ArrayType = dataType.getFieldDataArray("interests", DataTypeForTest);
    Assert.assertEquals("sports", (warningArray[0] as DataTypeForTest).getRawObjForTest());
    Assert.assertEquals("movie", (warningArray[1] as DataTypeForTest).getRawObjForTest());
    Assert.assertEquals("music", (warningArray[2] as DataTypeForTest).getRawObjForTest());
  }
}
}

class DataTypeForTest extends org.opensocial.client.base.DataType {
  public function DataTypeForTest(rawObj:Object) {
    super(rawObj);
  }

  public function getRawObjForTest():Object {
    return obj_;
  }

  public function getRawPropertyForTest(key:String):* {
    return getRawProperty(key);
  }

  public function hasFieldsForTest():Boolean {
    return hasFields();
  }

  public function getFieldsForTest():Object {
    return getFields();
  }
}


