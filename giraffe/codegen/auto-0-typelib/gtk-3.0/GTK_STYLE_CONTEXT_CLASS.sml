signature GTK_STYLE_CONTEXT_CLASS =
  sig
    type 'a style_context
    include
      CLASS
        where type 'a class = 'a style_context GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
