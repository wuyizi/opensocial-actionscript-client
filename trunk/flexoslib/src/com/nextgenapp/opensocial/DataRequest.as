package opensocial
{
	/**
	 * Creates an item to request social information from the container. This includes data for 
	 * friends, profiles, app data, and activities. All apps that require access to people 
	 * information should send a DataRequest. 
	 * @author Joseph Estrada
	 * 
	 */	
	public class DataRequest implements IOSDataRequest
	{
		
		public static const FilterType:Class = opensocial.DataRequest.FilterType;
		public static const Group:Class = opensocial.DataRequest.Group;
		public static const PeopleRequestFields:Class = opensocial.DataRequest.PeopleRequestFields;
		public static const PersonId:Class = opensocial.DataRequest.PersonId;
		public static const SortOrder:Class = opensocial.DataRequest.SortOrder;
		
		/**
		 * DataRequest Constructor.
		 * 
		 */		
		public function DataRequest()
		{
			super();
		}

		/**
		 * Adds an item to fetch (get) or update (set) data from the server. A single DataRequest 
		 * object can have multiple items. As a rule, each item is executed in the order it was 
		 * added, starting with the item that was added first. However, items that can't collide 
		 * might be executed in parallel. 
		 * @param request Specifies which data to fetch or update.
		 * @param opt_key A key to map the generated response data to.
		 * 
		 */		
		public function add(request:Object, opt_key:String = null):void
		{
			
		}	
		
		/**
		 * Creates an item to request an activity stream from the server.  When processed, returns an object where "activities" is a Collection<Activity> object.  
		 * @param idSpec An ID reference to fetch activities for.
		 * @param optParams Map<opensocial.DataRequest.ActivityRequestFields, Object> Additional parameters  to pass to the request.
		 * @return Request Object.
		 * 
		 */		
		public function newFetchActivitiesRequest(idSpec:String, optParams:Object = null):Object
		{
			return null;
		}
		
		/**
		 * Creates an item to request global app data. When processed, returns a Map<String, String> object. 
		 * @param keys Array<String>, String The keys you want data for; this can be an array of key names, a single key name, or "*" to mean "all keys".
		 * @return A request object.
		 * 
		 */		
		public function newFetchGlobalAppDataRequest(keys:*):Object {
			return null;	
		}
		
		/**
		 * Creates an item to request instance app data. When processed, returns a Map<String, String> object. 
		 * @param keys Array<String>, String
		 * @return A request object.
		 * 
		 */		
		public function newFetchInstanceAppDataRequest(keys:*):Object {
			return null;
		}
		
		/**
		 * Creates an item to request friends from the server. When processed, returns a Collection <Person> object. 
		 * @param idSpec Array<String>, String An ID, array of IDs, or a group reference used to specify which people to fetch.
		 * @param optParams Map<opensocial.DataRequest.PeopleRequestFields, Object> Additional params  to pass to the request 
		 * @return A request object.
		 * 
		 */		
		public function newFetchPeopleRequest(idSpec:*, optParams:Object = null):Object
		{
			return null;
		}
		
		/**
		 * Creates an item to request app data for the given people. When processed, returns a Map< PersonId>, Map<String, String>> object. 
		 * @param idSpec Array<String>, String An ID, array of IDs, or a group reference; the supported keys are VIEWER, OWNER, OWNER_FRIENDS, or a single ID within one of those groups
		 * @param keys Array<String>, String The keys you want data for; this can be an array of key names, a single key name, or "*" to mean "all keys"
		 * @return A request object. 
		 * 
		 */		
		public function newFetchPersonAppDataRequest(idSpec:*, keys:*):Object
		{
			return null;
		}
		
		/**
		 * Creates an item to request a profile for the specified person ID. When processed, returns a Person object. 
		 * @param id The ID of the person to fetch; can be the standard person ID  of VIEWER or OWNER.
		 * @param optParams Map<opensocial.DataRequest.PeopleRequestFields, Object> dditional parameters  to pass to the request; this request supports PROFILE_DETAILS.
		 * @return A request object.
		 * 
		 */		
		public function newFetchPersonRequest(id:String, optParams:Object = null):Object
		{
			return null;
		}
		
		/**
		 *  Creates an item to request an update of an app instance field from the server. When processed, does not return any data.
		 * @param key The name of the key
		 * @param value The value
		 * @return A request object
		 * 
		 */		
		public function newUpdateInstanceAppDataRequest(key:String, value:String):Object {
			return null;
		}
		
		/**
		 * Creates an item to request an update of an app field for the given person. When processed, does not return any data.
		 * @param id The ID of the person to update; only the special VIEWER ID is currently allowed.
		 * @param key The name of the key.
		 * @param value The value.
		 * @return A request object.
		 * 
		 */		
		public function newUpdatePersonAppDataRequest(id:String, key:String, value:String):Object
		{
			return null;
		}
		
		/**
		 * Sends a data request to the server in order to get a data response. Although the server may optimize these requests, they will always be executed as though they were serial. 
		 * @param callback The function to call with the data response  generated by the server
		 * 
		 */		
		public function send(callback:Function):void 
		{
			
		}
		
	}
}
