signature GTK_SHORTCUTS_SECTION_CLASS =
  sig
    type 'a shortcuts_section
    type 'a box_class
    include
      CLASS
        where type 'a class = 'a shortcuts_section box_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
