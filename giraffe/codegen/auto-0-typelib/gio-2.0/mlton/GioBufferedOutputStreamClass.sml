structure GioBufferedOutputStreamClass :>
  GIO_BUFFERED_OUTPUT_STREAM_CLASS
    where type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    where type C.notnull = GioFilterOutputStreamClass.C.notnull
    where type 'a C.p = 'a GioFilterOutputStreamClass.C.p =
  struct
    type 'a filter_output_stream_class = 'a GioFilterOutputStreamClass.class
    open GioFilterOutputStreamClass
    type 'a buffered_output_stream = unit
    type 'a class = 'a buffered_output_stream class
    val getType_ = _import "g_buffered_output_stream_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.notnull FFI.p;
    val getOptValue_ = _import "g_value_get_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> unit FFI.p;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.notnull FFI.p -> unit;) (x1, x2)
    val setOptValue_ = fn x1 & x2 => (_import "g_value_set_object" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * unit FFI.p -> unit;) (x1, x2)
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromPtr false) getValue_,
          setValue = (I &&&> FFI.withPtr ---> I) setValue_
        }
    val tOpt =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromOptPtr false) getOptValue_,
          setValue = (I &&&> FFI.withOptPtr ---> I) setOptValue_
        }
  end
