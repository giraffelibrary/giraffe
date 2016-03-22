structure GioUnixFDListClass :>
  GIO_UNIX_F_D_LIST_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a unix_f_d_list = unit
    type 'a class = 'a unix_f_d_list class
  end
