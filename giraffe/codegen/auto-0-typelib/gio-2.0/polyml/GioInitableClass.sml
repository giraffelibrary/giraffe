structure GioInitableClass :>
  GIO_INITABLE_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a initable = unit
    type 'a class = 'a initable class
  end
