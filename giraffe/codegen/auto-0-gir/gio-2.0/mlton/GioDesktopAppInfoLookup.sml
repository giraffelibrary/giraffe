structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class = 'a GioDesktopAppInfoLookupClass.class =
  struct
    val getType_ = _import "g_desktop_app_info_lookup_get_type" : unit -> GObjectType.FFI.val_;
    type 'a class = 'a GioDesktopAppInfoLookupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
