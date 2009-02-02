package com.nextgenapp.opensocial
{
	/**
	 * Serializable - Interface which helps manage version changes
	 */
	public interface Serializable
	{
		/**
		 * write - Write the object
		 * 
		 * @return Object - Object to which to write to
		 */
		 function write():Object;
		 
		/**
		 * read - Read the object
		 * 
		 * @param obj - Object to which to read
		 * 
		 * @return Boolean - true if successful, false otherwise
		 */
		 function read(obj:Object):Boolean;
	}
}