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

import org.opensocial.client.base.ProxiedResponse;

/**
 * Event used for asynchronous proxied requests. 
 * It is dispatched by the <code>ProxiedRequest</code> object and carries the 
 * <code>ProxiedResponse</code> response data object.
 * 
 * @see ProxiedRequest
 * @see org.opensocial.client.base.ProxiedResponse
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ProxiedRequestEvent extends AsyncRequestEvent {

  /**
   * For the event dispatched when the io request get returned.
   * @eventType complete
   */
  public static const COMPLETE:String = "complete";


  /**
   * For the event dispatched when the io request get error.
   * @eventType error
   */
  public static const ERROR:String = "error";


  /**
   * Constructor of the event.
   * @param proxiedResponse The <code>ProxiedResponse</code> instance from callback function.
   */
  public function ProxiedRequestEvent(proxiedResponse:ProxiedResponse) {
    var type:String = ProxiedRequestEvent.COMPLETE;
    if (proxiedResponse.hadError()) {
      type = ProxiedRequestEvent.ERROR;
    }
    super(type, proxiedResponse);
  }


  /**
   * Gets the <code>ProxiedResponse</code> object from remote server response.
   * @return The <code>ProxiedResponse</code> object.
   */
  public function get response():ProxiedResponse {
    return rawData_ as ProxiedResponse;
  }


  /**
   * Clones the event to a new one.
   * @return A new <code>ProxiedRequestEvent</code> object.
   */
  override public function clone():Event {
    return new ProxiedRequestEvent(rawData_);
  }
}
}
