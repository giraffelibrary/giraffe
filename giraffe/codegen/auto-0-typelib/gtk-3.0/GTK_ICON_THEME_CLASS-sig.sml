signature GTK_ICON_THEME_CLASS =
  sig
    type 'a icon_theme
    include
      CLASS
        where type 'a class = 'a icon_theme GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
