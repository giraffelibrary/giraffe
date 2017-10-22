signature GTK_SOURCE_TAG_CLASS =
  sig
    type 'a tag
    include
      CLASS
        where type 'a class = 'a tag Gtk.TextTagClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
