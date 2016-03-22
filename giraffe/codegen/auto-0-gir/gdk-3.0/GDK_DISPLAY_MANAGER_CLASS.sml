signature GDK_DISPLAY_MANAGER_CLASS =
  sig
    type 'a display_manager
    include
      CLASS
        where type 'a class = 'a display_manager GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
