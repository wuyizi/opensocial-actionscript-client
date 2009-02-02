package com.nextgenapp.opensocial
{
	import com.nextgenapp.opensocial.Person.Field;
	/**
	 * Base interface for all person objects. 
	 * @author Joseph Estrada
	 * 
	 */	
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
			return String(this.getField(com.nextgenapp.opensocial.Person.Field.NAME));
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
	}
}