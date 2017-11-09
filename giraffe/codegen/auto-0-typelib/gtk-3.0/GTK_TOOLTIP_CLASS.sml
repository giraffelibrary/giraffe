signature GTK_TOOLTIP_CLASS =
  sig
    type 'a tooltip
    include
      CLASS
        where type 'a class = 'a tooltip GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
