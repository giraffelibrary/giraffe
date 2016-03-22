signature ATK_STREAMABLE_CONTENT_CLASS =
  sig
    type 'a streamable_content
    include
      CLASS
        where type 'a class = 'a streamable_content GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
