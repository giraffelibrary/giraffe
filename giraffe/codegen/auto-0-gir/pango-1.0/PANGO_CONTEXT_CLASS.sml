signature PANGO_CONTEXT_CLASS =
  sig
    type 'a context
    include
      CLASS
        where type 'a class = 'a context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
