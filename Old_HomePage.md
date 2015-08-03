There is a new Opensocial Actionscript Library at http://code.google.com/p/opensocial-as3-client.  We are consolidating with them.

Actionscript/Flex/Flash library for accessing Opensocial API.  The API mimics Opensocial Javascript API.

The code is opensourced and hosted at:
http://code.google.com/p/opensocial-actionscript-client

The download is located at:
http://code.google.com/p/opensocial-actionscript-client/downloads/list

New update are shown at:
http://code.google.com/p/opensocial-actionscript-client/updates/list

Facebook is not part of Opensocial.  If you are looking for Facebook Actionscript API.  Please see FBAS:
http://code.google.com/p/fbas

# Current status #
2009/02/17.  Active development.

2009/02/11.  Just started.  We will send out announcement when it reaches certain milestone.  In the meantime, feel free to browse the current code using svn or http://code.google.com/p/opensocial-actionscript-client/source/browse/

Only newFetchPersonRequest is implemented for Orkut and Myspace.  Other API calls to come soon.



# What is opensocial-actionscript-client api #

Opensocial-actionscript-client is an Opensocial library for Actionscript/Flex/Flash.  This is an opensource library.  It allows Actionscript/Flex/Flash client to access Opensocial Containers through the Opensocial API.  Opensocial Containers are social networks such as Myspace, Orkut, Hi5, 51.com, netLog, Hyve, etc.


If you are wondering what Opensocial is, you can take a look at http://code.google.com/apis/opensocial/ or http://www.opensocial.org.

# A Little More Detail About the Architecture #
The library uses Opensocial Javascript API, not REST API.  It was a careful and necessary decision to go for Javascript API for the following reasons:
  1. Some containers have a closed-off crossdomain.xml (which means Flash cannot connect to their server)
  1. Not all containers support REST API yet.
These are restrictions that cannot be overcome, unless the containers (the social networks sites) change their policies.


# Current Opensocial Version #
Currently, the API uses Opensocial 0.81, the latest version at the moment.


# Contribution/Feedback #
You are welcome to contribute or add to the library.  It is opensource!  :)
If you work for one of the Opensocial social networks, we would love to hear your opinions and comments!


http://api.ning.com/files/chwE7fbkJ5D1q8NSzNCYJzzCqOiuo3xYyToZCsYuY0SViOKQ7EG-3UUv4KFSxOMACbIzs3oWtD076*cbEL-*ABd9hCO0p7Al/opensocialsitelogo1.png?width=288&height=70&xn_auth=no&type=png