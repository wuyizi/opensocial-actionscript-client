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

import org.opensocial.client.base.Person;

/**
 * Options for <code><j>osapi.people</j></code> service. The options format is based on the OS-Lite
 * style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>AsyncDataRequest</code> instance.
 * </p>
 *
 * @see AsyncDataRequest
 *
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/RPC-Protocol.html
 *      RPC Protocol
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/OpenSocial-Specification.html#osapi.people
 *      osapi.people
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class PeopleRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for people service. 
   * NOTE: Myspace's newFetchPeopleRequest function is not support opensocial.DataRequest.PeopleRequestFields.PROFILE_DETAILS.
   *       If the container server is Shindig, the request will auto added default fileds ["id", "displayName", "thumbnailUrl", "profileUrl"].
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function PeopleRequestOptions(options:Object = null) {
    if (options == null) {
     options = {
        "userId" : "@me",
        "groupId" : "@self",
        "count" : 20,
        "startIndex" : 0
      };
    }
    super(options);
  }


  /**
   * Sets the user id value.
   * @param userId The user id. Can be "@me", "@viewer", "@owner" or actual user id value.
   * @return The options itself.
   */
  public function setUserId(userId:String):PeopleRequestOptions {
    modify("userId", [userId]);
    return this;
  }


  /**
   * Sets the user id values.
   * @param userIds An array of user ids.
   * @return The options itself.
   */
  public function setUserIds(userIds:Array):PeopleRequestOptions {
    modify("userId", userIds);
    return this;
  }


  /**
   * Adds the user id values.
   * @param userIds User ids to be added.
   * @return The options itself.
   */
  public function addUserIds(...userIds:Array):PeopleRequestOptions {
    append("userId", userIds);
    return this;
  }


  /**
   * Sets the group id value.
   * @param groupId The group id.
   * @return The options itself.
   */
  public function setGroupId(groupId:String):PeopleRequestOptions {
    modify("groupId", groupId);
    return this;
  }


  /**
   * Sets the network distance value.
   * @param networkDistance The network distance value.
   * @return The options itself.
   */
  public function setNetworkDistance(networkDistance:int):PeopleRequestOptions {
    modify("networkDistance", networkDistance);
    return this;
  }


  /**
   * Sets the nunber of activities to be fetch. Only used in the <code>PEOPLE_GET</code>
   * feature.
   * @param count The number of the counts.
   * @return The options itself.
   */
  public function setCount(count:int):PeopleRequestOptions {
    modify("count", count);
    return this;
  }


  /**
   * Sets the start index to be fetch. Only used in the <code>PEOPLE_GET</code> feature.
   * @param startIndex The number of the start index.
   * @return The options itself.
   */
  public function setStartIndex(startIndex:int):PeopleRequestOptions {
    modify("startIndex", startIndex);
    return this;
  }


  /**
   * Sets the activity fields to be fetch. Only used in the <code>PEOPLE_GET</code> feature.
   * @param fields An array of field names.
   * @return The options itself.
   */
  public function setFields(fields:Array):PeopleRequestOptions {
    modify("fields", fields);
    return this;
  }


  /**
   * Adds the activity fields to be fetch. Only used in the <code>PEOPLE_GET</code> feature.
   * @param fields Field names.
   * @return The options itself.
   */
  public function addFields(...fields:Array):PeopleRequestOptions {
    append("fields", fields);
    return this;
  }


  /**
   * Sets the filtering option for fetching. Only used in the <code>PEOPLE_GET</code> feature.
   * @param filterBy The filtering option value.
   * @return The options itself.
   */
  public function setFilterBy(filterBy:String):PeopleRequestOptions {
    modify("filterBy", filterBy);
    return this;
  }


  /**
   * Sets the sorting option for fetching. Only used in the <code>PEOPLE_GET</code> feature.
   * @param sortBy The sorting option value.
   * @return The options itself.
   */
  public function setSortBy(sortBy:String):PeopleRequestOptions {
    modify("sortBy", sortBy);
    return this;
  }


  /**
   * Sets the person instance to this option object. Not used yet.
   * @param person The person instance.
   * @return The options itself.
   */
  public function setPerson(person:Person):PeopleRequestOptions {
    modify("person", person);
    return this;
  }
}
}
