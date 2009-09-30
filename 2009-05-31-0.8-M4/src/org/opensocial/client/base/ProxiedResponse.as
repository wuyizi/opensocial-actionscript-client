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


/**
 * Wrapper for the response object from <code><j>gadgets.io.makeRequest</j></code> container proxy.
 *
 * @see http://wiki.opensocial.org/index.php?title=Introduction_to_makeRequest
 *      Introduction to MakeRequest
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ProxiedResponse extends BaseType {

  /**
   * Holds the raw response object.
   * @private
   */
  private var obj_:Object = null;

  /**
   * Constructor to create a proxy response.
   * @param obj The response object returned from proxy.
   */
  public function ProxiedResponse(obj:* = null) {
    obj_ = obj;
    if (!obj_['errors']) {
      obj_['errors'] = [];
    }
  }

  /**
   * Gets the errors
   * @return The error messages.
   */
  public function getErrors():Array {
    return obj_['errors'] as Array;
  }

  /**
   * Checks if the response object from remote target site had error.
   * @return Ture if it had error.
   */
  public function hadError():Boolean {
    return getRC() != 200 || getErrors().length > 0;
  }

  /**
   * Gets the response data from remote target site.
   * @return The response data, can be text string or object. It depends on the makeRequest
   * parameter <code>GadgetsIo.ContentType</code>.
   */
  public function getData():* {
    return obj_['data'];
  }

  /**
   * Gets the orginal text of the response from remote target site.
   * @return The raw response string.
   */
  public function getText():String {
    return obj_['text'] as String;
  }

  /**
   * Gets the response headers object from remote target site.
   * @return The object containing the headers information.
   */
  public function getHeaders():Object {
    return obj_['headers'] as Object;
  }

  /**
   * Gets the response code from remote target site.
   * @return The integer for the response code.
   */
  public function getRC():int {
    return obj_['rc'] as int;
  }

  /**
   * Gets the oauth approval url. It is used with <code>AUTHORIZATION</code> parameter set to
   * <code>GadgetsIo.AuthorizationType.OAUTH</code>.
   * @return The url string.
   */
  public function getOauthApprovalUrl():String {
    return obj_['oauthApprovalUrl'] as String;
  }

  /**
   * Gets the oauth error if any. It is used with <code>AUTHORIZATION</code> parameter set to
   * <code>GadgetsIo.AuthorizationType.OAUTH</code>.
   * @return The error.
   */
  public function getOauthError():String {
    return obj_['oauthError'] as String;
  }

  /**
   * Gets the oauth error text if any. It is used with <code>AUTHORIZATION</code> parameter set to
   * <code>GadgetsIo.AuthorizationType.OAUTH</code>.
   * @return The readable error text string.
   */
  public function getOauthErrorText():String {
    return obj_['oauthErrorText'] as String;
  }
}
}
