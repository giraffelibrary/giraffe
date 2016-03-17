structure GioInetAddress :>
  GIO_INET_ADDRESS
    where type 'a class = 'a GioInetAddressClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_inet_address_get_type" : unit -> GObjectType.C.val_;
    val newAny_ = _import "g_inet_address_new_any" : GioSocketFamily.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newFromString_ = _import "mlton_g_inet_address_new_from_string" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newLoopback_ = _import "g_inet_address_new_loopback" : GioSocketFamily.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val equal_ = fn x1 & x2 => (_import "g_inet_address_equal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getFamily_ = _import "g_inet_address_get_family" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GioSocketFamily.C.val_;
    val getIsAny_ = _import "g_inet_address_get_is_any" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsLinkLocal_ = _import "g_inet_address_get_is_link_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsLoopback_ = _import "g_inet_address_get_is_loopback" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMcGlobal_ = _import "g_inet_address_get_is_mc_global" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMcLinkLocal_ = _import "g_inet_address_get_is_mc_link_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMcNodeLocal_ = _import "g_inet_address_get_is_mc_node_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMcOrgLocal_ = _import "g_inet_address_get_is_mc_org_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMcSiteLocal_ = _import "g_inet_address_get_is_mc_site_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsMulticast_ = _import "g_inet_address_get_is_multicast" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getIsSiteLocal_ = _import "g_inet_address_get_is_site_local" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getNativeSize_ = _import "g_inet_address_get_native_size" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Size.C.val_;
    val toString_ = _import "g_inet_address_to_string" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    type 'a class = 'a GioInetAddressClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newAny family = (GioSocketFamily.C.withVal ---> GioInetAddressClass.C.fromPtr true) newAny_ family
    fun newFromString string = (Utf8.C.withPtr ---> GioInetAddressClass.C.fromPtr true) newFromString_ string
    fun newLoopback family = (GioSocketFamily.C.withVal ---> GioInetAddressClass.C.fromPtr true) newLoopback_ family
    fun equal self otherAddress = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & otherAddress)
    fun getFamily self = (GObjectObjectClass.C.withPtr ---> GioSocketFamily.C.fromVal) getFamily_ self
    fun getIsAny self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsAny_ self
    fun getIsLinkLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsLinkLocal_ self
    fun getIsLoopback self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsLoopback_ self
    fun getIsMcGlobal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMcGlobal_ self
    fun getIsMcLinkLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMcLinkLocal_ self
    fun getIsMcNodeLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMcNodeLocal_ self
    fun getIsMcOrgLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMcOrgLocal_ self
    fun getIsMcSiteLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMcSiteLocal_ self
    fun getIsMulticast self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsMulticast_ self
    fun getIsSiteLocal self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getIsSiteLocal_ self
    fun getNativeSize self = (GObjectObjectClass.C.withPtr ---> FFI.Size.C.fromVal) getNativeSize_ self
    fun toString self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr true) toString_ self
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
