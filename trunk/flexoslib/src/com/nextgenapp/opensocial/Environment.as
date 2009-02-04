/**
 * Environment - opensocial Environment
 *
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	
	public class Environment
	{
		/**
		 * Returns the current domain — for example, "orkut.com" or "myspace.com".  
		 * @return 
		 * 
		 */		
		public function getDomain():String {
			return null;
		}
		
		/**
		 * Returns true if the specified field is supported in this container on the given object type. 
		 * @param objectType The object type to check for the field
		 * @param fieldName The name of the field to check for.
		 * @return rue if the field is supported on the specified object type.
		 * 
		 */				
		public function supportsField(objectType:String, fieldName:String):Boolean {
			throw new Error("Not implemented");
		}
	}
}