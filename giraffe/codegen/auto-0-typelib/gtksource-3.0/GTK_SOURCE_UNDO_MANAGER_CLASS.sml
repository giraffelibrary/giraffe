signature GTK_SOURCE_UNDO_MANAGER_CLASS =
  sig
    type 'a undo_manager
    include
      CLASS
        where type 'a class = 'a undo_manager GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
