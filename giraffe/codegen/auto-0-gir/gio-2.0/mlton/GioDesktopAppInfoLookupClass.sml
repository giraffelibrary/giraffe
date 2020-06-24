structure GioDesktopAppInfoLookupClass :>
  GIO_DESKTOP_APP_INFO_LOOKUP_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a desktop_app_info_lookup = unit
    type 'a class = 'a desktop_app_info_lookup class
  end
