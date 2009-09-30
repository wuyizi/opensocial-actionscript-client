
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

import org.opensocial.client.core.*;

/**
 * Dispatched when the registered rpc service get called. It carries the calling arguments and 
 * the function to callback.
 * @eventType org.opensocial.client.features.RPCServiceEvent.RPC_SERVICE
 */
[Event(name="rpcService", type="org.opensocial.client.features.RPCServiceEvent.RPC_SERVICE")]


/**
 * Event dispatcher for asynchronous RPC service.
 * <p>
 * This service covers <code><j>gadgets.rpc.register</j></code> and 
 * <code><j>gadgets.rpc.unregister</j></code> feature. 
 * </p>
 * 
 *  * <p>
 * Here lists the example codes for registering rpc service:
 * </p>
 * 
 * @example
 * <listing version="3.0">
 * private function registerService():void {
 *   // To use this, you need to make a rpc call to from a remote target, can be container or 
 *   // another gadget.
 *   var srv:RPCService = new RPCService("my-service");
 *   srv.register(client);
 *   srv.addEventListener(RPCServiceEvent.RPC_SERVICE, serviceEventHandler);
 * }
 * private function serviceEventHandler(event:RPCServiceEvent):void {
 *   logger.log(event.params);
 *   event.callback("my-service returned.");
 * }
 * </listing>
 * 
 * @see RPCServiceEvent
 *
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.rpc.register
 *      gadgets.rpc.register
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.rpc.unregister
 *      gadgets.rpc.unregister
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RPCService extends EventDispatcher {

  /**
   * The registered service name.
   * @private
   */
  private var serviceName_:String;

  /**
   * Indicates that this service is ready to serve.
   * @private
   */
  private var isListening_:Boolean;

  /**
   * Constructor of this request event dispatcher.
   * @param serviceName The service name to be registered.
   */
  public function RPCService(serviceName:String) {
    serviceName_ = serviceName;
  }

  /**
   * Gets the registered service name.
   * @return The service name;
   *
   */
  public function get serviceName():String {
    return serviceName_;
  }

  /**
   * Indicates that this service is ready to serve.
   * @return True if it has handler and ready to serve.
   */
  public function get isListening():Boolean {
    return isListening_;
  }

  /**
   * Registers this service to the client.
   * @param client The client.
   * @return The service instance itself.
   *
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.rpc.register
   *      gadgets.rpc.register
   */
  public function register(client:OpenSocialClient):RPCService {
    var serviceHandler:Function = function (callID:String, ...params:Array):void {
      var callback:Function = function(result:*):void {
        client.callSync(Feature.RPC_SERVICE_RETURN, callID, result);
      };
      var event:RPCServiceEvent = new RPCServiceEvent(params, callback);
      dispatchEvent(event);
    };
    client.registerCallback(serviceName_, serviceHandler);
    client.callSync(Feature.RPC_SERVICE_REGISTER, serviceName_, serviceName_);
    isListening_ = true;
    return this;
  }

  /**
   * Unregisters this service from the client.
   * @param client
   * @return The service instance itself.
   *
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.rpc.unregister
   *      gadgets.rpc.unregister
   */
  public function unregister(client:OpenSocialClient):RPCService {
    client.callSync(Feature.RPC_SERVICE_UNREGISTER, serviceName_);
    client.unregisterCallback(serviceName_);
    isListening_ = false;
    return this;
  }

  /**
   * The quick short-cut for adding a callback function for the service. It wraps the async
   * request from event-driven style to a simple callback style.
   * @param callback The callback function
   * @return The service instance itself.
   */
  public function addServiceHandler(callback:Function):RPCService {
    addEventListener(RPCServiceEvent.RPC_SERVICE,
                     function(event:RPCServiceEvent):void {
                       var returnValue:* = callback(event.params);
                       event.callback(returnValue);
                     }, false, 0, true);
    return this;
  }
}
}
