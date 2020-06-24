structure GioConverter :>
  GIO_CONVERTER
    where type 'a class = 'a GioConverterClass.class
    where type converter_result_t = GioConverterResult.t
    where type converter_flags_t = GioConverterFlags.t =
  struct
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
              GioConverterClass.FFI.non_opt GioConverterClass.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GUInt64.FFI.val_
               * GioConverterFlags.FFI.val_
               * GUInt64.FFI.ref_
               * GUInt64.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
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
    val reset_ = _import "g_converter_reset" : GioConverterClass.FFI.non_opt GioConverterClass.FFI.p -> unit;
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
        val inbufSize = LargeInt.fromInt (GUInt8CArrayN.length inbuf)
        val outbufSize = LargeInt.fromInt (GUInt8CArrayN.length outbuf)
        val bytesRead
         & bytesWritten
         & retVal =
          (
            GioConverterClass.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GUInt64.FFI.withVal
             &&&> GUInt8CArrayN.FFI.withPtr
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
