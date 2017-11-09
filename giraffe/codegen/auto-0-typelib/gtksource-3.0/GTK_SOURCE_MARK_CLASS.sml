signature GTK_SOURCE_MARK_CLASS =
  sig
    type 'a mark
    include
      CLASS
        where type 'a class = 'a mark Gtk.TextMarkClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
