signature GIO_ASYNC_INITABLE =
  sig
    type 'a class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val initFinish :
      'a class
       -> 'b async_result_class
       -> bool
    val newFinish :
      'a class
       -> 'b async_result_class
       -> base GObject.ObjectClass.class
  end
