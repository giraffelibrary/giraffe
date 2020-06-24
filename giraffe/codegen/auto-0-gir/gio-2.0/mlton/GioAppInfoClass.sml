structure GioAppInfoClass :>
  GIO_APP_INFO_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a app_info = unit
    type 'a class = 'a app_info class
  end
