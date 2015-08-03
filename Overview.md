Actionscript/Flex/Flash library for accessing OpenSocial API.  Connect to Opensocial API by calling OpenSocial JavaScript API from Actionscript via ExternalInterface.

The code is opensourced and hosted at:
http://code.google.com/p/opensocial-actionscript-client

The download is located at:
http://code.google.com/p/opensocial-actionscript-client/downloads/list

New update are shown at:
http://code.google.com/p/opensocial-actionscript-client/updates/list



# Current status #
2009/02/11.  Just started.  We will send out announcement when it reaches certain milestone.  In the meantime, feel free to browse the current code using svn or http://code.google.com/p/opensocial-actionscript-client/source/browse/

Only newFetchPersonRequest is implemented for Orkut and MySpace.  Other API calls to come soon.



# What is opensocial-actionscript-client api #

Opensocial-actionscript-client is an OpenSocial library for Actionscript/Flex/Flash.  This is an opensource library.  It allows Actionscript/Flex/Flash client to access OpenSocial API.


# A Little More Detail About the Architecture #
The library uses Opensocial Javascript API, not REST API.  It was a careful and necessary decision to go for Javascript API for the following reasons:
1.	Some containers have a closed-off crossdomain.xml (which means Flash cannot connect to their server)
2.	Not all containers support REST API yet
These are restrictions that cannot be overcome, unless the containers (the social networks sites) change their policies.


# Current OpenSocial Version #
Currently, the API uses OpenSocial 0.8, the latest version at the moment.


# Contribution/Feedback #
You are welcome to contribute or add to the library.  It is opensource!  :)