signature GTK_FILE_CHOOSER_WIDGET_CLASS =
  sig
    type 'a file_chooser_widget
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a file_chooser_widget box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
