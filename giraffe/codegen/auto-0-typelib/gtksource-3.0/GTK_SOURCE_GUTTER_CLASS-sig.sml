signature GTK_SOURCE_GUTTER_CLASS =
  sig
    type 'a gutter
    include
      CLASS
        where type 'a class = 'a gutter GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
