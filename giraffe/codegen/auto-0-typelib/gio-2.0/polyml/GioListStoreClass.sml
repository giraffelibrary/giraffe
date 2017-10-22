structure GioListStoreClass :>
  GIO_LIST_STORE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a list_store = unit
    type 'a class = 'a list_store class
  end
