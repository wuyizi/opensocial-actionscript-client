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

import flash.events.Event;

/**
 * Event used for asynchronous rpc services.
 * It is dispatched by the <code>RPCService</code> object and carries the calling arguments and 
 * the function to callback.
 * 
 * @see RPCService
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RPCServiceEvent extends Event {

  /**
   * For the 'rpcService' event dispatched when the opensocial rpc service get called.
   */
  public static const RPC_SERVICE:String = "rpcService";


  /**
   * The array of parameters which are passed via the calling source.
   * @private
   */
  protected var params_:Array = null;


  /**
   * The function to send the return value back.
   * @private
   */
  protected var callback_:Function = null;


  /**
   * Constructor of the event.
   * @param params The array of parameters which are passed via the calling source.
   * @param callback The function to send the return value back.
   */
  public function RPCServiceEvent(params:Array, callback:Function) {
    super(RPCServiceEvent.RPC_SERVICE, false, true);
    params_ = new Array().concat(params);
    callback_ = callback;
  }


  /**
   * Gets the parameters array which are passed via the calling source.
   * @return The parameters array.
   */
  public function get params():Array {
    return params_;
  }


  /**
   * Gets the return callback function.
   * @return The return callback function.
   */
  public function get callback():Function {
    return callback_;
  }


  /**
   * Clones the event to a new one.
   * @return A new <code>RpcServiceEvent</code> object.
   */
  override public function clone():Event {
    return new RPCServiceEvent(params_, callback_);
  }
}
}
