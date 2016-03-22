signature GTK_SOURCE_COMPLETION_CONTEXT_CLASS =
  sig
    type 'a completion_context
    include
      CLASS
        where type 'a class = 'a completion_context GObject.InitiallyUnownedClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
