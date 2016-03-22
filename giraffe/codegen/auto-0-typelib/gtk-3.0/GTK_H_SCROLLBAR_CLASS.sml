signature GTK_H_SCROLLBAR_CLASS =
  sig
    type 'a h_scrollbar
    type 'a scrollbar_class
    include
      CLASS
        where type 'a class = 'a h_scrollbar scrollbar_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
