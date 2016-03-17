structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class = 'a GioDesktopAppInfoLookupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_desktop_app_info_lookup_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GioDesktopAppInfoLookupClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
