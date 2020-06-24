structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class = 'a GioDesktopAppInfoLookupClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    val getType_ = _import "g_desktop_app_info_lookup_get_type" : unit -> GObjectType.FFI.val_;
    val getDefaultForUriScheme_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_desktop_app_info_lookup_get_default_for_uri_scheme" :
              GioDesktopAppInfoLookupClass.FFI.non_opt GioDesktopAppInfoLookupClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioAppInfoClass.FFI.non_opt GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GioDesktopAppInfoLookupClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefaultForUriScheme self uriScheme = (GioDesktopAppInfoLookupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) getDefaultForUriScheme_ (self & uriScheme)
  end
