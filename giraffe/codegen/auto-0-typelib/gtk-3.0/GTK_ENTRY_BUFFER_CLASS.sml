signature GTK_ENTRY_BUFFER_CLASS =
  sig
    type 'a entry_buffer
    include
      CLASS
        where type 'a class = 'a entry_buffer GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
