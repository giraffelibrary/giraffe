signature GIO_LOADABLE_ICON =
  sig
    type 'a class_t
    type 'a cancellable_class_t
    type 'a input_stream_class_t
    type 'a async_result_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val load :
      'a class_t
       -> LargeInt.int
       -> 'b cancellable_class_t option
       -> base input_stream_class_t * string
    val loadFinish :
      'a class_t
       -> 'b async_result_class_t
       -> string
       -> base input_stream_class_t
  end
