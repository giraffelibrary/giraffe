signature GIO_LOADABLE_ICON =
  sig
    type 'a class
    type 'a cancellable_class
    type 'a input_stream_class
    type 'a async_result_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val load :
      'a class
       -> LargeInt.int * 'b cancellable_class option
       -> base input_stream_class * string
    val loadFinish :
      'a class
       -> 'b async_result_class * string
       -> base input_stream_class
  end
