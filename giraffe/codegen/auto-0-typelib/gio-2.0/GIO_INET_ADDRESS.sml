signature GIO_INET_ADDRESS =
  sig
    type 'a class
    type socket_family_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val newAny : socket_family_t -> base class
    val newFromString : string -> base class
    val newLoopback : socket_family_t -> base class
    val equal :
      'a class
       -> 'b class
       -> bool
    val getFamily : 'a class -> socket_family_t
    val getIsAny : 'a class -> bool
    val getIsLinkLocal : 'a class -> bool
    val getIsLoopback : 'a class -> bool
    val getIsMcGlobal : 'a class -> bool
    val getIsMcLinkLocal : 'a class -> bool
    val getIsMcNodeLocal : 'a class -> bool
    val getIsMcOrgLocal : 'a class -> bool
    val getIsMcSiteLocal : 'a class -> bool
    val getIsMulticast : 'a class -> bool
    val getIsSiteLocal : 'a class -> bool
    val getNativeSize : 'a class -> LargeInt.int
    val toString : 'a class -> string
    val familyProp :
      {
        get : 'a class -> socket_family_t,
        new : socket_family_t -> 'a class Property.t
      }
    val isAnyProp : {get : 'a class -> bool}
    val isLinkLocalProp : {get : 'a class -> bool}
    val isLoopbackProp : {get : 'a class -> bool}
    val isMcGlobalProp : {get : 'a class -> bool}
    val isMcLinkLocalProp : {get : 'a class -> bool}
    val isMcNodeLocalProp : {get : 'a class -> bool}
    val isMcOrgLocalProp : {get : 'a class -> bool}
    val isMcSiteLocalProp : {get : 'a class -> bool}
    val isMulticastProp : {get : 'a class -> bool}
    val isSiteLocalProp : {get : 'a class -> bool}
  end
