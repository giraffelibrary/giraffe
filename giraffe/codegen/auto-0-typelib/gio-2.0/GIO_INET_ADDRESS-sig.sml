signature GIO_INET_ADDRESS =
  sig
    type 'a class
    type socket_family_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val newAny : socket_family_t -> base class
    val newFromString : string -> base class option
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
    val familyProp : ('a class, unit -> socket_family_t, unit, socket_family_t -> unit) Property.t
    val isAnyProp : ('a class, unit -> bool, unit, unit) Property.t
    val isLinkLocalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isLoopbackProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMcGlobalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMcLinkLocalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMcNodeLocalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMcOrgLocalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMcSiteLocalProp : ('a class, unit -> bool, unit, unit) Property.t
    val isMulticastProp : ('a class, unit -> bool, unit, unit) Property.t
    val isSiteLocalProp : ('a class, unit -> bool, unit, unit) Property.t
  end
