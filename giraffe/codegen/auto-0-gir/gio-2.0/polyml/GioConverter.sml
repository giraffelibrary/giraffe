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
             &&> GSize.PolyML.cVal
             &&> GUInt8CVectorN.PolyML.cInPtr
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
        val inbufSize = LargeInt.fromInt (GUInt8CVectorN.length inbuf)
        val outbufSize = LargeInt.fromInt (GUInt8CVectorN.length outbuf)
        val bytesRead
         & bytesWritten
         & retVal =
          (
            GioConverterClass.FFI.withPtr
             &&&> GUInt8CVectorN.FFI.withPtr
             &&&> GSize.FFI.withVal
             &&&> GUInt8CVectorN.FFI.withPtr
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
    fun reset self = (GioConverterClass.FFI.withPtr ---> I) reset_ self
  end
