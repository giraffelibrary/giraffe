structure GtkTreeModelSortClass :>
  GTK_TREE_MODEL_SORT_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_model_sort = unit
    type 'a class = 'a tree_model_sort class
  end
