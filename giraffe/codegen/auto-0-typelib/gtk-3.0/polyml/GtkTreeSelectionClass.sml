structure GtkTreeSelectionClass :>
  GTK_TREE_SELECTION_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a tree_selection = unit
    type 'a class = 'a tree_selection class
  end
