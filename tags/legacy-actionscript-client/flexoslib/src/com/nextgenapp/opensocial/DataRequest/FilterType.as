package opensocial.DataRequest
{
	/**
	 * The filter values used to filter the set of people returned by a fetch people request.  
	 * @author Joseph Estrada
	 * 
	 */	
	public class FilterType
	{		
		/**
		 * Retrieves all friends. 
		 */		
		public static const ALL:String = "ALL";
		/**
		 * Retrieves all friends with any data for this application. 
		 */		
		public static const HAS_APP:String = "HAS_APP";

	}
}