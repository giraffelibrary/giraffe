signature GTK_COLOR_SELECTION_CLASS =
  sig
    type 'a color_selection
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a color_selection box_class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
