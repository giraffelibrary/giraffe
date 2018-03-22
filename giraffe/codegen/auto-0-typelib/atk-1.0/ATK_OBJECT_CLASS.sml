signature ATK_OBJECT_CLASS =
  sig
    type 'a object
    include
      CLASS
        where type 'a class = 'a object GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
