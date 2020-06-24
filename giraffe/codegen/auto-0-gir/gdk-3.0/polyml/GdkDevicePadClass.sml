structure GdkDevicePadClass :>
  GDK_DEVICE_PAD_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a device_pad = unit
    type 'a class = 'a device_pad class
  end
