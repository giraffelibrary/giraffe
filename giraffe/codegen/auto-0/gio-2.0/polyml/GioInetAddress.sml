structure GioInetAddress :>
  GIO_INET_ADDRESS
    where type 'a class_t = 'a GioInetAddressClass.t
    where type socketfamily_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_inet_address_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newAny_ = call (load_sym libgio "g_inet_address_new_any") (GioSocketFamily.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val newFromString_ = call (load_sym libgio "g_inet_address_new_from_string") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newLoopback_ = call (load_sym libgio "g_inet_address_new_loopback") (GioSocketFamily.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val equal_ = call (load_sym libgio "g_inet_address_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getFamily_ = call (load_sym libgio "g_inet_address_get_family") (GObjectObjectClass.PolyML.PTR --> GioSocketFamily.PolyML.VAL)
      val getIsAny_ = call (load_sym libgio "g_inet_address_get_is_any") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsLinkLocal_ = call (load_sym libgio "g_inet_address_get_is_link_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsLoopback_ = call (load_sym libgio "g_inet_address_get_is_loopback") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMcGlobal_ = call (load_sym libgio "g_inet_address_get_is_mc_global") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMcLinkLocal_ = call (load_sym libgio "g_inet_address_get_is_mc_link_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMcNodeLocal_ = call (load_sym libgio "g_inet_address_get_is_mc_node_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMcOrgLocal_ = call (load_sym libgio "g_inet_address_get_is_mc_org_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMcSiteLocal_ = call (load_sym libgio "g_inet_address_get_is_mc_site_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsMulticast_ = call (load_sym libgio "g_inet_address_get_is_multicast") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getIsSiteLocal_ = call (load_sym libgio "g_inet_address_get_is_site_local") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getNativeSize_ = call (load_sym libgio "g_inet_address_get_native_size") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.UInt64.VAL)
      val toString_ = call (load_sym libgio "g_inet_address_to_string") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
    end
    type 'a class_t = 'a GioInetAddressClass.t
    type socketfamily_t = GioSocketFamily.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newAny family = (GioSocketFamily.C.withVal ---> GioInetAddressClass.C.fromPtr true) newAny_ family
    fun newFromString string = (FFI.String.withConstPtr ---> GioInetAddressClass.C.fromPtr true) newFromString_ string
    fun newLoopback family = (GioSocketFamily.C.withVal ---> GioInetAddressClass.C.fromPtr true) newLoopback_ family
    fun equal self otherAddress = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & otherAddress)
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getIsAny self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsAny_ self
    fun getIsLinkLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsLinkLocal_ self
    fun getIsLoopback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsLoopback_ self
    fun getIsMcGlobal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMcGlobal_ self
    fun getIsMcLinkLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMcLinkLocal_ self
    fun getIsMcNodeLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMcNodeLocal_ self
    fun getIsMcOrgLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMcOrgLocal_ self
    fun getIsMcSiteLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMcSiteLocal_ self
    fun getIsMulticast self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsMulticast_ self
    fun getIsSiteLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getIsSiteLocal_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.UInt64.fromVal) getNativeSize_ self
    fun toString self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr true) toString_ self
    local
      open Property
    in
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          set = fn x => set "family" GioSocketFamily.t x
        }
      val isAnyProp = {get = fn x => get "is-any" boolean x}
      val isLinkLocalProp = {get = fn x => get "is-link-local" boolean x}
      val isLoopbackProp = {get = fn x => get "is-loopback" boolean x}
      val isMcGlobalProp = {get = fn x => get "is-mc-global" boolean x}
      val isMcLinkLocalProp = {get = fn x => get "is-mc-link-local" boolean x}
      val isMcNodeLocalProp = {get = fn x => get "is-mc-node-local" boolean x}
      val isMcOrgLocalProp = {get = fn x => get "is-mc-org-local" boolean x}
      val isMcSiteLocalProp = {get = fn x => get "is-mc-site-local" boolean x}
      val isMulticastProp = {get = fn x => get "is-multicast" boolean x}
      val isSiteLocalProp = {get = fn x => get "is-site-local" boolean x}
    end
  end
