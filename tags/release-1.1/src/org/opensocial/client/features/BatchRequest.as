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

import flash.events.EventDispatcher;
import flash.utils.Dictionary;

import org.opensocial.client.base.OpenSocialError;
import org.opensocial.client.base.ResponseItem;
import org.opensocial.client.core.OpenSocialClient;


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
 * Event dispatcher for OpenSocial batch request.
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
 * Here lists the example codes for requesting friends of viewer and itself's profile. 
 * (For more examples please see the <code>SampleApp</code>):
 * </p>
 * @example
 * <listing version="3.0">
 * private function batchRequest():void {
 *   var batch:BatchRequest = new BatchRequest();
 *   var req:AsyncDataRequest = new AsyncDataRequest(
 *       Feature.PEOPLE_GET,
 *       new PeopleRequestOptions()
 *           .setUserId("&#64;me")
 *           .setGroupId("&#64;self"));
 * 
 *   req.addEventListener(ResponseItemEvent.COMPLETE, batchFetchMeEventHandler);
 *   // You may like to add event listener for each AsyncDataRequest object.
 *   // If the event listener is added, it will be notified by the registered event, 
 *   // after the event being dispatched to the BatchRequest object first.
 *   batch.add(req, "meProfile");
 * 
 *   req = new AsyncDataRequest(
 *         Feature.PEOPLE_GET,
 *         new PeopleRequestOptions()
 *             .setUserId("&#64;me")
 *             .setGroupId("&#64;friends")
 *             .setCount(2)               // Request 2 friends each time.
 *             .setStartIndex(0));        // First time starts with 0.
 * 
 *   req.addEventListener(ResponseItemEvent.COMPLETE, batchFetchFriendsEventHandler); 
 *   batch.add(req, "friendList");
 * 
 *   batch.addEventListener(ResponseItemEvent.COMPLETE, batchDataRequestEventHandler);
 *   batch.addEventListener(ResponseItemEvent.ERROR, batchDataRequestErrorHandler);
 *   batch.send(client);                  // Send the batch request and start to listen.
 * }
 * 
 * private function batchDataRequestEventHandler(event:ResponseItemEvent):void {
 *   var p:Person = event.response.getData("meProfile");
 *   //do something with person...
 * 
 *   var c:Collection = event.response.getData("friendList");
 *   var arr:Array = c.getArray();
 *   for (var i:int = 0; i &lt; arr.length; i++) {
 *     var person:Person = arr[i];
 *     //do something with person...
 *   }
 * }
 * 
 * private function batchDataRequestErrorHandler(event:ResponseItemEvent):void {
 *   //do something with error...
 * }
 * 
 * private function batchFetchMeEventHandler(event:ResponseItemEvent):void {
 *   var p:Person = event.response.getData();
 *   //do something with person...
 * }
 * 
 * private function batchFetchFriendsEventHandler(event:ResponseItemEvent):void {
 *   var c:Collection = event.response.getData();;
 *   var arr:Array = c.getArray();
 *   for (var i:int = 0; i &lt; arr.length; i++) {
 *     var p:Person = arr[i];
 *     //do something with person...
 *   }
 *   // Continue to fetch the remaining friends
 *   if (c.getRemainingSize() &gt; 0) {
 *     var req:AsyncDataRequest = event.target as AsyncDataRequest;
 *     (req.getOptions() as PeopleRequestOptions).setStartIndex(c.getNextOffset());
 *     req.send(client);                  // Send this async request and start to listen.
 *   }
 * }
 * </listing>
 * 
 * @see org.opensocial.client.base.ResponseItem
 *
 * @author zakiyy.yan@gmail.com (Zhinan Yan)
 */
public class BatchRequest extends EventDispatcher {

  /**
   * The request collection.
   * @private
   */
  private var requests:Dictionary;

  /**
   * Indicates this request instance is running or not. 
   * And you can't re-establish the running request concurrently.
   * @private
   */
  protected var isRunning_:Boolean;

  /**
   * Indicates this request instance is running or not. 
   * And you can't re-establish the running request concurrently.
   * @return True if it's running.
   */  
  public function get isRunning():Boolean {
    return isRunning_;
  }

  /**
   * Constructor of this request event dispatcher.
   */
  public function BatchRequest() {
    requests = new Dictionary();
    isRunning_ = false;
  }
  
  /**
   * The function for add an AsyncDataRequest object to batch request.
   * @param asyncDataRequest The AsyncDataRequest object.
   * @param resKey The identity of the response data of this async request.
   */  
  public function add(asyncDataRequest:AsyncDataRequest, resKey:String):void {
    if (asyncDataRequest && resKey) {
      if (asyncDataRequest.featureName.indexOf("ui.request") > 0) {
        throw new OpenSocialError("The request can not added to batch.");
      } else if (requests[resKey]) {
        throw new OpenSocialError("The resKey has already been taken.");
      } else {
        requests[resKey] = asyncDataRequest;
      }      
    }
  }

  /**
   * The function for the async callback which is registered on the client callback manager.
   * It takes in the async response raw data to create a corresponding event then dispatches it.
   * This function will be override by derieved classes.
   * @param rawData The raw response object.
   * @private
   */
  protected function callback(rawData:*):void {
    var response:ResponseItem = new ResponseItem(rawData);
    var event:ResponseItemEvent = new ResponseItemEvent(response);
    isRunning_ = false;
    dispatchEvent(event);
    
    for (var resKey:String in requests) {
      var responseItem:ResponseItem = new ResponseItem(rawData[resKey]);
      var responseItemEvent:ResponseItemEvent = new ResponseItemEvent(responseItem);
      var dataRequest:AsyncDataRequest = requests[resKey];
      dataRequest.dispatchEvent(responseItemEvent);
    }
  }

  /**
   * The quick short-cut for adding a callback function when request succeed. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The request instance itself.
   */
  public function addCompleteHandler(callback:Function):BatchRequest {
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
  public function addErrorHandler(callback:Function):BatchRequest {
    addEventListener(ResponseItemEvent.ERROR,
                     function(event:ResponseItemEvent):void {
                       callback(event.response);
                     }, false, 0, true);
    return this;
  }

  /**
   * Sends out the request using client's batch call api. If this request instance is running, then
   * this method will do nothing.
   * <p>
   * The underlying client has no knowledge on the event-driven system.
   * </p>
   * <p>
   * Considering to be renamed to 'execute'.
   * </p>
   * @param client The client, could be JsWrapperClient or RestfulClient.
   */
  public function send(client:OpenSocialClient):void {
    if (isRunning_) {
      throw new OpenSocialError("The request instance already running.");
    }
    var args:Array = [requests, callback];
    client.callBatch.apply(client, args);
    isRunning_ = true;
  }

  /**
   * Get an AsyncDataRequest object for this batch request.
   * @param resKey The identity of the response data of this async request.
   */  
  public function getAsyncDataRequest(resKey:String):AsyncDataRequest {
    return requests[resKey] as AsyncDataRequest;
  }
}
}
