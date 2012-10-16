structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class_t = 'a GioDesktopAppInfoLookupClass.t =
  struct
    val getType_ = _import "g_desktop_app_info_lookup_get_type" : unit -> GObjectType.C.val_;
    type 'a class_t = 'a GioDesktopAppInfoLookupClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
