signature GTK_SOURCE_MARK_CLASS =
  sig
    type 'a mark
    include
      CLASS
        where type 'a class = 'a mark Gtk.TextMarkClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
