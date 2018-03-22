signature ATK_G_OBJECT_ACCESSIBLE_CLASS =
  sig
    type 'a g_object_accessible
    type 'a object_class
    include
      CLASS
        where type 'a class = 'a g_object_accessible object_class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
