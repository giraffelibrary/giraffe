signature GTK_SOURCE_COMPLETION_PROVIDER_CLASS =
  sig
    type 'a completion_provider
    include
      CLASS
        where type 'a class = 'a completion_provider GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
