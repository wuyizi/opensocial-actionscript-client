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
import flash.utils.Proxy;
import flash.utils.flash_proxy;

import org.opensocial.client.util.Logger;

/**
 * Base type for all constants and enum objects defined in <code><j>opensocial</j></code> namespace
 * in JS-side. Each constant type can read the real javacript values runtime if available.
 * Otherwise each type can use its default value set respectively.
 * <p>
 * TODO: consider moving it ro util package.
 * </p>
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public dynamic class ConstType extends Proxy {

  private static var logger:Logger = new Logger(ConstType);

  private static var useDefault_:Boolean = false;

  /**
   * A global setting here to determine if the constant/enum types should use default set or
   * dynamically load from javascript.
   * @param useDefault True to use the default hard coded values.
   */
  public static function setUseDefault(useDefault:Boolean):void {
    useDefault_ = useDefault;
  }

  /**
  * Real value set.
   * @private
   */
  private var values_:Object = null;

  /**
   * Default value set
   * @private
   */
  private var defaultValues_:Object = null;

  /**
   * The javascript name of this type.
   * @private
   */
  private var typeName_:String = null;

  /**
   * Initializes a constant/enum type with it's javascript name and default value set.
   * @param typeName The javascript name of this type.
   * @param defaultValues The default value set of <code>Map.&lt;String, String&gt;</code>.
   */
  public function ConstType(typeName:String, defaultValues:Object) {
    typeName_ = typeName;
    defaultValues_ = defaultValues;
  }

  /**
   * Gets the working values set for the enums or constants. If the useDefault is false, it will
   * depend on the real javascript values via the external interface.
   * @return Map of key-value pairs.
   */
  private function getValues():Object {
    if (useDefault_ || !ExternalInterface.available) {
      return defaultValues_;
    } else {
      if (!values_) {
        values_ = ExternalInterface.call("function() {return " + typeName_ + ";}");
        if (!values_) {
          values_ = defaultValues_;
        }
      }
      return values_;
    }
  }

  /**
   * Proxy method, checks if this enum type has the specific enum item.
   * @param name The name of the enum item.
   * @return True if it exists.
   */
  override flash_proxy function hasProperty(name:*):Boolean {
    if (getValues()[name as String]) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Proxy method, returns the specific enum item.
   * @param name The name of the enum item.
   * @return The enum item.
   */
  override flash_proxy function getProperty(name:*):* {
    var value:Object = getValues()[name];
    if (value) {
      return value;
    } else {
      var e:OpenSocialError =
          new OpenSocialError("Undefined constant in " + typeName_ + ":" + name);
      logger.error(e);
      throw e;
    }
  }

  /**
   * Proxy method, checks if this enum type has the specific enum item and return if exists.
   * @param name The name of the enum item.
   * @return Return null if it doesn't exist.
   */
  public function valueOf(name:String):* {
    var value:Object = getValues()[name.toUpperCase()];
    if (value) {
      return value;
    } else {
      return null;
    }
  }

  /**
   * Internal buffer array for nextName, nextNameIndex and nextValue implementation.
   * @private
   */
  public var itemArray_:Array = null;

  /**
   * Proxy method, returns next index of those enumerable properties.
   * @param index Starts from 0.
   * @return The index of the next property.
   *
   */
  override flash_proxy function nextNameIndex(index:int):int {
    // initial call
    if (index == 0 || !itemArray_) {
      itemArray_ = new Array();
      var values:Object = getValues();
      for (var key:String in values) {
        itemArray_.push(key);
      }
    }
    if (index < itemArray_.length) {
      return index + 1;
    } else {
      return 0;
    }
  }

  /**
   * Proxy method, returns next name of those enumerable properties.
   * @param index Starts from 0.
   * @return The name of the next property.
   */
  override flash_proxy function nextName(index:int):String {
    if (!itemArray_) {
      flash_proxy::nextNameIndex(index);
    }
    return itemArray_[index - 1];
  }



  /**
   * Proxy method, returns next value of those enumerable properties.
   * @param index index Starts from 0.
   * @return The value of the next property.
   */
  override flash_proxy function nextValue(index:int):* {
    if (!itemArray_) {
      flash_proxy::nextNameIndex(index);
    }
    return getValues()[itemArray_[index - 1]];
  }

}
}
