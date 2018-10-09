signature GTK_TEXT_TAG_TABLE_CLASS =
  sig
    type 'a text_tag_table
    include
      CLASS
        where type 'a class = 'a text_tag_table GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
