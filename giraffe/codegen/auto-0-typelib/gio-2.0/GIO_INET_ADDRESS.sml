signature GIO_INET_ADDRESS =
  sig
    type 'a class_t
    type socketfamily_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val newAny : socketfamily_t -> base class_t
    val newFromString : string -> base class_t
    val newLoopback : socketfamily_t -> base class_t
    val equal :
      'a class_t
       -> 'b class_t
       -> bool
    val getFamily : 'a class_t -> socketfamily_t
    val getIsAny : 'a class_t -> bool
    val getIsLinkLocal : 'a class_t -> bool
    val getIsLoopback : 'a class_t -> bool
    val getIsMcGlobal : 'a class_t -> bool
    val getIsMcLinkLocal : 'a class_t -> bool
    val getIsMcNodeLocal : 'a class_t -> bool
    val getIsMcOrgLocal : 'a class_t -> bool
    val getIsMcSiteLocal : 'a class_t -> bool
    val getIsMulticast : 'a class_t -> bool
    val getIsSiteLocal : 'a class_t -> bool
    val getNativeSize : 'a class_t -> LargeInt.int
    val toString : 'a class_t -> string
    val familyProp : ('a class_t, socketfamily_t, socketfamily_t) Property.readwrite
    val isAnyProp : ('a class_t, bool) Property.readonly
    val isLinkLocalProp : ('a class_t, bool) Property.readonly
    val isLoopbackProp : ('a class_t, bool) Property.readonly
    val isMcGlobalProp : ('a class_t, bool) Property.readonly
    val isMcLinkLocalProp : ('a class_t, bool) Property.readonly
    val isMcNodeLocalProp : ('a class_t, bool) Property.readonly
    val isMcOrgLocalProp : ('a class_t, bool) Property.readonly
    val isMcSiteLocalProp : ('a class_t, bool) Property.readonly
    val isMulticastProp : ('a class_t, bool) Property.readonly
    val isSiteLocalProp : ('a class_t, bool) Property.readonly
  end
