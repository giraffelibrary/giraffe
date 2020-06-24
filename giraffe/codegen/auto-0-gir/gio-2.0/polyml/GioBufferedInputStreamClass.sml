structure GioBufferedInputStreamClass :>
  GIO_BUFFERED_INPUT_STREAM_CLASS
    where type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    where type C.opt = GioFilterInputStreamClass.C.opt
    where type C.non_opt = GioFilterInputStreamClass.C.non_opt
    where type 'a C.p = 'a GioFilterInputStreamClass.C.p =
  struct
    type 'a filter_input_stream_class = 'a GioFilterInputStreamClass.class
    open GioFilterInputStreamClass
    type 'a buffered_input_stream = unit
    type 'a class = 'a buffered_input_stream class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_buffered_input_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cPtr)
      val getOptValue_ = call (getSymbol "g_value_get_object") (GObjectValueRecord.PolyML.cPtr --> PolyML.cOptPtr)
      val setValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cPtr --> cVoid)
      val setOptValue_ = call (getSymbol "g_value_set_object") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cOptPtr --> cVoid)
    end
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
