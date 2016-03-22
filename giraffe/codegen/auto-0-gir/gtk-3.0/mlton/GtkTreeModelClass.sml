structure GtkTreeModelClass :>
  GTK_TREE_MODEL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_model = unit
    type 'a class = 'a tree_model class
  end
