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
 * Event used for asynchronous rpc requests.
 * It is dispatched by the <code>RPCRequest</code> object and carries the return value object.
 * 
 * @see RPCRequest
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RPCRequestEvent extends AsyncRequestEvent {

  /**
   * For the  event dispatched when the rpc service callbacks.
   * @eventType rpcCallback
   */
  public static const RPC_CALLBACK:String = "rpcCallback";

  /**
   * Constructor of the event.
   * @param returnValue The result value returned from the rpc service on the target.
   */
  public function RPCRequestEvent(returnValue:*) {
    super(RPCRequestEvent.RPC_CALLBACK, returnValue);
  }

  /**
   * Gets the return value.
   * @return The return value.
   */
  public function get returnValue():* {
    return rawData_;
  }

  /**
   * Clones the event to a new one.
   * @return A new <code>RPCRequestEvent</code> object.
   */
  override public function clone():Event {
    return new RPCRequestEvent(returnValue);
  }
}
}
