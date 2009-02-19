/**
 * IdSpec - opensocial representation of IdSpec
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.idSpec.Field;
	import com.nextgenapp.opensocial.idSpec.PersonId;
	
	public class IdSpec extends OSResource
	{
		public static var Field:Class = com.nextgenapp.opensocial.idSpec.Field;
		public static var PersonId:Class = com.nextgenapp.opensocial.idSpec.PersonId;
		
		/**
		 * IdSpec
		 * 
		 * @param user   The USER_ID field can be either be the OWNER and VIEWER constants of PersonId, 
		 * 				 an OpenSocial ID string, or an array of OpenSocial ID strings if you're looking to 
		 *               access information for two or more specific users.
		 * @param group  the GROUP_ID field can contain either "FRIENDS" or "SELF" in GroupId
		 * @param dist   the network distance
		 */
		public function IdSpec(user:Object, group:Object, dist:Object=null)
		{
			this.setField(com.nextgenapp.opensocial.IdSpec.Field.USER_ID, user);
			this.setField(com.nextgenapp.opensocial.IdSpec.Field.GROUP_ID, group);
			this.setField(com.nextgenapp.opensocial.IdSpec.Field.NETWORK_DISTANCE, dist);
		}

	}
}