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
 * Options for <code><j>makeRequest</j></code> service. The options format is based on the
 * OS-Lite style. The key names of the options object is defined in the protocol spec.
 * <p>
 * It's used to initialize the <code>ProxiedRequest</code> instance.
 * </p>
 * <p>
 * NOTE: Currently this feature is located at <code><j>osapi.makeRequest</j></code>, but in next
 * spec version, it will be as the <code><j>osapi.http</j></code> service.
 * </p>
 * 
 * @see ProxiedRequest
 * 
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/RPC-Protocol.html
 *      RPC Protocol
 * @see http://code.google.com/apis/opensocial/docs/0.8/reference/gadgets/#gadgets.io.makeRequest
 *      gadgets.io.makeRequest
 * @see http://wiki.opensocial.org/index.php?title=Introduction_to_makeRequest
 *      Introduction to MakeRequest
 * @see http://www.opensocial.org/Technical-Resources/opensocial-spec-v09/OpenSocial-Specification.html#osapi.http
 *      osapi.http
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class ProxiedRequestOptions extends RequestOptions {

  /**
   * Constructor of the options object for proxied request service.
   * @param options Initial value for the options. If null, default values will be applied.
   */
  public function ProxiedRequestOptions(options:Object = null) {
    if (options == null) {
      options = {};
    }
    super(options);
  }


  /**
   * Sets the method type.
   * @param method The method type. Can be any values in enum <code>GadgetsIo.MethodType</code>.
   * @return The options itself.
   */
  public function setMethod(method:String):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.METHOD, method);
    return this;
  }


  /**
   * Sets the content type for resposne.
   * @param contentType The content type. Can be any values in enum
   *        <code>GadgetsIo.ContentType</code>.
   * @return The options itself.
   */
  public function setContentType(contentType:String):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.CONTENT_TYPE, contentType);
    return this;
  }


  /**
   * Sets the post data object.
   * @param postData The post data object. The object should be simple and stringifiable.
   * @return The options itself.
   */
  public function setPostData(postData:Object):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.POST_DATA, postData);
    return this;
  }


  /**
   * Sets the headers map.
   * @param headers The headers map for the request.
   * @return The options itself.
   */
  public function setHeaders(headers:Object):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.HEADERS, headers);
    return this;
  }


  /**
   * Sets a specific header value.
   * @param headerName The name of the header to be set.
   * @param headerValue The value of the header to be set.
   * @return The options itself.
   */
  public function setHeader(headerName:String, headerValue:String):ProxiedRequestOptions {
    modifyDetail(GadgetsIo.RequestParameters.HEADERS, headerName, headerValue);
    return this;
  }


  /**
   * Sets the refresh interval for proxied request.
   * @param refreshInterval The value of the refresh interval, in seconds.
   * @return The options itself.
   */
  public function setRefreshInterval(refreshInterval:int):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.REFRESH_INTERVAL, refreshInterval);
    return this;
  }

  /**
   * Sets the authorization type for the proxied request.
   * @param authorization The authorization type. Can be any values in enum
   *        <code>GadgetsIo.AuthorizationType</code>.
   * @return The options itself.
   */
  public function setAuthorization(authorization:String):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.AUTHORIZATION, authorization);
    return this;
  }


  /**
   * Sets the number of entries for a feed request.
   * @param numEntries The number of entires to be fetched.
   * @return The options itself.
   */
  public function setNumEntries(numEntries:int):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.NUM_ENTRIES, numEntries);
    return this;
  }


  /**
   * Sets if the the feed request needs to get summaries.
   * @param getSummaries True to get summaries.
   * @return The options itself.
   */
  public function setGetSummaries(getSummaries:Boolean):ProxiedRequestOptions {
    modify(GadgetsIo.RequestParameters.GET_SUMMARIES, getSummaries);
    return this;
  }

}
}
