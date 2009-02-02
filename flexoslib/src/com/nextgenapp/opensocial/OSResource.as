/**
 * Copyright 2008 Fox Interactive Media. 
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except 
 * in compliance with the License. You may obtain a copy of the License at 
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in 
 * writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific 
 * language governing permissions and limitations under the License.
 */
package com.nextgenapp.opensocial
{
	import flash.utils.getQualifiedClassName;
	
	/**
	 * Centralizes the getField and setField operations for opensocial resources. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class OSResource
	{
		/**
		 * Holds all the fields
		 */
		protected var _fields:Object;
		
		/**
		 * Holds the current version
		 */
		protected var currentVersion:String = "0.81";
		
		/**
		 * OSResource constructor. 
		 * @param optFields Optional field set for resource. 
		 * 
		 */		
		public function OSResource(optFields:Object = null)
		{
			_fields = optFields == null ? {} : optFields;
		}
		
		/**
		 * Gets the field value mapped by key or null if the key does not map to a value. 
		 * @param key The key to get a value for.
		 * @return The value.
		 * 
		 */		
		public function getField(key:String):* {
			return _fields[key];
		}
		
		/**
		 * Sets or updates the value specified by key. 
		 * @param key The key to set a value for.
		 * @param value The value to set.
		 * 
		 */		
		public function setField(key:String, value:*):void {
			_fields[key] = value;
		}
		
		/**
		 * Checks if a value exists for the specified key. 
		 * @param key Key to search for value.
		 * @return True if the value exists; otherwise, false.
		 * 
		 */		
		public function exists(key:String):Boolean {
			return !!getField(key);
		}
		
		/**
		 * Returns the collection of fields. 
		 * @return Map<String, Object>
		 * 
		 */		
		public function getFields():Object {
			return _fields;
		}
		
		/**
		 * Constructs a string representation of this OSResource.
		 * @return The string representation.
		 * 
		 */		
		public function toString():String {
			var result:String = getQualifiedClassName(this) + "\n{\n";
			for(var key:String in _fields) 
				result += key + ": " + _fields[key].toString() + "\n";
			return result + "}\n";
		}

	}
}