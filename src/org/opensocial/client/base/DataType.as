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

import flash.utils.getQualifiedClassName;

import org.opensocial.client.util.Logger;
import org.opensocial.client.util.Utils;

/**
 * Base type wrapped for simple opensocial data structure with fields data. It's an abstract class 
 * logically.
 *
 * <p>
 * All these types will have a common property set: "fields" and some <code>getField</code>
 * related methods. Types like <code>Person</code>, <code>Activity</code>, <code>Url</code>,
 * <code>Email</code> are the extended from this type.
 * </p>
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class DataType extends AbstractDataType {

  private static var logger:Logger = new Logger(DataType);

  /**
   * Constructor.
   * <p>
   * NOTE: This constructor is internally used. Do not call this constructor directly outside
   * this package.
   * </p>
   * @param rawObj The wrapped object from Js-side passed by the <code>ExternalInterface</code>.
   * @private
   */
  public function DataType(rawObj:Object) {
    super(rawObj);
  }

  /**
   * For most of the wrapped object from opensocial, there will be a "fields" property.
   * This function check against this property to see if this <code>DataType</code> instance is
   * created by a wrapped object.
   * @return True if the wrapped object is valid.
   */
  protected final function hasFields():Boolean {
    return "fields" in getRawObj();
  }

  /**
   * Get the fields_ property from the opensocial raw object.
   * @return The fields_ property value.
   */
  protected final function getFields():Object {
    return getRawProperty("fields");
  }

  /**
   * Default accessor for all type to get the field value by the field name.
   * <p>
   * Throw an <code>OpenSocialError</code> if the field not exists.
   * </p>
   * @param key The field key, defined in each SomeType.Field class in this package.
   *            e.g. "NAME", "THUMBNAIL_URL", ...
   * @return The value store in the fields object. Can be a simple string, a
   *         <code>DataType</code> instance, or an array of these. Return null if it's not a
   *         valid wrapped object.
   */
  public function getField(key:String):Object {
    if (key in getFields()) {
      return getFields()[key];
    } else {
      logger.warning("Field '" + key + "' does not exist in raw object of type '" +
                     getQualifiedClassName(this) + "'");
      return null;
    }
  }

  /**
   * Gets a string value by the field key.
   * @param key The field name.
   * @return Only string.
   */
  public function getFieldString(key:String):String {
    return getField(key) as String;
  }

  /**
   * Gets a number value by the field key.
   * @param key The field name.
   * @return Only number.
   */
  public function getFieldNumber(key:String):Number {
    return getField(key) as Number;
  }

  /**
   * Gets a boolean value by the field key.
   * @param key The field name.
   * @return Only boolean.
   */
  public function getFieldBoolean(key:String):Boolean {
    return getField(key) as Boolean;
  }

  /**
   * Gets a date value by the field key.
   * @param key The field name.
   * @return Only date.
   */
  public function getFieldDate(key:String):Date {
    return getField(key) as Date;
  }

  /**
   * Gets a DataType object by the field key.
   * @param key The field name.
   * @param type A sub type of <code>DataType</code>.
   * @return A <code>DataType</code> instance.
   */
  public function getFieldData(key:String, type:Class):DataType {
    if (Utils.isAncestor(DataType, type)) {
      var field:Object = getField(key);
      if (field == null) {
        return null;
      }
      return new type(field);
    } else {
      var e:OpenSocialError =
          new OpenSocialError("Type '" + getQualifiedClassName(type) + "' mismatched.");
      logger.error(e);
      throw e;
    }
  }


  /**
   * Gets an array by the field key which the elements are primitive types.
   * @param key The field name.
   * @return An array of elements.
   */
  public function getFieldArray(key:String):ArrayType {
    return new ArrayType(getField(key));
  }

  /**
   * Gets an array by the field key.
   * @param key The field name.
   * @param type The element's type in the array. It should be a sub type of <code>DataType</code>.
   * @return An array of <code>DataType</code> element.
   */
  public function getFieldDataArray(key:String, type:Class):ArrayType {
    return new ArrayType(getField(key), type);
  }

}

}
