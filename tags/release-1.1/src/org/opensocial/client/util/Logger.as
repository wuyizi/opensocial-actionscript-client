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
import flash.utils.getQualifiedClassName;

/**
 * A reference logger funtionality class, just like java.util.logging.Logger.
 * Developers can extend this class to do more customize and use different
 * pinrters.
 * <p>
 * Here is the usage:
 * @example
 * <listing version="3.0">
 *   // Somewhere in initializing codes, choose one of these printers.
 *   Logger.initialize(new FirebugPrinter());
 *   // Logger.initialize(new TracePrinter());
 *   // Logger.initialize(new TextFieldPrinter(root, 100, 200));
 *
 *
 *   // Declare a static logger in the first line of a class.
 *   public class YourClass {
 *     private static var logger:Logger = new Logger(YourClass);
 *     //....
 *   }
 *
 *
 *   // Use the logger in anywhere of this class to output.
 *   logger.info("Some text"); // log a string
 *   logger.error(anError);    // log an error
 *   logger.log(anObj);        // log and inspect (recursively) for an object.
 * </listing>
 *
 * <p>
 * Verbose usage:
 * <li> 0: output log/error, no timestamp, no classname.
 * <li> 1: output info/log/error, no timestamp, no classname.
 * <li> 2: output info/log/error, with timestamp and classname.
 * <li> 3: output warning/info/log/error, with timestamp and classname.
 *
 * @author yiziwu@google.com (Yizi Wu)
 */
public class Logger {
  /**
   * A printer instance for info output.
   * If it's not set, by default do nothing.
   * @private
   */
  private static var printer:IPrinter = null;
  
  
  /**
   * Verbose parameter that controls the output level.
   */
  private static var verbose:int = 0;
  
  
  /**
   * The class reference for the current logger instance.
   */
  private var classInstance:Class;
  
  
  /**
   * Static initializer for the Logger.
   * @param printer The printer instance for the Logger in the app.
   * @param verbose The verbose param, set to 1 to log the warnings.
   */
  public static function initialize(printer:IPrinter = null,
                                    verbose:int = 0):void {
    Logger.printer = printer;
    Logger.verbose = verbose;
  }
  
  
  /**
   * Constructor for the logger.
   * @param theClass The class of the logger locates and is logging.
   */
  public function Logger(theClass:Class = null) {
    classInstance = theClass;
  }
  
  
  /**
   * Gets the name of the class where this logger lives in. Use verbose or
   * forced paramter to control the output.
   * @param forced True to return class name no matter what verbose is.
   * @return The short name of the class.
   */
  private function getClassName(forced:Boolean = false):String {
    return (forced || verbose > 1) ? getShortClassName(classInstance) : null;
  }
  
  
  /**
   * Internal print function.
   * @param text Text to print.
   * @private
   */
  private function print(text:String):void {
    if (printer != null) {
      printer.print(text);
    }
  }
  
  
  /**
   * Prints multiple inputs as text.
   * @param objs Objects to be printed.
   */
  public function info(...objs:Array):void {
    if (verbose < 1) return;
    var str:String = objs.join(",");
    print(inspect(str, "I", getClassName()));
  }
  
  
  /**
   * Logs as WARNNING for the message for verbose >= 3.
   * @param obj The object to be printed.
   */
  public function warning(obj:Object):void {
    if (verbose < 3) return;
    print(inspect(obj != null ? obj.toString() : null, "W", getClassName()));
  }
  
  
  /**
   * Logs as ERROR for the error object.
   * @param error The error object to be printed.
   */
  public function error(error:Error):void {
    print(inspect(error, "E", getClassName()));
  }
  
  
  /**
   * Logs down the detail of an object. Always output class name for log() no
   * metter what verbose is set.
   * @param obj The object to be printed.
   */
  public function log(obj:Object):void {
    print(inspect(obj, "L", getClassName(true)));
  }
  
  
  /**
   * An object inspector function. It's very useful to look at values inside
   * a non-primitive target. It recursively goes into each public fields in
   * the input object.
   * @param obj The object to be inspected.
   * @param prefix Prefix text for each output item.
   * @param className The name of the class where the logger lived in.
   * @return The output string.
   * @private
   */
  internal static function inspect(obj:Object,
                                   prefix:String,
                                   className:String = null):String {
    var buffer:Array = [];
    buffer.push(prefix, " ");
    if (verbose > 1) {
      buffer.push("[", new Date().toLocaleTimeString(), "] ");
    }
    if (className != null) {
      buffer.push("[", className, "]\n> ");
    }
    var inspect:Function = function(obj:Object,
                                    buffer:Array,
                                    prefix:String,
                                    depth:int):void {
      depth++;
      if (obj == null) {
        buffer.push("NULL\n");
      } else if (obj is String ||
                 obj is Boolean ||
                 obj is Number ||
                 obj is Date) {
        buffer.push(obj, "\n");
      } else if (obj is Function) {
        buffer.push("--\n");
      } else if (obj is Error) {
        var err:Error = obj as Error;
        buffer.push("#", err.errorID, ":", err.message, "\n");
      } else {
        buffer.push("<", getShortClassName(obj), ">\n");
  
        if (depth > 3) {
          buffer.push(prefix, "\t...\n");
          return;
        }
  
        var keys:Array = [];
        var descObj:XML = describeType(obj);
  
        for each (var element:XML in descObj.elements()) {
          if (element.name() == "variable" ||
              element.name() == "constant" ||
              element.name() == "accessor" ||
              (element.name() == "method" &&
               element.@declaredBy[0].toString() != "Object")) {
            keys.push(element.@name[0].toString());
          }
        }
  
        try {
          for (var key:String in obj) {
            keys.push(key);
          }
        } catch (e:Error) {
          // May throw error from not-fully-implemented proxy class.
          buffer.push(prefix, "\t<Error>\t : ", e.message, "\n");
        }
          
        
        keys = keys.sort();
  
        for each (key in keys) {
          buffer.push(prefix, "\t", key, "\t");
  
          var value:* = null;
          try {
            value = obj[key];
            buffer.push("<", getShortClassName(value), ">\t : ");
          } catch (e:Error) {
            // obj[key] may throw error from non-implemented property.
            buffer.push("<Error>\t : ", e.message);
          }
  
          inspect(value, buffer, prefix + "\t", depth);
        }
      }
    };
    inspect(obj, buffer, "", 0);
    return buffer.join("");
  }
  
  
  /**
   * Gets the short class name for the given object.
   * @param value The object value.
   * @return The short class name.
   * @private
   */
  internal static function getShortClassName(value:*):String {
    var name:String = getQualifiedClassName(value);
    name = name.replace(/.+\:\:/g, "");
  
    // Some compiler results in '*' for a function variable, while some
    // compiler results in 'Function-###' instead.
    if (name == "*" || name.indexOf("Function-") == 0) {
      name = "Function";
    }
    return name;
  }
}
}
