signature GTK_TEXT_BUFFER_CLASS =
  sig
    type 'a text_buffer
    include
      CLASS
        where type 'a class = 'a text_buffer GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
