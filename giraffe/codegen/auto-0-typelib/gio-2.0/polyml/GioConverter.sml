structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class
    where type converter_result_t = GioConverterResult.t
    where type converter_flags_t = GioConverterFlags.t =
  struct
    structure GUInt8CVectorNType =
      CValueCVectorNType(
        structure CElemType = GUInt8Type
        structure ElemSequence = MonoVectorSequence(Word8Vector)
      )
    structure GUInt8CVectorN = CVectorN(GUInt8CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_converter_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val convert_ =
        call (getSymbol "g_converter_convert")
          (
            GioConverterClass.PolyML.cPtr
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
             &&> GUInt64.PolyML.cVal
             &&> GioConverterFlags.PolyML.cVal
             &&> GUInt64.PolyML.cRef
             &&> GUInt64.PolyML.cRef
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
        val inbufSize = LargeInt.fromInt (GUInt8CVectorN.length inbuf)
        val outbufSize = LargeInt.fromInt (GUInt8CVectorN.length outbuf)
        val bytesRead
         & bytesWritten
         & retVal =
          (
            GioConverterClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GioConverterFlags.FFI.withVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GUInt64.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GUInt64.FFI.fromVal
                   && GUInt64.FFI.fromVal
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
               & GUInt64.null
               & GUInt64.null
               & []
            )
      in
        (
          retVal,
          bytesRead,
          bytesWritten
        )
      end
    fun reset self = (GioConverterClass.FFI.withPtr ---> I) reset_ self
  end
