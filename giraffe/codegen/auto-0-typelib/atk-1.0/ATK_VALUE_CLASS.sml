signature ATK_VALUE_CLASS =
  sig
    type 'a value
    include
      CLASS
        where type 'a class = 'a value GObject.ObjectClass.class
    val t : (base class, 'a class) GObject.Value.accessor
    val tOpt : (base class option, 'a class option) GObject.Value.accessor
  end
