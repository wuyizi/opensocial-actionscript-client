﻿/**
 * IDataRequest - Opensocial Interface to DataRequest 
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.DataRequest.DataRequestFields;
	import com.nextgenapp.opensocial.DataRequest.FilterType;
	import com.nextgenapp.opensocial.DataRequest.PeopleRequestFields;
	import com.nextgenapp.opensocial.DataRequest.SortOrder;
	
	
	public class DataRequest 
	{
		public static const PeopleRequestFields:Class = com.nextgenapp.opensocial.DataRequest.PeopleRequestFields;
		public static const DataRequestFields:Class = com.nextgenapp.opensocial.DataRequest.DataRequestFields;
		public static const FilterType:Class = com.nextgenapp.opensocial.DataRequest.FilterType;
		public static const SortOrder:Class = com.nextgenapp.opensocial.DataRequest.SortOrder;
		
		/**
		 * Adds an item to fetch (get) or update (set) data from the server. A single DataRequest 
		 * object can have multiple items. As a rule, each item is executed in the order it was 
		 * added, starting with the item that was added first. However, items that can't collide 
		 * might be executed in parallel. 
		 * @param request Specifies which data to fetch or update.
		 * @param opt_key A key to map the generated response data to.
		 * 
		 */		
		public function add(request:Object, opt_key:String = null):void {
			throw new Error("Not implemented");
		}
		
		/**
		 * Sends a data request to the server in order to get a data response. Although the server may optimize these requests, they will always be executed as though they were serial. 
		 * @param callback The function to call with the data response  generated by the server
		 * 
		 */		
		public function send(callback:Function):void {
			throw new Error("Not implemented");
		}
		
		/**
		 * Creates an item to request an activity stream from the server.  When processed, returns 
		 * an object where "activities" is a Collection<Activity> object.  
		 * @param idSpec An ID reference to fetch activities for.
		 * @param optParams Map<opensocial.DataRequest.ActivityRequestFields, Object> Additional parameters  to pass to the request.
		 * @return Request Object.
		 * 
		 */	
		public function newFetchActivitiesRequest(idSpec:IdSpec, optParams:Object = null/*Map<opensocial.DataRequest.PeopleRequestFields, Object>*/):Object {
			throw new Error("Not implemented");
		}
				
		/**
		 * Creates item to request friends from the server.
		 * @param idSpec ID, array of IDs, or group reference to specify which people to fetch.
		 * @param optParams Params to pass to requets.
		 * @return Request object.
		 */
		public function newFetchPeopleRequest(idSpec:IdSpec, optParams:Object = null/*Map<opensocial.DataRequest.PeopleRequestFields, Object>*/):Object {
			throw new Error("Not implemented");
		}

		/**
		 * Creates an item to request app data for the given people. When processed, returns a Map< PersonId>, Map<String, String>> object. 
		 * @param idSpec IdSpec, An IdSpec used to specify which people to fetch. See also IdSpec. 
		 * @param keys Array<String>, String The keys you want data for; this can be an array of key names, a single key name, or "*" to mean "all keys"
		 * @param optParam Additional params  to pass to the request 
		 * @return A request object. 
		 * 
		 */		
		public function newFetchPersonAppDataRequest(idSpec:IdSpec, keys:Array, optParam:Object):Object {
			throw new Error("Not implemented");
		}

		/**
		 * Creates an item to request a profile for the specified person ID. When processed, returns a Person object. 
		 * @param id The ID of the person to fetch; can be the standard person ID  of VIEWER or OWNER.
		 * @param optParams Map<opensocial.DataRequest.PeopleRequestFields, Object> dditional parameters  to pass to the request; this request supports PROFILE_DETAILS.
		 * @return A request object.
		 * 
		 */		
		public function newFetchPersonRequest(idSpec:String, optParams:Object = null/*Map<opensocial.DataRequest.PeopleRequestFields, Object>*/):Object {
			throw new Error("Not implemented");
		}		
		
		/**
		 * Creates an item to request an update of an app field for the given person. When processed, does not return any data. 
		 * @param id The ID of the person to update; only the special VIEWER ID is currently allowed. 
		 * @param key The keys you want to delete from the datastore; this can be an array of key names, a single key name, or "*" to mean "all keys"  
		 * @return Object A request object 
		 */
		public function newRemovePersonAppDataRequest(id:String, key:Array):Object {
			throw new Error("Not implemented");
		}
		
		/**
		 * Creates an item to request an update of an app field for the given person. When processed, does not return any data.
		 * @param id The ID of the person to update; only the special VIEWER ID is currently allowed.
		 * @param key The name of the key.
		 * @param value The value.
		 * @return A request object.
		 * 
		 */		
		public function newUpdatePersonAppDataRequest(id:String, key:String, value:String):Object {
			throw new Error("Not implemented");
		}
	}
}