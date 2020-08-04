structure GioFileOutputStreamClass :>
  GIO_FILE_OUTPUT_STREAM_CLASS
    where type 'a output_stream_class = 'a GioOutputStreamClass.class
    where type C.opt = GioOutputStreamClass.C.opt
    where type C.non_opt = GioOutputStreamClass.C.non_opt
    where type 'a C.p = 'a GioOutputStreamClass.C.p =
  struct
    type 'a output_stream_class = 'a GioOutputStreamClass.class
    open GioOutputStreamClass
    type 'a file_output_stream = unit
    type 'a class = 'a file_output_stream class
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_file_output_stream_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
