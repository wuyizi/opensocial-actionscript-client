package opensocial {
	/**
	 * The priorities a create activity request can have. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class CreateActivityPriority {
		/**
		 * If the activity is of high importance, it will be created even if this requires asking the user for permission. This may cause the container to open a user flow which may navigate away from your gagdet.
		 */		
		public static const HIGH:String = "HIGH";
		/**
		 * If the activity is of low importance, it will not be created if the user has not given permission for the current app to create activities. With this priority, the requestCreateActivity call will never open a user flow.
		 */		
		public static const LOW:String = "LOW";
	}
}