signature GTK_TOOLTIP_CLASS =
  sig
    type 'a tooltip
    include
      CLASS
        where type 'a class = 'a tooltip GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
