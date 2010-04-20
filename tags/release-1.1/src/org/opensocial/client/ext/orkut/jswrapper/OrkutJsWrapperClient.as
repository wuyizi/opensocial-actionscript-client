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

package org.opensocial.client.ext.orkut.jswrapper {

import org.opensocial.client.core.Feature;
import org.opensocial.client.jswrapper.JsWrapperClient;
import org.opensocial.client.jswrapper.JsWrapperParsers;

/**
 * Extension of normal JsWrapperClient for orkut container. This container doesn't support
 * activities.get and requestShareApp feature. But it support albums and many other extensions.
 * 
 * @author zakiyy.yan@gmail.com (Zhinan Yan)
 */
public class OrkutJsWrapperClient extends JsWrapperClient {

  public function OrkutJsWrapperClient(jsNamespace:String = null, jsAllowedDomain:String = "*") {
    super(jsNamespace, jsAllowedDomain);
  }
  
  /**
   * @inheritDoc
   * @private
   */
  override protected function initFeatureBook():void {
    super.initFeatureBook();
  
    // Orkut does not support ACTIVITIES_GET and REQUEST_SHARE_APP features
    removeFeature(Feature.ACTIVITIES_GET);
    removeFeature(Feature.REQUEST_SHARE_APP);

    
    // Orkut has some more extension.
    with (JsWrapperParsers) {
      super.addFeature(Feature.ALBUMS_CREATE, true, parseParams, parseEmpty);
      super.addFeature(Feature.ALBUMS_GET, true, parseParams, parseWrappedData);
      super.addFeature(Feature.ALBUMS_UPDATE, true, parseParams, parseEmpty);
      super.addFeature(Feature.ALBUMS_DELETE, true, parseParams, parseEmpty);
      
      super.addFeature(Feature.REQUEST_UPLOAD_MEDIAITEM, true, parseParams, parseEmpty);
      super.addFeature(Feature.MEDIAITEMS_GET, true, parseParams, parseWrappedData);
      super.addFeature(Feature.MEDIAITEMS_UPDATE, true, parseParams, parseEmpty);

    }
  }
}
}
