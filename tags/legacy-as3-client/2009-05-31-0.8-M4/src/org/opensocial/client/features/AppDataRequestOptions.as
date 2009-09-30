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

/**
 * Options for <code><j>osapi.appdata</j></code> service. The options format is based on the
 * OS-Lite style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>AsyncDataRequest</code> instance.
 * </p>
 * 
 * @see AsyncDataRequest
 *
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/RPC-Protocol.html
 *      RPC Protocol
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/OpenSocial-Specification.html#osapi.appdata
 *      osapi.appdata
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class AppDataRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for appdata service.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function AppDataRequestOptions(options:Object = null) {
    if (options == null) {
      options = {
        "userId" : "@me",
        "groupId" : "@self",
        "appId" : "@app"
      };
    }
    super(options);
  }


  /**
   * Sets the user id value.
   * @param userId The user id. Can be "@me", "@viewer", "@owner" or actual user id value.
   * @return The options itself.
   */
  public function setUserId(userId:String):AppDataRequestOptions {
    modify("userId", [userId]);
    return this;
  }


  /**
   * Sets the user id values.
   * @param userIds An array of user ids.
   * @return The options itself.
   */
  public function setUserIds(userIds:Array):AppDataRequestOptions {
    modify("userId", userIds);
    return this;
  }


  /**
   * Adds the user id values.
   * @param userIds User ids to be added.
   * @return The options itself.
   */
  public function addUserIds(...userIds:Array):AppDataRequestOptions {
    append("userId", userIds);
    return this;
  }


  /**
   * Sets the group id value.
   * @param groupId The group id.
   * @return The options itself.
   */
  public function setGroupId(groupId:String):AppDataRequestOptions {
    modify("groupId", groupId);
    return this;
  }


  /**
   * Sets the network distance value.
   * @param networkDistance The network distance value.
   * @return The options itself.
   */
  public function setNetworkDistance(networkDistance:int):AppDataRequestOptions {
    modify("networkDistance", networkDistance);
    return this;
  }


  /**
   * Sets the keys for the appdata to be fetch. Only used in the <code>APP_DATA_GET</code> and the
   * <code>APP_DATA_DELETE</code> feature.
   * @param keys An array of keys.
   * @return The options itself.
   */
  public function setKeys(keys:Array):AppDataRequestOptions {
    modify("keys", keys);
    return this;
  }


  /**
   * Sets the key and the data value for the appdata to be update. Only used in the
   * <code>APP_DATA_UPDATE</code> feature.
   * @param key The key.
   * @param value The data value.
   * @return The options itself.
   */
  public function setDatum(key:String, value:String):AppDataRequestOptions {
    modifyDetail("data", key, value);
    return this;
  }

  /**
   * Sets the data map of keys and values pairs for the appdata to be update. Only used in the
   * <code>APP_DATA_UPDATE</code> feature.
   * @param data The data map.
   * @return The options itself.
   */
  public function setData(data:Object):AppDataRequestOptions {
    modify("data", data);
    return this;
  }
}
}
