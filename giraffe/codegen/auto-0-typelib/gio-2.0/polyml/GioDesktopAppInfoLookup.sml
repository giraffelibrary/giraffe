structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class = 'a GioDesktopAppInfoLookupClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_desktop_app_info_lookup_get_type") (cVoid --> GObjectType.PolyML.cVal)
    end
    type 'a class = 'a GioDesktopAppInfoLookupClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
