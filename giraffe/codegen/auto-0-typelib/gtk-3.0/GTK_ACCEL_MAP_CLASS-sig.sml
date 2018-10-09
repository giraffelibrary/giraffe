signature GTK_ACCEL_MAP_CLASS =
  sig
    type 'a accel_map
    include
      CLASS
        where type 'a class = 'a accel_map GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
