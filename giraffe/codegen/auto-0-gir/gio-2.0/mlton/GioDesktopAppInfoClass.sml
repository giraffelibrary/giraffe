structure GioDesktopAppInfoClass :>
  GIO_DESKTOP_APP_INFO_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a desktop_app_info = unit
    type 'a class = 'a desktop_app_info class
  end
