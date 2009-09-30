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

import org.opensocial.client.core.*;

/**
 * Dispatched when the rpc call is returned with a return value.
 * @eventType org.opensocial.client.features.RPCRequesteEvent.RPC_CALLBACK
 */
[Event(name="rpcCallback", type="org.opensocial.client.features.RPCRequesteEvent.RPC_CALLBACK")]


/**
 * Event dispatcher for asynchronous RPC requests.
 * <p>
 * This request covers <code><j>gadgets.rpc.call</j></code> feature.
 * </p>
 * 
 * <p>
 * Here lists the example codes for calling rpc:
 * </p>
 * @example
 * <listing version="3.0">
 * private function callRpc():void {
 *   // To use this, you need to first register the rpc service with name "srv-parent" on 
 *   // a remote target, can be container or another gadget.
 *   var req:RPCRequest = new RPCRequest(null, "your-service", "my-arg1", "my-arg2");
 *   req.addEventListener(RPCRequestEvent.RPC_CALLBACK, callRpcEventHandler);
 *   req.send(client);
 * }
 * private function callRpcEventHandler(event:RPCRequestEvent):void {
 *   logger.log(event.returnValue);
 * }
 * </listing>
 * 
 * @see RPCRequesteEvent
 * 
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.rpc.call
 *      gadgets.rpc.call
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RPCRequest extends AsyncRequest {

  /**
   * Constructor of this request event dispatcher.
   * <code>Feature.RPC_CALL</code> is the only available feature for this request type.
   *
   * @param targetId The target app's iframe id, null for the parent.
   * @param serviceName The service name to be called.
   * @param args Other arguments for the service call.
   */
  public function RPCRequest(targetId:String, serviceName:String, ...args:Array) {
    super(Feature.RPC_CALL);
    setParams(targetId, serviceName, args);
  }

  /**
   * The function for the async callback which is registered on the client callback manager.
   * It takes in the async response raw data to create a corresponding event then dispatches it.
   * This function will be override by derieved classes.
   * @param returnValue The return value object.
   */
  override protected function callback(returnValue:*):void {
    var event:RPCRequestEvent = new RPCRequestEvent(returnValue);
    isRunning_ = false;
    dispatchEvent(event);
  }

  /**
   * The quick short-cut for adding a callback function when request succeed. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The request instance itself.
   */
  public function addCallbackHandler(callback:Function):AsyncRequest {
    addEventListener(RPCRequestEvent.RPC_CALLBACK,
                     function(event:RPCRequestEvent):void {
                       callback(event.returnValue);
                     }, false, 0, true);
    return this;
  }
}
}
