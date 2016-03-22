structure GtkTreeStoreClass :>
  GTK_TREE_STORE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_store = unit
    type 'a class = 'a tree_store class
  end
