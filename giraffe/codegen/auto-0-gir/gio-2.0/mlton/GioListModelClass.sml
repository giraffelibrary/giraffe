structure GioListModelClass :>
  GIO_LIST_MODEL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a list_model = unit
    type 'a class = 'a list_model class
  end
