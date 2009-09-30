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
import org.opensocial.client.core.*;

/**
 * Helper class for all synchronous features. It contains most of the sync functions from
 * <code><j>gadgets.views</j></code>, <code><j>gadgets.window</j></code> and 
 * <code><j>opensocial.Environment</j></code>.
 *
 * <p>
 * NOTE: This class duplicates the package functions in the package
 * <code>org.opensocial.client.sync</code>. We haven't decided which to keep. Once this issue is
 * settled, one of these two locations for sync functions will be deprecated.
 * </p>
 *
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.views gadgets.views
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.window gadgets.window
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.Environment opensocial.Environment
 *
 * @example
 * <listing version="3.0">
 *   var client:JsWrapperClient;
 *   var helper:SyncHelper;
 *   function init():void {
 *     displaySomeStuff();
 *     // Initialize the client and start.
 *     client = new JsWrapperClient();
 *     client.addEventListener(OpenSocialClientEvent.READY, onReady);
 *     client.start();
 *     // Initialize the helper objects.
 *     helper = new SyncHelper(client);
 *   }
 *   function onReady(event:OpenSocialEvent):void {
 *     displayOtherStuff();
 *     var domain:String = helper.getDomain();
 *     var view:String = helper.getCurrentView();
 *     if (view == GadgetsViews.ViewType.CANVAS) {
 *       displayCanvas();
 *     } else {
 *       // ...
 *     }
 *   }
 * </listing>
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class SyncHelper {

  private var client_:OpenSocialClient;

  /**
   * Constructor.
   * @param client The opensocial client instance.
   */
  public function SyncHelper(client:OpenSocialClient) {
    client_ = client;
  }

  /**
   * Calls the <code><j>gadgets.views.getCurrentView</j></code> to get the current view
   * name. Null if the 'views' feature is not enabled.
   * @return The view name, defined in <code>GadgetsViews.ViewType</code>.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.views.getCurrentView
   *      gadgets.views.getCurrentView
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.views.View.getName
   *      gadgets.views.View.getName
   */
  public function getCurrentView():String {
    return client_.callSync(Feature.GET_CURRENT_VIEW);
  }

  /**
   * Calls the <code><j>gadgets.views.View.isOnlyVisibleGadget</j></code> to check if
   * it is the only app on the page. Returns true if the 'views' feature is not enabled.
   * @return True if it's the only one visible app.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.views.View.isOnlyVisibleGadget
   *      gadgets.views.View.isOnlyVisibleGadget
   *
   */
  public function isViewOnlyVisible():Boolean {
    return client_.callSync(Feature.IS_ONLY_VISIBLE);
  }

  /**
   * Calls the <code><j>gadgets.views.getParams</j></code> to get the params from current view.
   * @return The params object.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.views.getParams
   *      gadgets.views.getParams
   */
  public function getViewParams():Object {
    return client_.callSync(Feature.GET_VIEW_PARAMS);
  }

  /**
   * Sets the app's witdh. This will resize the swf object's width.
   * @param width The new width.
   */
  public function setStageWidth(width:Number):void {
    client_.callSync(Feature.SET_STAGE_WIDTH, width);
  }


  /**
   * Sets the app's height.
   * This will resize the swf object's height. It will also adjust the iframe's height
   * if the 'dynamicHeight' feature is available.
   * @param height The new height.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.window.adjustHeight
   *      gadgets.window.adjustHeight
   */
  public function setStageHeight(height:Number):void {
    client_.callSync(Feature.SET_STAGE_HEIGHT, height);
  }


  /**
   * Sets the app's title if the 'settitle' feature is available.
   * @param title The new title.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.window.setTitle
   *      gadgets.window.setTitle
   */
  public function setTitle(title:String):void {
    client_.callSync(Feature.SET_TITLE, title);
  }

  /**
   * Calls the <code><j>opensocial.Environment.supportsField</j></code> to check if the field
   * in the type is supported for this container.
   * @return True if supported.
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.Environment.supportsField
   *      opensocial.Environment.supportsField
   */
  public function supportsField(objectType:String, field:String):Boolean {
    return client_.callSync(Feature.SUPPORTS_FIELD, objectType, field);
  }


  /**
   * Calls the <code><j>opensocial.Environment.getDomain</j></code> to get the domain of the
   * running conatiner.
   * @return The domain of the container, e.g. orkut.com, 51.com
   * @see http://code.google.com/apis/opensocial/docs/0.8/reference/#opensocial.Environment.getDomain
   *      opensocial.Environment.getDomain
   */
  public function getDomain():String {
    return client_.callSync(Feature.GET_DOMAIN);
  }


  /**
   * Extract the container domain from the document.referer field. It maybe different from the
   * <code>getDomain</code> method.
   * @return The domain of the container url.
   */
  public function getContainerDomain():String {
    return client_.callSync(Feature.GET_CONTAINER_DOMAIN);
  }
}
}
