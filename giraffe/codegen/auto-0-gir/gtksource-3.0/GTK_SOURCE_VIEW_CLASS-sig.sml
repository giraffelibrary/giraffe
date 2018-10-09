signature GTK_SOURCE_VIEW_CLASS =
  sig
    type 'a view
    include
      CLASS
        where type 'a class = 'a view Gtk.TextViewClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
