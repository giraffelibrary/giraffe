signature GIO_TEST_D_BUS_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
