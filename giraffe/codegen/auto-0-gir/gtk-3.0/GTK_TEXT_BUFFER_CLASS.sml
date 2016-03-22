signature GTK_TEXT_BUFFER_CLASS =
  sig
    type 'a text_buffer
    include
      CLASS
        where type 'a class = 'a text_buffer GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
