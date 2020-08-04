structure GioBufferedOutputStreamClass :>
  GIO_BUFFERED_OUTPUT_STREAM_CLASS
    where type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    where type C.opt = GioFilterOutputStreamClass.C.opt
    where type C.non_opt = GioFilterOutputStreamClass.C.non_opt
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    open GioFilterOutputStreamClass
    type 'a buffered_output_stream = unit
    type 'a class = 'a buffered_output_stream class
    val getType_ = _import "g_buffered_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.non_opt FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p -> FFI.opt FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.non_opt FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.non_opt GObjectValueRecord.FFI.p * FFI.opt FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr false ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr false ---> I) setOptValue_
        }
  end
