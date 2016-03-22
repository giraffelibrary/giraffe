signature PANGO_CONTEXT_CLASS =
  sig
    type 'a context
    include
      CLASS
        where type 'a class = 'a context GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
