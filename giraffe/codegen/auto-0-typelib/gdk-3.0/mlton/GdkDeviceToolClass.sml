structure GdkDeviceToolClass :>
  GDK_DEVICE_TOOL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a device_tool = unit
    type 'a class = 'a device_tool class
  end
