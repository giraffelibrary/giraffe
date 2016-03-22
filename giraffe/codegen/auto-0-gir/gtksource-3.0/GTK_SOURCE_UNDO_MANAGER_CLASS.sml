signature GTK_SOURCE_UNDO_MANAGER_CLASS =
  sig
    type 'a undo_manager
    include
      CLASS
        where type 'a class = 'a undo_manager GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
