signature GTK_FONT_SELECTION_CLASS =
  sig
    type 'a font_selection
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a font_selection box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
