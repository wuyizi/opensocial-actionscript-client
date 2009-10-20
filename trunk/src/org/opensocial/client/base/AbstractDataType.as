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
 * Base type wrapped for all opensocial data structure. It's an abstract class logically.
 *
 * <p> This type holds a raw object reference. </p>
 * <p>
 * All those types with a common property set: "fields" and some complex types like 
 * <code>Collection</code>, or non-information related class like <code>ResponseItem</code> 
 * are extended from this type.
 * </p>
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class AbstractDataType extends BaseType {
private static var logger:Logger = new Logger(AbstractDataType);

  /**
   * The wrapped object from Js-side passed by the <code>ExternalInterface</code>.
   * @private
   */
  protected var obj_:Object;

  /**
   * Constructor.
   * <p>
   * NOTE: This constructor is internally used. Do not call this constructor directly outside
   * this package.
   * </p>
   * @param rawObj The wrapped object from Js-side passed by the <code>ExternalInterface</code>.
   * @private
   */
  public function AbstractDataType(rawObj:Object) {
    if (rawObj == null) {
      var e:OpenSocialError =
          new OpenSocialError("Null raw object in type '" + getQualifiedClassName(this) + "'.");
      logger.error(e);
      throw e;
    }
    this.obj_ = rawObj;
  }

  /**
   * Accessor to the original wrapped object.
   */
  protected final function getRawObj():Object {
    return obj_;
  }

  /**
   * Get the property in the wrapped object.
   * <p>
   * Throw an <code>OpenSocialError</code> if the property not exists.
   * </p>
   * @param key The key.
   * @return The value.
   *
   */
  protected final function getRawProperty(key:String):* {
    if (key in getRawObj()) {
      return getRawObj()[key];
    } else {
      var e:OpenSocialError =
          new OpenSocialError("Property '" + key + "' does not exist in raw object of type '" +
                              getQualifiedClassName(this) + "'");
      logger.error(e);
      throw e;
    }
  }
  

  public static function getType(rawObj:Object):Class {
    try {
      return Utils.getClass(rawObj["type"] as String);
    } catch(err:Error) {
      var e:OpenSocialError =
          new OpenSocialError("Cannot get type from raw object. \n Error:" + e.message);
      logger.error(e);
      throw e;
    }
    return null;
  }
  
  
  public static function create(rawObj:Object):* {
    var type:Class = getType(rawObj);
    if (type == null) {
      return rawObj;
    } else if (Utils.isAncestor(AbstractDataType, type)) {
      return new type(rawObj);
    } else {
      throw new OpenSocialError("Raw object type '" + getQualifiedClassName(type) +
                                "' mismatched for data creation.");
    }
  }
  

  /**
   * Converts the <code>RawDataType</code> object to a string. This method should be overridden.
   * @return The string representing this object.
   */
  public function toString():String {
    return obj_ == null ? null : obj_.toString();
  }
}
}
