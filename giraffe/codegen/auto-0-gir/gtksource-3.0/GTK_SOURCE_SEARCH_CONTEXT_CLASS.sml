signature GTK_SOURCE_SEARCH_CONTEXT_CLASS =
  sig
    type 'a search_context
    include
      CLASS
        where type 'a class = 'a search_context GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
