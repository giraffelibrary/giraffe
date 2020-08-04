structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class
    where type converter_result_t = GioConverterResult.t
    where type converter_flags_t = GioConverterFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_converter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val convert_ =
        call (getSymbol "g_converter_convert")
          (
            GioConverterClass.PolyML.cPtr
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GUInt8CArrayN.PolyML.cInPtr
             &&> GSize.PolyML.cVal
             &&> GioConverterFlags.PolyML.cVal
             &&> GSize.PolyML.cRef
             &&> GSize.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioConverterResult.PolyML.cVal
          )
      val reset_ = call (getSymbol "g_converter_reset") (GioConverterClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GioConverterClass.class
    type converter_result_t = GioConverterResult.t
    type converter_flags_t = GioConverterFlags.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun convert
      self
      (
        inbuf,
        outbuf,
        flags
      ) =
      let
        val inbufSize = GUInt8CArrayN.length inbuf
        val outbufSize = GUInt8CArrayN.length outbuf
        val bytesRead
         & bytesWritten
         & retVal =
          (
            GioConverterClass.FFI.withPtr false
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr 0
             &&&> GSize.FFI.withVal
             &&&> GioConverterFlags.FFI.withVal
             &&&> GSize.FFI.withRefVal
             &&&> GSize.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GSize.FFI.fromVal
                   && GSize.FFI.fromVal
                   && GioConverterResult.FFI.fromVal
          )
            convert_
            (
              self
               & inbuf
               & inbufSize
               & outbuf
               & outbufSize
               & flags
               & GSize.null
               & GSize.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun reset self = (GioConverterClass.FFI.withPtr false ---> I) reset_ self
  end
