structure GioInetAddress :>
  GIO_INET_ADDRESS
    where type 'a class = 'a GioInetAddressClass.class
    where type socket_family_t = GioSocketFamily.t =
  struct
    val getType_ = _import "g_inet_address_get_type" : unit -> GObjectType.FFI.val_;
    val newAny_ = _import "g_inet_address_new_any" : GioSocketFamily.FFI.val_ -> GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p;
    val newFromString_ = _import "mlton_g_inet_address_new_from_string" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GioInetAddressClass.FFI.opt GioInetAddressClass.FFI.p;
    val newLoopback_ = _import "g_inet_address_new_loopback" : GioSocketFamily.FFI.val_ -> GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p;
    val equal_ = fn x1 & x2 => (_import "g_inet_address_equal" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p * GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getFamily_ = _import "g_inet_address_get_family" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GioSocketFamily.FFI.val_;
    val getIsAny_ = _import "g_inet_address_get_is_any" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsLinkLocal_ = _import "g_inet_address_get_is_link_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsLoopback_ = _import "g_inet_address_get_is_loopback" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMcGlobal_ = _import "g_inet_address_get_is_mc_global" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMcLinkLocal_ = _import "g_inet_address_get_is_mc_link_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMcNodeLocal_ = _import "g_inet_address_get_is_mc_node_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMcOrgLocal_ = _import "g_inet_address_get_is_mc_org_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMcSiteLocal_ = _import "g_inet_address_get_is_mc_site_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsMulticast_ = _import "g_inet_address_get_is_multicast" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getIsSiteLocal_ = _import "g_inet_address_get_is_site_local" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GBool.FFI.val_;
    val getNativeSize_ = _import "g_inet_address_get_native_size" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> GSize.FFI.val_;
    val toString_ = _import "g_inet_address_to_string" : GioInetAddressClass.FFI.non_opt GioInetAddressClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    type 'a class = 'a GioInetAddressClass.class
    type socket_family_t = GioSocketFamily.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newAny family = (GioSocketFamily.FFI.withVal ---> GioInetAddressClass.FFI.fromPtr true) newAny_ family
    fun newFromString string = (Utf8.FFI.withPtr 0 ---> GioInetAddressClass.FFI.fromOptPtr true) newFromString_ string
    fun newLoopback family = (GioSocketFamily.FFI.withVal ---> GioInetAddressClass.FFI.fromPtr true) newLoopback_ family
    fun equal self otherAddress = (GioInetAddressClass.FFI.withPtr false &&&> GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) equal_ (self & otherAddress)
    fun getFamily self = (GioInetAddressClass.FFI.withPtr false ---> GioSocketFamily.FFI.fromVal) getFamily_ self
    fun getIsAny self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsAny_ self
    fun getIsLinkLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsLinkLocal_ self
    fun getIsLoopback self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsLoopback_ self
    fun getIsMcGlobal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMcGlobal_ self
    fun getIsMcLinkLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMcLinkLocal_ self
    fun getIsMcNodeLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMcNodeLocal_ self
    fun getIsMcOrgLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMcOrgLocal_ self
    fun getIsMcSiteLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMcSiteLocal_ self
    fun getIsMulticast self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsMulticast_ self
    fun getIsSiteLocal self = (GioInetAddressClass.FFI.withPtr false ---> GBool.FFI.fromVal) getIsSiteLocal_ self
    fun getNativeSize self = (GioInetAddressClass.FFI.withPtr false ---> GSize.FFI.fromVal) getNativeSize_ self
    fun toString self = (GioInetAddressClass.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) toString_ self
    local
      open ValueAccessor
    in
      val familyProp =
        {
          name = "family",
          gtype = fn () => C.gtype GioSocketFamily.t (),
          get = fn x => fn () => C.get GioSocketFamily.t x,
          set = ignore,
          init = fn x => C.set GioSocketFamily.t x
        }
      val isAnyProp =
        {
          name = "is-any",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isLinkLocalProp =
        {
          name = "is-link-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isLoopbackProp =
        {
          name = "is-loopback",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMcGlobalProp =
        {
          name = "is-mc-global",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMcLinkLocalProp =
        {
          name = "is-mc-link-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMcNodeLocalProp =
        {
          name = "is-mc-node-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMcOrgLocalProp =
        {
          name = "is-mc-org-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMcSiteLocalProp =
        {
          name = "is-mc-site-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isMulticastProp =
        {
          name = "is-multicast",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val isSiteLocalProp =
        {
          name = "is-site-local",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
    end
  end
