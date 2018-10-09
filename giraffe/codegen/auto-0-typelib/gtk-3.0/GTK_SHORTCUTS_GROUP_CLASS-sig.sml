signature GTK_SHORTCUTS_GROUP_CLASS =
  sig
    type 'a shortcuts_group
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a shortcuts_group box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
