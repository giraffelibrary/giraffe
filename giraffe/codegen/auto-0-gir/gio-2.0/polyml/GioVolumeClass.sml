structure GioVolumeClass :>
  GIO_VOLUME_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a volume = unit
    type 'a class = 'a volume class
  end
