signature GTK_RANGE_ACCESSIBLE_CLASS =
  sig
    type 'a range_accessible
    type 'a widget_accessible_class
    include
      CLASS
        where type 'a class = 'a range_accessible widget_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
