structure GioSeekableClass :>
  GIO_SEEKABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a seekable = unit
    type 'a class = 'a seekable class
  end
