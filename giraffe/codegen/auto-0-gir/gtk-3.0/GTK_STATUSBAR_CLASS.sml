signature GTK_STATUSBAR_CLASS =
  sig
    type 'a statusbar
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a statusbar box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
