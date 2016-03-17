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
    val familyProp : ('a class, socket_family_t, socket_family_t) Property.readwrite
    val isAnyProp : ('a class, bool) Property.readonly
    val isLinkLocalProp : ('a class, bool) Property.readonly
    val isLoopbackProp : ('a class, bool) Property.readonly
    val isMcGlobalProp : ('a class, bool) Property.readonly
    val isMcLinkLocalProp : ('a class, bool) Property.readonly
    val isMcNodeLocalProp : ('a class, bool) Property.readonly
    val isMcOrgLocalProp : ('a class, bool) Property.readonly
    val isMcSiteLocalProp : ('a class, bool) Property.readonly
    val isMulticastProp : ('a class, bool) Property.readonly
    val isSiteLocalProp : ('a class, bool) Property.readonly
  end
