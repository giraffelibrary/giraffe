signature GTK_ARROW_ACCESSIBLE_CLASS =
  sig
    type 'a arrow_accessible
    type 'a widget_accessible_class
    include
      CLASS
        where type 'a class = 'a arrow_accessible widget_accessible_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
