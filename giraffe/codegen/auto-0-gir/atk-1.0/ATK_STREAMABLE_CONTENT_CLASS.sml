signature ATK_STREAMABLE_CONTENT_CLASS =
  sig
    type 'a streamable_content
    include
      CLASS
        where type 'a class = 'a streamable_content GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
