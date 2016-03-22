signature ATK_UTIL_CLASS =
  sig
    type 'a util
    include
      CLASS
        where type 'a class = 'a util GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
