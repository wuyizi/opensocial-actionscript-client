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
 * Extends from <code>Array</code> to handle wrapped objects array conversion.
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public dynamic class ArrayType extends Array {

  private static var logger:Logger = new Logger(ArrayType);

  protected var elementType_ : Class = null;
  
  /**
   * Convert an array of raw object to an array primitives or DataType instances.
   * <p>
   * NOTE: This constructor is internally used. Do not call this constructor directly outside
   * this package.
   * </p>
   * @param raw The object which is an array from Js-side.
   * @param type The type of each item in this array. Null for primitives and auto detect, otherwise
   *             the type should be subtype of <code>DataType</code>.
   * @private
   */
  public function ArrayType(rawObj:Object, type:Class = null) {
    
    var rawArray:Array = rawObj as Array;
    if (rawArray == null) {
      logger.warning("Raw object is null or non-array in type '" +
                     getQualifiedClassName(this) + "'.");
      return;
    }
    
    if (type == null && rawArray.length != 0) {
      type = AbstractDataType.getType(rawArray[0]);
    }

    
    if (type != null && !Utils.isAncestor(DataType, type)) {
      throw new OpenSocialError("Element type '" + getQualifiedClassName(type) +
                                "' mismatched when creating an array.");
    }

    for each (var item:Object in rawArray) {
      if (type != null) {
        this.push(new type(item));
      } else {
        this.push(item);
      }
    }
    
    this.elementType_ = type;
  }
  
  
  /**
   * Gets the type of the elements.
   * @return The elements' type.
   */
  public function get elementType():Class {
    return elementType_;
  }

  
  public function extend(another:ArrayType):ArrayType {
    if (another == null || another.length == 0) {
      return this;
    }
    
    if (this.length == 0) {
      this.push.apply(this, another);
      this.elementType_ = another.elementType_;
      return this;
    }
    
    if (this.elementType_ != another.elementType_) {
      // Collections with different element types cannot be merged.
      throw new OpenSocialError("Element type '" + getQualifiedClassName(another.elementType_) +
                                "' and '" + getQualifiedClassName(this.elementType_) + 
                                "' mismatched when concatting.");
    }
    this.push.apply(this, another);
    return this;
  }
  
  
  /**
   * Gets an array by the field key and join all items to a flat string. Use
   * comma as a delim by default.
   * @param delim The delim string.
   * @return A joined string.
   */
  public static function flatten(array:Array, delim:String = ", "):String {
    if (array == null) return "";
    else return array.join(delim);
  }
}

}