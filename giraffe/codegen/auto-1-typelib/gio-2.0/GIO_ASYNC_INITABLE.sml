signature GIO_ASYNC_INITABLE =
  sig
    type 'a class_t
    type 'a asyncresultclass_t
    val getType : unit -> GObject.Type.t
    val initFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> bool
    val newFinish :
      'a class_t
       -> 'b asyncresultclass_t
       -> base GObject.ObjectClass.t
  end
