signature GIO_TEST_D_BUS_CLASS =
  sig
    type 'a test_d_bus
    include
      CLASS
        where type 'a class = 'a test_d_bus GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
    val toDerived :
      ('a class, 'b) ValueAccessor.t
       -> base class
       -> 'a class
  end
