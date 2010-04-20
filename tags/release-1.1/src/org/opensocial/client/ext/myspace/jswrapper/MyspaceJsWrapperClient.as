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

package org.opensocial.client.ext.myspace.jswrapper {

import org.opensocial.client.core.Feature;
import org.opensocial.client.ext.myspace.core.MyspaceFeature;
import org.opensocial.client.jswrapper.JsWrapperBridge;
import org.opensocial.client.jswrapper.JsWrapperClient;
import org.opensocial.client.jswrapper.JsWrapperParsers;

/**
 * Extension of normal JsWrapperClient for myspace container. This container doesn't support
 * rpc and settitle feature. But it supports photos, albums, videos and many other extensions.
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */
public class MyspaceJsWrapperClient extends JsWrapperClient {

  public function MyspaceJsWrapperClient(jsNamespace:String = null, jsAllowedDomain:String = "*") {
    super(jsNamespace, jsAllowedDomain);
  }
  
  /**
   * @inheritDoc
   * @private
   */
  override protected function initFeatureBook():void {
    super.initFeatureBook();
  
    // Myspace does not support RPC and SET_TITLE features
    removeFeature(Feature.RPC_CALL);
    removeFeature(Feature.RPC_SERVICE_RETURN);
    removeFeature(Feature.RPC_SERVICE_REGISTER);
    removeFeature(Feature.RPC_SERVICE_UNREGISTER);
    removeFeature(Feature.SET_TITLE);
    
    // Myspace has some more extension.
    with (JsWrapperParsers) {
      super.addFeature(MyspaceFeature.PHOTOS_GET, true, parseParams, parseWrappedData);
      
      // TODO: Add the remaining features here, e.g. albums, videos...
    }
  }
  
  override protected function initJsBridge():JsWrapperBridge {
    return new MyspaceJsWrapperBridge();
  }
}
}
