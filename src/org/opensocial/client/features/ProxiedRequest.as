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
import org.opensocial.client.core.*;

/**
 * Dispatched when the proxied request complete and with a <code>ProxiedResponse</code> object
 * returned.
 * @eventType org.opensocial.client.features.ProxiedRequestEvent.COMPLETE
 */
[Event(name="complete", type="org.opensocial.client.features.ProxiedRequestEvent.COMPLETE")]

/**
 * Dispatched when the request got error.
 * @eventType org.opensocial.client.features.ProxiedRequestEvent.ERROR
 */
[Event(name="error", type="org.opensocial.client.features.ProxiedRequestEvent.ERROR")]


/**
 * Event dispatcher for asynchronous proxied requests.
 * <p>
 * This request covers <code><j>osapi.makeRequest</j></code> or the well-known
 * <code><j>gadgets.io.makeRequest</j></code> feature and is initialized by 
 * <code>ProxiedRequestOptions</code>.
 * </p>
 * <p>
 * Here lists the example codes for requesting remote data :
 * </p>
 * 
 * @example
 * <listing version="3.0">
 * private function makeRequest():void {
 *   var params:Object = GadgetsIo.newGetRequestParams(GadgetsIo.ContentType.TEXT);
 *   var req:ProxiedRequest = new ProxiedRequest(
 *       "http://www.google.com/crossdomain.xml",
 *       new ProxiedRequestOptions()
 *           .setContentType(GadgetsIo.ContentType.TEXT));
 *   req.addEventListener(ProxiedRequestEvent.COMPLETE, makeRequestEventHandler);
 *   req.addEventListener(ProxiedRequestEvent.ERROR, makeRequestEventErrorHandler);
 *   req.send(client);
 * }
 * private function makeRequestEventHandler(event:ProxiedRequestEvent):void {
 *   logger.info(event.response.getData());
 * }
 * private function makeRequestEventErrorHandler(event:ProxiedRequestEvent):void {
 *   logger.info("make request failed: " + 
 *               event.response.getRC() + " - " + 
 *               event.response.getText());
 * }
 * </listing>
 *
 * @see ProxiedRequestEvent
 * @see ProxiedRequestOptions
 * @see org.opensocial.client.base.ProxiedResponse
 * 
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.io.makeRequest
 *      gadgets.io.makeRequest
 * @see http://wiki.opensocial.org/index.php?title=Introduction_to_makeRequest
 *      Introduction to MakeRequest
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ProxiedRequest extends AsyncRequest {

  /**
   * The options instance.
   * @private
   */
  private var options_ : ProxiedRequestOptions;


  /**
   * Constructor of this request event dispatcher.
   * @param url The target remote site for the request.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function ProxiedRequest(url:String, options:ProxiedRequestOptions) {
    super(Feature.MAKE_REQUEST);
    if (options == null) {
      throw new OpenSocialError("The request options should not be null.");
    }
    options_ = options;
    this.setParams(url, options.value);
  }


  /**
   * The function for the async callback which is registered on the client callback manager.
   * It takes in the async response raw data to create a corresponding event then dispatches it.
   * This function will be override by derieved classes.
   * @param rawData The responseItem object from parser.
   */
  override protected function callback(rawData:*):void {
    var event:ProxiedRequestEvent = new ProxiedRequestEvent(rawData);
    isRunning_ = false;
    dispatchEvent(event);
  }


  /**
   * The quick short-cut for adding a callback function when request succeed. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The request instance itself.
   */
  public function addCompleteHandler(callback:Function):ProxiedRequest {
    addEventListener(ProxiedRequestEvent.COMPLETE,
                     function(event:ProxiedRequestEvent):void {
                       callback(event.response);
                     }, false, 0, true);
    return this;
  }


  /**
   * The quick short-cut for adding a callback function when request failed. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The request instance itself.
   */
  public function addErrorHandler(callback:Function):ProxiedRequest {
    addEventListener(ProxiedRequestEvent.ERROR,
                     function(event:ProxiedRequestEvent):void {
                       callback(event.response);
                     }, false, 0, true);
    return this;
  }


  /**
   * Gets the request options object.
   * @return The request options object.
   */
  public function getOptions():ProxiedRequestOptions {
    return options_;
  }

}
}
