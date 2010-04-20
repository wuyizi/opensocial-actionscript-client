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

import org.opensocial.client.base.MediaItem;

/**
 * Options for <code><j>osapi.mediaItems</j></code> service. The options format is based on the
 * OS-Lite style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>AsyncDataRequest</code> instance.
 * </p>
 *
 * @see AsyncDataRequest
 *
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/RPC-Protocol.html
 *      RPC Protocol
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/RPC-Protocol.html#
 *      MediaItem
 *
 * @author zakiyy.yan@gmail.com (Zhinan Yan)
 */
public class MediaItemsRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for mediaItems service.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function MediaItemsRequestOptions(options:Object = null) {
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
  public function setUserId(userId:String):MediaItemsRequestOptions {
    modify("userId", [userId]);
    return this;
  }


  /**
   * Sets the user id values.
   * @param userIds An array of user ids.
   * @return The options itself.
   */
  public function setUserIds(userIds:Array):MediaItemsRequestOptions {
    modify("userId", userIds);
    return this;
  }


  /**
   * Adds the user id values.
   * @param userIds User ids to be added.
   * @return The options itself.
   */
  public function addUserIds(...userIds:Array):MediaItemsRequestOptions {
    append("userId", userIds);
    return this;
  }


  /**
   * Sets the group id value.
   * @param groupId The group id.
   * @return The options itself.
   */
  public function setGroupId(groupId:String):MediaItemsRequestOptions {
    modify("groupId", groupId);
    return this;
  }


  /**
   * Sets the number of people to be fetch. Only used in the <code>MEDIAITEMS_GET</code>
   * feature.
   * @param count The number of the counts.
   * @return The options itself.
   */
  public function setCount(count:int):MediaItemsRequestOptions {
    modify("count", count);
    return this;
  }


  /**
   * Sets the start index to be fetch. Only used in the <code>MEDIAITEMS_GET</code> feature.
   * @param startIndex The number of the start index.
   * @return The options itself.
   */
  public function setStartIndex(startIndex:int):MediaItemsRequestOptions {
    modify("startIndex", startIndex);
    return this;
  }


  /**
   * Sets the mediaitem d. Only used in the <code>MEDIAITEMS_GET</code> feature.
   * @param startIndex The number of the start index.
   * @return The options itself.
   */
  public function setMediaItemId(mediaItemId:String):MediaItemsRequestOptions {
    modify("mediaItemId", mediaItemId);
    return this;
  }


  /**
   * Sets the album id. 
   * @param albumId The album id.
   * @return The options itself.
   */
  public function setAlbumId(albumId:String):MediaItemsRequestOptions {
    modify("albumId", albumId);
    return this;
  }


  /**
   * Sets the mediaitem instance. Only used in the <code>MEDIAITEMS_UPDATE</code> feature.
   * @param mediaitem The mediaitem instance.
   * @return The options itself.
   */
  public function setMediaItem(mediaitem:MediaItem):MediaItemsRequestOptions {
    modify("mediaItem", mediaitem.toRawObject());
    return this;
  }
}
}
