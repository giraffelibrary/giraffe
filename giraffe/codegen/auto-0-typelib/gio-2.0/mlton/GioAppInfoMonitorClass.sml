structure GioAppInfoMonitorClass :>
  GIO_APP_INFO_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a app_info_monitor = unit
    type 'a class = 'a app_info_monitor class
  end
