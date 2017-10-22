structure GioTestDBusClass :>
  GIO_TEST_D_BUS_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a test_d_bus = unit
    type 'a class = 'a test_d_bus class
  end
