package opensocial {
	/**
	 * Collection of multiple objects with useful accessors. May also represent subset of a larger collection (for example, page 1 of 10) and contain information about the larger collection.
	 *  
	 * @author Joseph Estrada
	 * 
	 */	
	public class Collection {
		
		/**
		 * Items set for this collection. 
		 */		
		private var _items:Array;
		/**
		 * Offset of this collection within larger resultset. 
		 */		
		private var _offset:int;
		/**
		 * Size of larger result set that this collection belongs.
		 */		
		private var _totalSize:int;
		
		/**
		 * Collection constructor.   
		 * @param items Items in collection.
		 * @param offset Offset of this collection within larger resultset.
		 * @param totalSize Total size of the collection.
		 * 
		 */		
		public function Collection(items:Array, offset:int, totalSize:int) {
			this._items = items || [];
			this._offset = offset || 0;
			this._totalSize = totalSize || this._items.length;
		}
		
		/**
		 * Finds the entry with the given ID value, or returns null if none is found.
		 * @param The ID to look for.
		 * @return Item object if found; otherwise, null.
		 * 
		 */		
		public function getById(id:String):* {
			for(var i:int = 0; i < _items.length; i++) 
				//Check for matching id and return if found.
				if(_items[i].getId  && _items[i].getId() == id)
					return _items[i];
			//Return null if matching item is not found.
			return null;
		}
		
		/**
		 * Gets the size of this collection, which is equal to or less than the total size of the result.
		 * @return Size of collection.
		 * 
		 */		
		public function size():int {
			return _items.length;
		}
		
		/**
		 * Gets the total size of the larger result set that this collection belongs to.
		 * @return The total size of the result.
		 * 
		 */		
		public function getTotalSize():int {
			return _totalSize;
		}
		
		/**
		 * Executes the provided function once per member of the collection, with each member in turn as the parameter to the function.
		 * 
		 * @param func The function to call with each collection entry.
		 * */
		public function each(func:Function):void {
			for(var i:int = 0; i < _items.length; i++)
				func.call(this, _items[i]);
		}
		
		/**
		 * Gets the offset of this collection within a larger result set.
		 * @return Offset of collection.
		 * 
		 */		
		public function getOffset():int {
			return _offset;
		}
		
		/**
		 * Returns an array of all the objects in this collection.
		 * @return The values in this collection.
		 * 
		 */		
		public function asArray():Array {
			return _items;	
		}
		
	}
}