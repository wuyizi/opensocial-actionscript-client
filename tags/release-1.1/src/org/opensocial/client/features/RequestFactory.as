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
import org.opensocial.client.core.Feature;

/**
 * Factory to build the async requests.
 * 
 * @example
 * <listing version="3.0">
 * // Request the viewer.
 * RequestFactory.getViewer(["gender", "currentLocation"]).addCompleteHandler(
 *     function(responseItem:ResponseItem):void {
 *       var viewer:Person = responseItem.getData();
 *       // deal with the viewer.
 *     }).send(client);
 * </listing>
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class RequestFactory {

  private static const DEFAULT_COUNT:int = 20;

  /**
   * Creates a typical people request.
   * @param userId The user Id string.
   * @param groupId The group Id string, can be "@self" or "@friends".
   * @param count Desired size for responding collection.
   * @param startIndex Desired start index of the responding collection.
   * @param fields Desired fields to fetch.
   * @param filterBy Filter option for the responding collection.
   * @param sortBy Sorting option for the responding collection.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getPeople(userId:String,
                                   groupId:String,
                                   count:int = DEFAULT_COUNT,
                                   startIndex:int = 0,
                                   fields:Array = null,
                                   filterBy:String = null,
                                   sortBy:String = null):AsyncDataRequest {
    return new AsyncDataRequest(
        Feature.PEOPLE_GET,
        new PeopleRequestOptions()
            .setUserId(userId)
            .setGroupId(groupId)
            .setCount(count)
            .setStartIndex(startIndex)
            .setFields(fields)
            .setFilterBy(filterBy)
            .setSortBy(sortBy));
  }


  /**
   * Creates a people request for the viewer.
   * @param fields Desired fields to fetch.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getViewer(fields:Array):AsyncDataRequest {
    return getPeople("@viewer", "@self", 1, 0, fields);
  }


  /**
   * Creates a people request for the owner.
   * @param fields Desired fields to fetch.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getOwner(fields:Array):AsyncDataRequest {
    return getPeople("@owner", "@self", 1, 0, fields);
  }


  /**
   * Creates a people request for the viewer friends.
   * @param count Desired size for responding collection.
   * @param startIndex Desired start index of the responding collection.
   * @param fields Desired fields to fetch.
   * @param filterBy Filter option for the responding collection.
   * @param sortBy Sorting option for the responding collection.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getViewerFriends(count:int = DEFAULT_COUNT,
                                          startIndex:int = 0,
                                          fields:Array = null,
                                          filterBy:String = null,
                                          sortBy:String = null):AsyncDataRequest {
    return getPeople("@viewer", "@friends", count, startIndex, fields, filterBy, sortBy);
  }


  /**
   * Creates a people request for the owner friends.
   * @param count Desired size for responding collection.
   * @param startIndex Desired start index of the responding collection.
   * @param fields Desired fields to fetch.
   * @param filterBy Filter option for the responding collection.
   * @param sortBy Sorting option for the responding collection.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getOwnerFriends(count:int = DEFAULT_COUNT,
                                         startIndex:int = 0,
                                         fields:Array = null,
                                         filterBy:String = null,
                                         sortBy:String = null):AsyncDataRequest {
    return getPeople("@owner", "@friends", count, startIndex, fields, filterBy, sortBy);
  }

  /**
   * Creates an activities request.
   * @param userId The user Id string.
   * @param groupId The group Id string, can be "@self" or "@friends".
   * @param count Desired size for responding collection.
   * @param startIndex Desired start index of the responding collection.
   * @param fields Desired fields to fetch.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getActivities(userId:String,
                                       groupId:String,
                                       count:int = DEFAULT_COUNT,
                                       startIndex:int = 0,
                                       fields:Array = null):AsyncDataRequest {
    return  new AsyncDataRequest(
        Feature.ACTIVITIES_GET,
        new ActivitiesRequestOptions()
            .setUserId(userId)
            .setGroupId(groupId)
            .setCount(count)
            .setStartIndex(startIndex)
            .setFields(fields));
  }


  /**
   * Creates an appdata request to get data.
   * @param userId The user Id string.
   * @param groupId The group Id string, can be "@self" or "@friends".
   * @param keys Desired keys of the app data.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function getAppData(userId:String,
                                    groupId:String,
                                    keys:Array):AsyncDataRequest {
    return  new AsyncDataRequest(
        Feature.APP_DATA_GET,
        new AppDataRequestOptions()
            .setUserId(userId)
            .setGroupId(groupId)
            .setKeys(keys));
  }


  /**
   * Creates an appdata request to update data. This request can only perform on viewer himself.
   * @param data The key-value pairs to update.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function updateAppData(data:Object):AsyncDataRequest {
    return  new AsyncDataRequest(
        Feature.APP_DATA_UPDATE,
        new AppDataRequestOptions()
            .setUserId("@me")
            .setGroupId("@self")
            .setData(data));
  }


  /**
   * Creates an appdata request to delete data. This request can only perform on viewer himself.
   * @param keys The keys of the data to delete.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function deleteAppData(keys:Array):AsyncDataRequest {
    return  new AsyncDataRequest(
        Feature.APP_DATA_DELETE,
        new AppDataRequestOptions()
            .setUserId("@me")
            .setGroupId("@self")
            .setKeys(keys));
  }


  /**
   * Creates a ui request to send message.
   * @param recipientIds The array of user ids as recipients.
   * @param message A message to send.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function requestSendMessage(recipientIds:Array,
                                            message:Message):AsyncDataRequest {
    return new AsyncDataRequest(
        Feature.REQUEST_SEND_MESSAGE,
        new UIRequestOptions()
            .setRecipientIds(recipientIds)
            .setMessage(message));
  }


  /**
   * Creates a ui request to share app.
   * @param recipientIds The array of user ids as recipients.
   * @param reason A message as the reason to send.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function requestShareApp(recipientIds:Array,
                                         reason:Message):AsyncDataRequest {
    return new AsyncDataRequest(
        Feature.REQUEST_SHARE_APP,
        new UIRequestOptions()
            .setRecipientIds(recipientIds)
            .setReason(reason));
  }


  /**
   * Creates a ui request to create activty.
   * @param activity The activity object to create.
   * @param priority The priority of the activity.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function requestCreateActivity(activity:Activity,
                                               priority:String = null):AsyncDataRequest {
    return new AsyncDataRequest(
        Feature.REQUEST_CREATE_ACTIVITY,
        new UIRequestOptions()
            .setActivity(activity)
            .setPriority(priority));
  }


  /**
   * Creates a ui request to permission.
   * @param permission The permission value to request.
   * @param reason A message as the reason.
   * @return An <code>AsyncDataRequest</code> object ready to listen and send.
   */
  public static function requestPermission(permission:String,
                                           reason:Message):AsyncDataRequest {
    return new AsyncDataRequest(
        Feature.REQUEST_PERMISSION,
        new UIRequestOptions()
            .setPermission(permission)
            .setReason(reason));
  }


  /**
   * Creates a proxied io request.
   * @param url The remote target url.
   * @param method The http method for the request, GET or POST.
   * @param contentType The desired content type, can be TEXT, JSON or FEED.
   * @param authorization The authorization type of the request, NONE, SIGNED or OAUTH.
   * @param postData The post data object if the method is POST.
   * @return A <code>ProxiedRequest</code> object ready to listen and send.
   */
  public static function makeRequest(url:String, 
                                     method:String = null,
                                     contentType:String = null,
                                     authorization:String = null,
                                     postData:Object = null):ProxiedRequest {
    var options:ProxiedRequestOptions = new ProxiedRequestOptions();
    if (method != null) options.setMethod(method);
    if (contentType != null) options.setContentType(contentType);
    if (authorization != null) options.setAuthorization(authorization);
    if (postData != null) options.setPostData(postData);
    return new ProxiedRequest(url, options);
  }
}
}
