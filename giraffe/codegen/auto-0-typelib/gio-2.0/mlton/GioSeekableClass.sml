structure GioSeekableClass :>
  GIO_SEEKABLE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a seekable = unit
    type 'a class = 'a seekable class
  end
