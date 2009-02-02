package opensocial.DataRequest
{
	/**
	 * The sort orders available for ordering person objects. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class SortOrder
	{
		/**
		 * When used will sort people alphabetically by the name field.  
		 */		
		public static const NAME:String = "NAME";
		/**
		 * When used will sort people by the container's definition of top friends.
		 */
		public static const TOP_FRIENDS:String = "TOP_FRIENDS";
	}
}