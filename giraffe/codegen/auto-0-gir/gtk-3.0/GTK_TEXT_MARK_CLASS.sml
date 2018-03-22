signature GTK_TEXT_MARK_CLASS =
  sig
    type 'a text_mark
    include
      CLASS
        where type 'a class = 'a text_mark GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
