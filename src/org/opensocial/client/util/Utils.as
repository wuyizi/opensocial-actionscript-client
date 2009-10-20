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

package org.opensocial.client.util {

import flash.utils.describeType;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import flash.utils.getQualifiedSuperclassName;

/**
 * Static utility functions set.
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class Utils {

  /**
   * Make the target class with the methods and variables from extension class.  This method will
   * copy the extension instance's methods, variables and properties to  the target class.
   * <p>
   * NOTE that the extension class should have a zero-parameter constructor.
   * </p>
   * @param target The class to be mixed-in.
   * @param extension The extension class.
   */
  public static function mixin(target:Class, extension:Class):void {
    var extDesc:XML = describeType(extension);
    var instance:* = new extension();
    for (var method:String in extDesc.factory.method) {
      var methodName:String = extDesc.factory.method.@name[method];
      target.prototype[methodName] = instance[methodName];
    }
    for (var variable:String in extDesc.factory.variable) {
      var variableName:String = extDesc.factory.variable.@name[variable];
      target.prototype[variableName] = instance[variableName];
    }
    for (var accessor:String in extDesc.factory.accessor) {
      var accessorName:String = extDesc.factory.accessor.@name[accessor];
      target.prototype[accessorName] = instance[accessorName];
    }
    for (var property:String in extension.prototype) {
      target.prototype[property] = extension.prototype[property];
    }
  }

  /**
   * Checks if one class is the ancestor of another class.
   * @param ancestor The ancestor class to check.
   * @param descendant The descendant class to check.
   * @return True if the descendant class is extended from the ancestor class.
   */
  public static function isAncestor(ancestor:Class, descendant:Class):Boolean {
    var name1:String = getQualifiedClassName(ancestor);
    var name2:String = getQualifiedSuperclassName(descendant);
    while(name2 != null) {
      if (name1 == name2) return true;
      name2 = getQualifiedSuperclassName(getDefinitionByName(name2) as Class);
    }
    return false;
  }
  
  
  public static function getClass(className:String):Class {
    if (className == null) {
      return null; 
    }
    var type:Class = getDefinitionByName(className) as Class;
    return type;
  }
}
}
