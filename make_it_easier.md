# What would make things easier #
If javascript api return object with properties.  Such that it does not always use getField() or setField().


How would this help?  This means we can pass back the object from javascript to actionscript directly, instead of requiring us to translate it on javascript side.  Right now, we have to call getField() on javascript repeatedly and translate it to the object's property before passing it back to actionscript.