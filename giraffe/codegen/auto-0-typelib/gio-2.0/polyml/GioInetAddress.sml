structure GioInetAddress :>
  GIO_INET_ADDRESS
    where type 'a class = 'a GioInetAddressClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_inet_address_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newAny_ = call (getSymbol "g_inet_address_new_any") (GioSocketFamily.PolyML.cVal --> GioInetAddressClass.PolyML.cPtr)
      val newFromString_ = call (getSymbol "g_inet_address_new_from_string") (Utf8.PolyML.cInPtr --> GioInetAddressClass.PolyML.cPtr)
      val newLoopback_ = call (getSymbol "g_inet_address_new_loopback") (GioSocketFamily.PolyML.cVal --> GioInetAddressClass.PolyML.cPtr)
      val equal_ = call (getSymbol "g_inet_address_equal") (GioInetAddressClass.PolyML.cPtr &&> GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getFamily_ = call (getSymbol "g_inet_address_get_family") (GioInetAddressClass.PolyML.cPtr --> GioSocketFamily.PolyML.cVal)
      val getIsAny_ = call (getSymbol "g_inet_address_get_is_any") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsLinkLocal_ = call (getSymbol "g_inet_address_get_is_link_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsLoopback_ = call (getSymbol "g_inet_address_get_is_loopback") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMcGlobal_ = call (getSymbol "g_inet_address_get_is_mc_global") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMcLinkLocal_ = call (getSymbol "g_inet_address_get_is_mc_link_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMcNodeLocal_ = call (getSymbol "g_inet_address_get_is_mc_node_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMcOrgLocal_ = call (getSymbol "g_inet_address_get_is_mc_org_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMcSiteLocal_ = call (getSymbol "g_inet_address_get_is_mc_site_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsMulticast_ = call (getSymbol "g_inet_address_get_is_multicast") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getIsSiteLocal_ = call (getSymbol "g_inet_address_get_is_site_local") (GioInetAddressClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getNativeSize_ = call (getSymbol "g_inet_address_get_native_size") (GioInetAddressClass.PolyML.cPtr --> GUInt64.PolyML.cVal)
      val toString_ = call (getSymbol "g_inet_address_to_string") (GioInetAddressClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
    end
    type 'a class = 'a GioInetAddressClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newAny family = (GioSocketFamily.FFI.withVal ---> GioInetAddressClass.FFI.fromPtr true) newAny_ family
    fun newFromString string = (Utf8.FFI.withPtr ---> GioInetAddressClass.FFI.fromPtr true) newFromString_ string
    fun newLoopback family = (GioSocketFamily.FFI.withVal ---> GioInetAddressClass.FFI.fromPtr true) newLoopback_ family
    fun equal self otherAddress = (GioInetAddressClass.FFI.withPtr &&&> GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & otherAddress)
    fun getFamily self = (GioInetAddressClass.FFI.withPtr ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getIsAny self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsAny_ self
    fun getIsLinkLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsLinkLocal_ self
    fun getIsLoopback self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsLoopback_ self
    fun getIsMcGlobal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMcGlobal_ self
    fun getIsMcLinkLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMcLinkLocal_ self
    fun getIsMcNodeLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMcNodeLocal_ self
    fun getIsMcOrgLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMcOrgLocal_ self
    fun getIsMcSiteLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMcSiteLocal_ self
    fun getIsMulticast self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsMulticast_ self
    fun getIsSiteLocal self = (GioInetAddressClass.FFI.withPtr ---> GBool.FFI.fromVal) getIsSiteLocal_ self
    fun getNativeSize self = (GioInetAddressClass.FFI.withPtr ---> GUInt64.FFI.fromVal) getNativeSize_ self
    fun toString self = (GioInetAddressClass.FFI.withPtr ---> Utf8.FFI.fromPtr 1) toString_ self
    local
      open Property
    in
      val familyProp =
        {
          get = fn x => get "family" GioSocketFamily.t x,
          new = fn x => new "family" GioSocketFamily.t x
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
