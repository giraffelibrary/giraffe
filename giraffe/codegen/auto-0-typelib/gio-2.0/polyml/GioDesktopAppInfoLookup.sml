structure GioDesktopAppInfoLookup :>
  GIO_DESKTOP_APP_INFO_LOOKUP
    where type 'a class = 'a GioDesktopAppInfoLookupClass.class
    where type 'a app_info_class = 'a GioAppInfoClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_desktop_app_info_lookup_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getDefaultForUriScheme_ = call (getSymbol "g_desktop_app_info_lookup_get_default_for_uri_scheme") (GioDesktopAppInfoLookupClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GioAppInfoClass.PolyML.cPtr)
    end
    type 'a class = 'a GioDesktopAppInfoLookupClass.class
    type 'a app_info_class = 'a GioAppInfoClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getDefaultForUriScheme self uriScheme = (GioDesktopAppInfoLookupClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) getDefaultForUriScheme_ (self & uriScheme)
  end
