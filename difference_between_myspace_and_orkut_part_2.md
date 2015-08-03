# Difference between MySpace and Orkut – part2 #

Person object returned by JavaScript API (from newFetchPersonRequest()) have different types for properties.

## Orkut ##
The Person object's NAME property contains an opensocial.Name object.  GENDER property contains an opensocial.Enum object.

## MySpace ##
The Person object returned by MySpace JavaScript API have string for NAME and GENDER.