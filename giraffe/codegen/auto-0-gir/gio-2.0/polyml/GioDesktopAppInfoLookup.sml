structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class_t = 'a GioDesktopAppInfoLookupClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_lookup_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class_t = 'a GioDesktopAppInfoLookupClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
