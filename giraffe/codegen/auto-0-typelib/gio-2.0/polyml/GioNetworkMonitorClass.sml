structure GioNetworkMonitorClass :>
  GIO_NETWORK_MONITOR_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a network_monitor = unit
    type 'a class = 'a network_monitor class
  end
