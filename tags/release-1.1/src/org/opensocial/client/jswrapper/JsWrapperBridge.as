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

package org.opensocial.client.jswrapper {

import flash.external.ExternalInterface;
import flash.utils.ByteArray;

import org.opensocial.client.util.Logger;

/**
 * The bridge between javascript and actionscript. It loads a 'plugin-able' XML which contains 
 * scripts snippets for data interaction with OpenSocial services.
 * 
 * The following is the structure of the XML. Each element can be replace or insert some new script
 * for other non-default containers to support special services and types.
 * 
 * This structure is not tight related to the flash itself. It's all for overriding and injecting.
 * It should be well refactored in the future.
 * 
 * <listing version="3.0">
 * 
 * <global name="shindig">
 *   <gadgets>...</gadgets>
 *   <opensocial>
 *     <flash>
 *       <debug>...</debug>            <!-- some debugging tools in javascript -->
 *       <kernel>                      <!-- The kernel class, containing all no-trivial codes -->
 *         <self>...</self>
 *         <utility>...</utility>      <!-- Some util functions, some for testing -->
 *         <helper>...</helper>        <!-- Some data interpreters, likely to override -->
 *         <legacy>...</legacy>        <!-- Some legacy data translators, likely to override -->
 *         <api>                       <!-- begin of interface, inject new services here -->
 *           <env>...</env>
 *           <views>...</views>
 *           <win>...</win>
 *           <rpc>...</rpc>
 *           <io>...</io>
 *           <people>...</people>
 *           <activities>...</activities>
 *           <appdata>...</appdata>
 *           <ui>...</ui>
 *         </api>                      <!-- end of interface -->
 *       </kernel>
 *     </flash>
 *   </opensocial>
 * </global>
 * 
 * </listing>
 * 
 * @author yiziwu@google.com (Yizi Wu)
 */

public class JsWrapperBridge {

  [Embed(source="default.xml", mimeType="application/octet-stream")]
  public static var DefaultScript:Class;
  
  private static var logger:Logger = new Logger(JsWrapperBridge);

  protected var scripts:XML;
  
  public function JsWrapperBridge() {
    scripts = initializeScripts(DefaultScript);
  }

  protected function initializeScripts(embededScript:Class):XML {
    var ba:ByteArray = (new embededScript()) as ByteArray;
    var s:String = ba.readUTFBytes(ba.length);
    return XML(s);
  }
  
  /**
   * Extracts the javascript code from the integrated xml object and makes it 
   * live in javascript dom enviroment.
   */
  public function render():void {
    var js:String = scripts..script.children();
    // logger.info(js);
    ExternalInterface.call('function() {' + js + '}');
  }
  
  /**
   * Extend the default xml the extension xml. 
   * @param extension The extension xml loaded in extended client bridge.
   * @see org.opensocial.client.ext.myspace.jswrapper.MyspaceJsWrapperBridge
   */
  public function extend(extension:XML):void {
    var list:XMLList = extension..*.(attribute("action") == "replace" || 
                                     attribute("action") == "insert");
    
    for (var index:String in list) {
      
      var item:XML = list[index];
      
      var paths:Array = gotoRoot(item);

      var position:XML = gotoChild(scripts, paths);
      
      
      if (item.@action == "insert") {
        insert(position, item);
      } else if (item.@action == "replace") {
        replace(position, item);
      }
    }
  }
  
  protected function replace(position:XML, item:XML):void {
    position.replace(item.name(), item);
    
  }
  
  protected function insert(position:XML, item:XML):void {
    if (!position.hasOwnProperty(item.name())) {
      position.appendChild(item);
    } else {
      position.insertChildAfter(position.child(item.name()), item);
    }
  }
  
  
  protected function gotoRoot(xml:XML):Array {
    var paths:Array = [];
    var node:XML = xml.parent();
    while (node != null) {
      paths.push(node.name());
      node = node.parent();
    } 
    paths.reverse();
    return paths;
  }
  
  protected function gotoChild(root:XML, paths:Array):XML {
    var node:XMLList = new XMLList(root);

    for each (var name:String in paths) {
      
      if (name == node.name()) {
        continue;
      }
      node = node.child(name);
    }
    return node[0];
  }
}
}
