signature GTK_HANDLE_BOX_CLASS =
  sig
    type 'a handle_box
    type 'a bin_class
    include
      CLASS
        where type 'a class = 'a handle_box bin_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
