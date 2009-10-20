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

package org.opensocial.client.ext.myspace.features {

import org.opensocial.client.features.RequestOptions;

/**
 * Experimental options for MyOpenSpace photos service. It covers these request types in myspace:
 * <code><j>MyOpenSpace.RequestType.FETCH_PHOTO</j></code> and 
 * <code><j>MyOpenSpace.RequestType.FETCH_PHOTOS</j></code>. The options format is based on the 
 * OS-Lite * style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>AsyncDataRequest</code> instance.
 * </p>
 *
 * @see AsyncDataRequest
 * @see http://wiki.developer.myspace.com/index.php?title=OpenSocial_Version_0.8
 *      Myspace OpenSocial Documents
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class MyspacePhotosRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for photos service.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function MyspacePhotosRequestOptions(options:Object = null) {
    if (options == null) {
      options = {
        "userId" : "@me"
      };
    }
    super(options);
  }


  /**
   * Sets the user id value.
   * @param userId The user id. Can be "@me", "@viewer", "@owner" or actual user id value.
   * @return The options itself.
   */
  public function setUserId(userId:String):MyspacePhotosRequestOptions {
    modify("userId", userId);
    return this;
  }


  /**
   * Sets the user id values.
   * @param userIds An array of user ids.
   * @return The options itself.
   */
  public function setPhotoId(photoId:String):MyspacePhotosRequestOptions {
    modify("photoId", photoId);
    return this;
  }

  /**
   * Sets the number of photos to be fetch.
   * @param count The number of the counts.
   * @return The options itself.
   */
  public function setCount(count:int):MyspacePhotosRequestOptions {
    modify("count", count);
    return this;
  }


  /**
   * Sets the start index to be fetch.
   * @param startIndex The number of the start index.
   * @return The options itself.
   */
  public function setStartIndex(startIndex:int):MyspacePhotosRequestOptions {
    modify("startIndex", startIndex);
    return this;
  }

}
}
