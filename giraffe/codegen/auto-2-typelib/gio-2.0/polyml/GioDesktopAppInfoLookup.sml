structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class_t = 'a GioDesktopAppInfoLookupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_lookup_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
    end
    type 'a class_t = 'a GioDesktopAppInfoLookupClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
