signature GTK_CLIPBOARD_CLASS =
  sig
    type 'a clipboard
    include
      CLASS
        where type 'a class = 'a clipboard GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
