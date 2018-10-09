signature ATK_UTIL_CLASS =
  sig
    type 'a util
    include
      CLASS
        where type 'a class = 'a util GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
