structure GtkTreeModelFilterClass :>
  GTK_TREE_MODEL_FILTER_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_model_filter = unit
    type 'a class = 'a tree_model_filter class
  end
