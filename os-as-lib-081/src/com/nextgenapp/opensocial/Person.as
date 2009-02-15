/**
 * Field - Person field for opensocial
 * 
 * @author Aaron Tong
 */
package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.Name.Field;
	import com.nextgenapp.opensocial.Person.Field;
	
	public class Person extends OSResource
	{
		
		public static const Field:Class = com.nextgenapp.opensocial.Person.Field;
		
		/**
		 * Owner flag specifying whether this person is the owner of the content. 
		 */		
		private var _isOwner:Boolean;
		/**
		 *  Viewer flag specifying whether this person is the viewer of the content.
		 */		
		private var _isViewer:Boolean;
		
		/**
		 * Constructs a person object. 
		 * @param optParams Optional person fields.
		 * @param isOwner Owner flag.
		 * @param isViewer Viewer flag.
		 * 
		 */		
		public function Person(optParams:Object, isOwner:Boolean, isViewer:Boolean)
		{
			super(optParams);
			_isOwner = isOwner;
			_isViewer = isViewer;
		}
		
		/**
		 * Returns person id. 
		 * @return Person id.
		 * 
		 */		
		public function getId():String {
			return String(this.getField(com.nextgenapp.opensocial.Person.Field.ID));
		}
		
		/**
		 * Returns person display name. 
		 * @return Person's display name. 
		 * 
		 */		
		public function getDisplayName():String {
			var displayName:String = "";
			var name:Name = this.getField(com.nextgenapp.opensocial.Person.Field.NAME);
			var givenName:String = name.getField(com.nextgenapp.opensocial.Name.Field.GIVEN_NAME);
			var familyName:String =  name.getField(com.nextgenapp.opensocial.Name.Field.FAMILY_NAME);
			var unstructured:String = name.getField(com.nextgenapp.opensocial.Name.Field.UNSTRUCTURED);
			var additionalName:String = name.getField(com.nextgenapp.opensocial.Name.Field.ADDITIONAL_NAME);
			
			// different container may return givenName, familyName, or unstructured (eg. myspace returned unstructured)
			// the priority is - givenName, familyName, unstructured, additionalname,
			if (givenName) {
				displayName = givenName;
				if (familyName) {
					displayName += (" " + familyName);
				}
			} else if (familyName) {
				displayName = familyName;
			} else if (unstructured) {
				displayName = unstructured;
			} else if (additionalName) {
				displayName = additionalName;
			}
			return displayName;
		}
		
		/**
		 * Checks if this person is the owner. 
		 * @return True if this person is the owner, false otherwise.
		 * 
		 */		
		public function isOwner():Boolean {
			return _isOwner;
		}
		
		/**
		 * Checks if this person is the viewer. 
		 * @return True if this person is the viewer, false otherwise.
		 * 
		 */		
		public function isViewer():Boolean {
			return _isViewer
		}		
		
		/**
		 * convert each field to the appropriate type.    
		 */
		public override function read(obj:Object):Boolean {
			for (var propName:String in obj) {
				var propValue:* = obj[propName];
				switch (propName) {
				case com.nextgenapp.opensocial.Person.Field.NAME:
					var name:Name = new Name();
					name.read(propValue);
					_fields[propName] = name;
					break;
				case com.nextgenapp.opensocial.Person.Field.GENDER:
					if ( propValue == null || propValue == "undefined" ||
						 propValue == undefined ){
						 	propValue = new Object();
						 	propValue.key = "Unknown";
						 	propValue.displayValue = "Unknown";
					}
					var gender:Enum = new Enum(propValue.key, propValue.displayValue);
					_fields[propName] = gender;
					break;
				default:
					_fields[propName] = obj[propName];
					break;
				}
				
			}
			return true;
		}
	}
}