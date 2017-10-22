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
    val getType_ = _import "g_converter_get_type" : unit -> GObjectType.FFI.val_;
    val convert_ =
      fn
        x1
         & (x2, x3)
         & x4
         & (x5, x6)
         & x7
         & x8
         & x9
         & x10
         & x11 =>
          (
            _import "mlton_g_converter_convert" :
              GioConverterClass.FFI.notnull GioConverterClass.FFI.p
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               * GUInt8CVectorN.MLton.p1
               * GUInt8CVectorN.FFI.notnull GUInt8CVectorN.MLton.p2
               * GSize.FFI.val_
               * GioConverterFlags.FFI.val_
               * GSize.FFI.ref_
               * GSize.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioConverterResult.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9,
              x10,
              x11
            )
    val reset_ = _import "g_converter_reset" : GioConverterClass.FFI.notnull GioConverterClass.FFI.p -> unit;
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
