signature GTK_G_L_AREA_CLASS =
  sig
    type 'a g_l_area
    type 'a widget_class
    include
      CLASS
        where type 'a class = 'a g_l_area widget_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
