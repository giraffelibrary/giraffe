structure GioDesktopAppInfoLookupClass :>
  GIO_DESKTOP_APP_INFO_LOOKUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a desktop_app_info_lookup = unit
    type 'a t = 'a desktop_app_info_lookup GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
