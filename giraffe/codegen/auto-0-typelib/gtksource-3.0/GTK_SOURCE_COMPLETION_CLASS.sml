signature GTK_SOURCE_COMPLETION_CLASS =
  sig
    type 'a completion
    include
      CLASS
        where type 'a class = 'a completion GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
