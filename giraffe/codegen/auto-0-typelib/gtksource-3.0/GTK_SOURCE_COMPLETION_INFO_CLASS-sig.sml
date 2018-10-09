signature GTK_SOURCE_COMPLETION_INFO_CLASS =
  sig
    type 'a completion_info
    include
      CLASS
        where type 'a class = 'a completion_info Gtk.WindowClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
