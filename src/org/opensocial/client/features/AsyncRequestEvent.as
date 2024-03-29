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
 * Abstract base event used for asynchronous remote data requests.
 * It carries the underlying raw data object. See the details in all sub-classes.
 *
 * @author chaowang@google.com (Jacky Wang)
 * @author yiziwu@google.com (Yizi Wu)
 */
public class AsyncRequestEvent extends Event {

  /**
   * The data object attached to this event.
   * @private
   */
  protected var rawData_:*;

  /**
   * Constructor of the event.
   * @param type The event type.
   * @param data The data value attached to this event, could be null.
   */
  public function AsyncRequestEvent(type:String, rawData:* = null) {
    // The event won't be triggered by display object, thus not relates to the
    // bubble flow.  Moreover, it doesn't have default behaivor, thus no need
    // to be cancelable.
    super(type, false, false);
    rawData_ = rawData;
  }

  /**
   * Gets the raw data property of this event.
   * Note that the derived events could apply their own getters to interpret
   * the data value, e.g. by calling the constructor of <code>ResponseItem</code>.
   * @return The raw data object.
   */
  final public function get rawData():* {
    return rawData_;
  }

  /**
   * Clones the event to a new one.
   * @return A new <code>AsyncRequestEvent</code> object.
   */
  override public function clone():Event {
    return new AsyncRequestEvent(type, rawData_);
  }

}
}
