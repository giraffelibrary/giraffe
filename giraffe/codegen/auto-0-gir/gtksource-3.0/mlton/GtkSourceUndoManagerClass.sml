structure GtkSourceUndoManagerClass :>
  GTK_SOURCE_UNDO_MANAGER_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a undo_manager = unit
    type 'a class = 'a undo_manager class
  end
