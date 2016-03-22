signature GTK_SOURCE_VIEW_CLASS =
  sig
    type 'a view
    include
      CLASS
        where type 'a class = 'a view Gtk.TextViewClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
