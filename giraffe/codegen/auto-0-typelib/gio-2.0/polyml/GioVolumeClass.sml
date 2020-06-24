structure GioVolumeClass :>
  GIO_VOLUME_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a volume = unit
    type 'a class = 'a volume class
  end
