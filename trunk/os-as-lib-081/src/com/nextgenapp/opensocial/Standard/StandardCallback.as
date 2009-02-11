/**
 * Contains the callback functions for DataRequest
 * 
 * @author Aaron Tong & sol wu
 */
package com.nextgenapp.opensocial.Standard
{
	import com.nextgenapp.opensocial.Person;
	import com.nextgenapp.opensocial.IdSpec.PersonId;
	import com.nextgenapp.opensocial.DataResponse;
	import com.nextgenapp.opensocial.ResponseItem;
	
	public class StandardCallback
	{
		public static const FETCH_PERSON:int = 0;
		
		public static const FETCH_PEOPLE:int = 1;
		
		public static const FETCH_ACTIVITIES:int = 2;
		
		public static const FETCH_PERSON_APP_DATA:int = 3;
		
		public static const REMOVE_PERSON_APP_DATA:int = 4;
		
		public static const UPDATE_PERSON_APP_DATA:int = 5;
		
		public static var regMap:Object = new Object();
		
		/**
		 * newFetchActivitiesCallback - Callback function for newFetchActivitiesRequest
		 * 
		 * @param obj - JS returned object
		 */
		public static function newFetchActivitiesCallback(obj:Object):void {
			//not implemented
		}
				
		/**
		 * newFetchPeopleCallback - Callback function for newFetchPeopleRequest
		 * 
		 * @param obj - JS returned object
		 */
		public static function newFetchPeopleCallback(obj:Object):void {
			//not implemented
		}

		/**
		 * newFetchPersonAppDataCallback - Callback function for newFetchPersonAppDataRequest
		 * 
		 * @param obj - JS returned object
		 * @return DataResponse - DataResponse
		 */		
		public static function newFetchPersonAppDataCallback(obj:Object):void {
			//not implemented
		}

		/**
		 * newFetchPersonCallback - Callback function for newFetchPersonRequest
		 * 
		 * @param obj - JS returned object
		 */		
		public static function newFetchPersonCallback(obj:Object):void {
			var p:Person = new Person(null, obj.isOwner, obj.isViewer);
			//read the object's data
			p.read(obj.data);
			//create an map of data response
			var responseItems:Object = new Object();
			//create a response item
			var r:ResponseItem = new ResponseItem(null, p);
			if ( p.isOwner()){
				responseItems[PersonId.OWNER] = r;
			}
			if  ( p.isViewer() ) {
				responseItems[PersonId.VIEWER] = r;
			}
			//create the DataResponse
			var dr:DataResponse = new DataResponse(responseItems, false);
			//check to see if there is any registration for this object
			if ( regMap[StandardCallback.FETCH_PERSON] != null ){
				//call the callback
				var func:Function = regMap[StandardCallback.FETCH_PERSON] as Function;
				//remove the registration after the call
				regMap[StandardCallback.FETCH_PERSON] = null;
				func(dr);
			}else {
				//no one register to retrieve this object.
				trace("*** Error. No one register to receive this object");
			}
		}		
		
		/**
		 * newRemovePersonAppDataCallback - Callback function for newRemovePersonAppDataRequest
		 * 
		 * @param obj - JS returned object
		 */
		public static function newRemovePersonAppDataCallback(obj:Object):void {
			//not implemented
		}
		
		/**
		 * newUpdatePersonAppDataCallback - Callback function for newUpdatePersonAppDataRequest
		 * 
		 * @param obj - JS returned object
		 */		
		public static function newUpdatePersonAppDataCallback(obj:Object):void {
			//not implemented
		}
		
		/**
		 * register - Registers a callback with this callback
		 * 
		 * @param type - type of callback to register with
		 */
		public static function register(type:int, callbackFunc:Function):void {
			regMap[type] = callbackFunc;
		}
		
		/**
		 * deregister - Removes the callback registration
		 * 
		 * @param type - type of callback
		 */
		public static function deregister(type:int):void {
			regMap[type] = null;
		}

	}
}