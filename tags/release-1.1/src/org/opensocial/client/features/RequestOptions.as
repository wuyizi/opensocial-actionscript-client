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

package org.opensocial.client.features {

import org.opensocial.client.base.*;


/**
 * Abstract base options for all kinds of asynchronous requests. 
 * See the details in all sub-classes.
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RequestOptions {

  /**
   * The actual value.
   * @private
   */
  protected var options_:Object;

  /**
   * Constructor.
   * @param options The default option values.
   */
  public function RequestOptions(options:Object = null) {
    if (options != null) {
      options_ = options;
    } else {
      options_ = {};
    }
  }

  /**
   * Modifies an option value in this options object.
   * @param name The option name.
   * @param value The option value, null to delete.
   */
  protected function modify(name:String, value:*):void {
    if (value == null) {
      delete options_[name];
    } else {
      options_[name] = value;
    }
  }

  /**
   * Modifies one entry in the option if the option is a map.
   * @param name The option name.
   * @param detailName The detail name of the entry in the option map.
   * @param detailValue The new detail value, null to delete.
   */
  protected function modifyDetail(name:String, detailName:String, detailValue:*):void {
    if (options_[name] == null) {
      options_[name] = {};
    }
    if (detailValue == null) {
      delete options_[name][detailName];
    } else {
      options_[name][detailName] = detailValue;
    }
  }

  /**
   * Appends an array of items to an array option.
   * @param name The option name.
   * @param values The new items to be appened.
   *
   */
  protected function append(name:String, values:Array):void {
    if (options_[name] && !(options_[name] is Array)) {
      options_[name] = [options_[name]];
    } else if (!options_[name]) {
      options_[name] = [];
    }
    (options_[name] as Array).push(values);
  }

  /**
   * Return the actual value of the options.
   * @return The options map.
   */
  public function get value():Object {
    return options_;
  }

}
}
