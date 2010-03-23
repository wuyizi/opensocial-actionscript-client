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
 * Wrapper of <code><j>opensocial.Album</j></code> object in javascript.
 *
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/OpenSocial-Specification.html#opensocial.Album
 *
 * @author zakiyy.yan@gmail.com (Zhinan Yan)
 */
public class Album extends MutableDataType {

  /**
   * <code><j>opensocial.Album.Field</j></code> constants.
   * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/OpenSocial-Specification.html#opensocial.Album.Field
   */
  public static const Field:ConstType = new ConstType(
      "opensocial.Album.Field", {
          DESCRIPTION       : 'description',
          ID                : 'id',
          LOCATION          : 'location',              /* opensocial.Address */
          MEDIA_ITEM_COUNT  : 'mediaItemCount',
          MEDIA_MIME_TYPE   : 'mediaMimeType',         /* Array.<String> */
          MEDIA_TYPE        : 'mediaType',             /* Array.<MediaItem> */
          OWNER_ID          : 'ownerId',
          THUMBNAIL_URL     : 'thumbnailUrl',
          TITLE             : 'title'
      });


  /**
   * Creates an <code>Album</code> object. The signature only accepts several common fields. For
   * other fields, use the <code>setField</code> method.
   * @param title The title text.
   * @return The new instance.
   */
  public static function newInstance(title:String):Album {
    var album:Album = new Album(MutableDataType.createRawObject());
    album.setField(Field.TITLE, title);
    return album;
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
  public function Album(rawObj:Object) {
    super(rawObj);
  }

  /**
   * Gets the ID that can be permanently associated with this album.
   * @return The id string.
   */
  public function getId():String {
    return getRawProperty("id") as String;
  }

  /**
   * Get the thumbnail url field of the album. Will not throw error if not exists.
   * @return The thumbnail url if exists.
   */
  public function getThumbnailUrl():String {
    return getFieldString(Field.THUMBNAIL_URL);
  }
  
  /**
   * Get the title field of the album. Will not throw error if not exists.
   * @return The title if exists.
   */
  public function getTitle():String {
    return getFieldString(Field.TITLE);
  }

  /**
   * Returns the default album display string.
   * @return The album field: <code>TITLE</code>
   */
  override public function toString():String {
    return getFieldString(Field.TITLE);
  }

}
}
