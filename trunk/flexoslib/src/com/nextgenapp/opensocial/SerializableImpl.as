package com.nextgenapp.opensocial
{
	/**
	 * General base implementation of serializable. 
	 * may be used as baseclass for other data class that need to 
	 * convert itself back and forth to a a generic Object.  
	 */
	public class SerializableImpl implements Serializable
	{
		public function SerializableImpl()
		{
		}

		/**
		 * convert this object to a generic object with the same properties.  
		 */
		public function write():Object
		{
			// this may only work fordynamic object.  we may need to use describeType() instead.  
			var obj:Object = new Object();
			for (var propName:String in this) {
				obj[propName] = this[propName];
			}
			return obj;
		}
		
		/**
		 * read this generic object's properties into this object.  
		 */
		public function read(obj:Object):Boolean
		{
			for (var propName:String in obj) {
				this[propName] = obj[propName];
			}
			return true;
		}
		
	}
}