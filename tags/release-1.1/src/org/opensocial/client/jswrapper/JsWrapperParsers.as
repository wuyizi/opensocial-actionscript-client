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

package org.opensocial.client.jswrapper {

import org.opensocial.client.base.*;

/**
 * Collection of parser functions for <code>JsWrapperClient</code>.
 * @author yiziwu@google.com (Yizi Wu)
 */
public class JsWrapperParsers {

  public static function parseParams(params:Array):Array {
    if (params != null) {
      params = params.map(function(param:*):* {
        if (param is MutableDataType) {
          return (param as MutableDataType).toRawObject();
        } else {
          return param;
        }
      });
    }
    return params;
  }

  public static function parseError(error:OpenSocialError):ResponseItem {
    return new ResponseItem(null, error.code, error.message);
  }

  public static function parseWrappedData(obj:*):ResponseItem {
    if (obj is OpenSocialError) return parseError(obj);
    if (obj && obj["name"] == "OpenSocialError")
      return new ResponseItem(null, obj["code"], obj["message"]);
    return new ResponseItem(AbstractDataType.create(obj));
  }

  public static function parseRawData(obj:*):ResponseItem {
    if (obj is OpenSocialError) return parseError(obj);
    if (obj && obj["name"] == "OpenSocialError")
      return new ResponseItem(null, obj["code"], obj["message"]);      
    return new ResponseItem(obj);
  }

  public static function parseProxiedResponse(obj:*):ProxiedResponse {
    return new ProxiedResponse(obj);
  }

  public static function parseEmpty(obj:*):ResponseItem {
    if (obj is OpenSocialError) return parseError(obj);
    if (obj && obj["name"] == "OpenSocialError")
      return new ResponseItem(null, obj["code"], obj["message"]);
    return ResponseItem.SIMPLE_SUCCESS;
  }
}

}
