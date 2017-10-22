structure GdkMonitorClass :>
  GDK_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a monitor = unit
    type 'a class = 'a monitor class
  end
