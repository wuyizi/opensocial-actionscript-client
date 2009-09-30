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
 * Dispatched when the data request complete and with a <code>ResponseItem</code> object returned.
 * @eventType org.opensocial.client.features.ResponseItemEvent.COMPLETE
 */
[Event(name="complete", type="org.opensocial.client.features.ResponseItemEvent.COMPLETE")]

/**
 * Dispatched when the request got error.
 * @eventType org.opensocial.client.features.ResponseItemEvent.ERROR
 */
[Event(name="error", type="org.opensocial.client.features.ResponseItemEvent.ERROR")]


/**
 * Event dispatcher for all kinds of asynchronous OpenSocial related data requests.
 * <p>
 * This request covers <code><j>osapi.people</j></code>, <code><j>osapi.actvities</j></code>,
 * <code><j>osapi.appdata</j></code> and <code><j>osapi.ui</j></code> services and is initialized
 * by different <code>RequestOptions</code>. Here is the list:
 * </p>
 * <p>
 * <table class=innertable>
 * <tr><th>osapi service</th><th>RequestOptions</th></tr>
 * <tr><td><code><j>osapi.people</j></code></td><td><code>PeopleRequestOptions</code></td></tr>
 * <tr><td><code><j>osapi.actvities</j></code></td><td><code>ActivitiesRequestOptions</code></td></tr>
 * <tr><td><code><j>osapi.appdata</j></code></td><td><code>AppDataRequestOptions</code></td></tr>
 * <tr><td><code><j>osapi.ui</j></code></td><td><code>UIRequestOptions</code></td></tr>
 * </table>
 * </p>
 * <p>
 * Here lists the example codes for requesting friends of viewer (For more examples please see the 
 * <code>SampleApp</code>):
 * </p>
 * @example
 * <listing version="3.0">
 * private function fetchFriends():void {
 *   var req:AsyncDataRequest = new AsyncDataRequest(
 *       Feature.PEOPLE_GET,
 *       new PeopleRequestOptions()
 *           .setUserId("&#64;me")
 *           .setGroupId("&#64;friends")
 *           .setCount(5)              // Request 5 friends each time.
 *           .setStartIndex(0));       // First time starts with 0.
 *   req.addEventListener(ResponseItemEvent.COMPLETE, fetchFriendsEventHandler);
 *   req.send(client);                 // Send the async request and start to listen.
 * }
 * private function fetchFriendsEventHandler(event:ResponseItemEvent):void {
 *   var collection:Collection = event.response.getData();
 *   var people:Array = collection.getArray();
 *   for (var i:int = 0; i &lt; people.length; i++) {
 *     var person:Person = people[i];
 *     //do something with person...
 *   }
 *   // Continue to fetch the remaining friends
 *   if (collection.getRemainingSize() &gt; 0) {
 *     var req:AsyncDataRequest = event.target as AsyncDataRequest;
 *     (req.getOptions() as PeopleRequestOptions).setStartIndex(collection.getNextOffset());
 *     req.send(client);              // Send the async request and start to listen again.
 *   }
 * }
 * </listing>
 * 
 * @see org.opensocial.client.base.ResponseItem
 *
 * @author chaowang@google.com (Jacky Wang)
 * @author yiziwu@google.com (Yizi Wu)
 */
public class AsyncDataRequest extends AsyncRequest {

  /**
   * The options instance.
   * @private
   */
  private var options_ : RequestOptions;

  /**
   * Constructor of this request event dispatcher.
   * @param featureName The feature to be executed.
   * @param options The initial options object for this request.
   */
  public function AsyncDataRequest(featureName:String, options:RequestOptions) {
    super(featureName);
    if (options == null) {
      throw new OpenSocialError("The request options should not be null.");
    }
    options_ = options;
    this.setParams(options.value);
  }

  /**
   * The function for the async callback which is registered on the client callback manager.
   * It takes in the async response raw data to create a corresponding event then dispatches it.
   * This function will be override by derieved classes.
   * @param rawData The responseItem object from parser.
   */
  override protected function callback(rawData:*):void {
    var event:ResponseItemEvent = new ResponseItemEvent(rawData);
    isRunning_ = false;
    dispatchEvent(event);
  }

  /**
   * The quick short-cut for adding a callback function when request succeed. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The request instance itself.
   */
  public function addCompleteHandler(callback:Function):AsyncDataRequest {
    addEventListener(ResponseItemEvent.COMPLETE,
                     function(event:ResponseItemEvent):void {
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
  public function addErrorHandler(callback:Function):AsyncDataRequest {
    addEventListener(ResponseItemEvent.ERROR,
                     function(event:ResponseItemEvent):void {
                       callback(event.response);
                     }, false, 0, true);
    return this;
  }

  /**
   * Gets the request options object.
   * @return The request options object.
   */
  public function getOptions():RequestOptions {
    return options_;
  }
}
}
