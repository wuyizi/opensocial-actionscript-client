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

/**
 * Options for <code><j>osapi.ui</j></code> service. The options format is based on the
 * OS-Lite style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>AsyncDataRequest</code> instance.
 * </p>
 * <p>
 * NOTE that this <code><j>osapi.ui</j></code> service is not fully settled yet and not in the
 * protocol spec. This mainly contains <code><j>requestShareApp</j></code>,
 * <code><j>requestSendMessage</j></code>, <code><j>requestCreateActivity</j></code> and
 * <code><j>requestPermission</j></code>
 * </p>
 *
 * @see AsyncDataRequest
 *
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.requestShareApp
 *      opensocial.requestShareApp
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.requestSendMessage
 *      opensocial.requestSendMessage
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.requestCreateActivity
 *      opensocial.requestCreateActivity
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.requestPermission
 *      opensocial.requestPermission
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class UIRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for ui service.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function UIRequestOptions(options:Object = null) {
    if (options == null) {
      options = {};
    }
    super(options);
  }

  /**
   * Sets the activity instance. Only used in the <code>REQUEST_CREATE_ACTIVITY</code> feature.
   * @param activity The activity instance.
   * @return The options itself.
   */
  public function setActivity(activity:Activity):UIRequestOptions {
    modify("activity", activity.toRawObject());
    return this;
  }

  /**
   * Sets the message instance. Only used in the <code>REQUEST_SEND_MESSAGE</code> feature.
   * @param message The message instance.
   * @return The options itself.
   */
  public function setMessage(message:Message):UIRequestOptions {
    modify("message", message.toRawObject());
    return this;
  }

  /**
   * Sets the reason, which is a message instance. Only used in the <code>REQUEST_SHARE_APP</code>
   * and <code>REQUEST_PERMISSION</code> feature.
   * @param reason A message instance as the reason.
   * @return The options itself.
   */
  public function setReason(reason:Message):UIRequestOptions {
    modify("reason", reason.toRawObject());
    return this;
  }

  /**
   * Sets the recipient user ids.
   * @param recipientIds An array of user id strings.
   * @return The options itself.
   */
  public function setRecipientIds(recipientIds:Array):UIRequestOptions {
    modify("recipientIds", recipientIds);
    return this;
  }

  /**
   * Sets the priority value. Only used in the <code>REQUEST_CREATE_ACTIVITY</code> feature.
   * @param priority One of the values in <code>Globals.CreateActivityPriority</code>.
   * @return The options itself.
   */
  public function setPriority(priority:String):UIRequestOptions {
    modify("priority", priority);
    return this;
  }

  /**
   * Sets the permission value. Only used in the <code>REQUEST_PERMISSION</code> feature.
   * @param permission One of the values in <code>Globals.Permission</code>.
   * @return The options itself.
   */
  public function setPermission(permission:String):UIRequestOptions {
    modify("permission", permission);
    return this;
  }
}
}
