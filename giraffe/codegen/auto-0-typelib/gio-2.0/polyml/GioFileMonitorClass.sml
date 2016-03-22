structure GioFileMonitorClass :>
  GIO_FILE_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a file_monitor = unit
    type 'a class = 'a file_monitor class
  end
