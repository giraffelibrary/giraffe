structure GioListModelClass :>
  GIO_LIST_MODEL_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a list_model = unit
    type 'a class = 'a list_model class
  end
