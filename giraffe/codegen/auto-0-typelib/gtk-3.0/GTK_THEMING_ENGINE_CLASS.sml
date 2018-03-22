signature GTK_THEMING_ENGINE_CLASS =
  sig
    type 'a theming_engine
    include
      CLASS
        where type 'a class = 'a theming_engine GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
