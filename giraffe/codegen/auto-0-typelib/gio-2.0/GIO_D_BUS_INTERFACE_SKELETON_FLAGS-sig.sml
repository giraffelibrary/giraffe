signature GIO_D_BUS_INTERFACE_SKELETON_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val HANDLE_METHOD_INVOCATIONS_IN_THREAD : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
