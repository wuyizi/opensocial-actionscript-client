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

package org.opensocial.client.base {

/**
 * Wrapper of <code><j>opensocial.MediaItem</j></code> object in javascript.
 *
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.MediaItem
 *      opensocial.MediaItem
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class MediaItem extends MutableDataType {
  /**
   * <code><j>opensocial.MediaItem.Field</j></code> constants.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.MediaItem.Field
   *      opensocial.MediaItem.Field
   */
  public static const Field:ConstType = new ConstType(
      "opensocial.MediaItem.Field", {
          ALBUM_ID       : 'albumId',
          CREATED        : 'created',
          DESCRIPTION    : 'description',
          DURATION       : 'duration',
          FILE_SIZE      : 'fileSize',
          ID             : 'id',
          LANGUAGE       : 'language',
          LAST_UPDATED   : 'lastUpdated',
          LOCATION       : 'location',
          MIME_TYPE      : 'mimeType',
          NUM_COMMENTS   : 'numComments',
          NUM_VIEWS      : 'numViews',
          NUM_VOTES      : 'numVotes',
          RATING         : 'rating',
          START_TIME     : 'startTime',
          TAGGED_PEOPLE  : 'taggedPeople',    /* Array.<String> */
          TAGS           : 'tags',            /* Array.<String> */
          THUMBNAIL_URL  : 'thumbnailUrl',
          TITLE          : 'title',
          TYPE           : 'type',            /* MediaItem.Type */
          URL            : 'url'
      });

  /**
   * <code><j>opensocial.MediaItem.Type</j></code> constants.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.MediaItem.Type
   *      opensocial.MediaItem.Type
   */
  public static const Type:ConstType = new ConstType(
      "opensocial.MediaItem.Type", {
          IMAGE     : 'image',
          VIDEO     : 'video',
          AUDIO     : 'audio'
      });

  /**
   * Creates an <code>MediaItem</code> object.
   * @param mimeType The mime type of this media.
   * @param url The url of this media.
   * @param type The value for <code>IdSpec.Field.TYPE</code>. which is a
   *             <code>MediaItem.Type</code> value.
   * @return The new instance.
   */
  public static function newInstance(mimeType:String,
                                     url:String,
                                     type:String = null):MediaItem {
    var mediaItem:MediaItem = new MediaItem(MutableDataType.createRawObject());
    mediaItem.setField(Field.MIME_TYPE, mimeType);
    mediaItem.setField(Field.URL, url);
    if (type != null && Type.valueOf(type) != null) {
      mediaItem.setField(Field.TYPE, type);
    }
    return mediaItem;
  }

  /**
   * Constructor.
   * <p>
   * NOTE: This constructor is internally used. Do not call this constructor directly outside
   * this package.
   * </p>
   * @param rawObj The wrapped object from Js-side passed by the <code>ExternalInterface</code>.
   * @private
   */
  public function MediaItem(rawObj:Object) {
    super(rawObj);
  }
  
  /**
   * Gets the ID that can be permanently associated with this media item.
   * @return The id string.
   */
  public function getId():String {
    return getRawProperty("id") as String;
  }
  
  /**
   * Get the thumbnail url field of the media item. Will not throw error if not exists.
   * @return The thumbnail url if exists.
   */
  public function getThumbnailUrl():String {
    return getFieldString(Field.THUMBNAIL_URL);
  }
  
  /**
   * Get the title field of the media item. Will not throw error if not exists.
   * @return The title if exists.
   */
  public function getTitle():String {
    return getFieldString(Field.TITLE);
  }

  /**
   * Returns the default media item display string.
   * @return The media item url.
   */
  override public function toString():String {
    return getFieldString(Field.URL);
  }
}
}
