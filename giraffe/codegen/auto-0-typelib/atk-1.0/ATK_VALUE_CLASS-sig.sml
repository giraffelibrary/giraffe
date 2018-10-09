signature ATK_VALUE_CLASS =
  sig
    type 'a value
    include
      CLASS
        where type 'a class = 'a value GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
