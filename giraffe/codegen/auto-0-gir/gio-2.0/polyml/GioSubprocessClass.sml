structure GioSubprocessClass :>
  GIO_SUBPROCESS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a subprocess = unit
    type 'a class = 'a subprocess class
  end
