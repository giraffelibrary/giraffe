signature GTK_SHORTCUT_LABEL_CLASS =
  sig
    type 'a shortcut_label
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a shortcut_label box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
