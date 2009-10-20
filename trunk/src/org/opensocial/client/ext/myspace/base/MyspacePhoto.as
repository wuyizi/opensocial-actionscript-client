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

package org.opensocial.client.ext.myspace.base {

import org.opensocial.client.base.ConstType;
import org.opensocial.client.base.DataType;

/**
 * Wrapper of <code><j>MyOpenSpace.Photo</j></code> in javascript.
 * 
 * @see http://wiki.developer.myspace.com/index.php?title=OpenSocial_Version_0.8
 *      Myspace OpenSocial Documents
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class MyspacePhoto extends DataType {

  /**
   * <code><j>MyOpenSpace.Photo.Field</j></code> constants.
   */
  public static const Field:ConstType = new ConstType(
      "MyOpenSpace.Photo.Field", {
          PHOTO_ID       : 'PHOTO_ID',
          PHOTO_URI      : 'PHOTO_URI',
          IMAGE_URI      : 'IMAGE_URI',
          CAPTION        : 'CAPTION'
      });

  /**
   * Constructor.
   * <p>
   * NOTE: This constructor is internally used. Do not call this constructor directly outside
   * this package.
   * </p>
   * @param rawObj The wrapped object from Js-side passed by the <code>ExternalInterface</code>.
   * @private
   */
  public function MyspacePhoto(rawObj:Object) {
    super(rawObj);
  }

  /**
   * Gets the caption of a myspace photo.
   * @return The caption string.
   */
  public function getCaption():String {
    return getFieldString(Field.CAPTION);
  }

  /**
   * Gets the image url of a myspace photo.
   * @return The url string.
   */
  public function getImageUri():String {
    return getFieldString(Field.IMAGE_URI);
  }

  /**
   * Returns the default address display string.
   *
   * TODO: add locale namespace support.
   *
   * @return The address text with fields: <code>IMAGE_URI</code>.
   */
  override public function toString():String {
    var imageUri:String = getFieldString(Field.IMAGE_URI);
    return imageUri;
  }
}
}
