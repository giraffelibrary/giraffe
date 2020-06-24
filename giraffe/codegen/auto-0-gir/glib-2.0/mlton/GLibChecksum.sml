structure GLibChecksum :>
  G_LIB_CHECKSUM
    where type t = GLibChecksumRecord.t
    where type checksum_type_t = GLibChecksumType.t =
  struct
    val getType_ = _import "g_checksum_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_checksum_new" : GLibChecksumType.FFI.val_ -> GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p;
    val copy_ = _import "g_checksum_copy" : GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p -> GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p;
    val getString_ = _import "g_checksum_get_string" : GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val reset_ = _import "g_checksum_reset" : GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p -> unit;
    val update_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_checksum_update" :
              GLibChecksumRecord.FFI.non_opt GLibChecksumRecord.FFI.p
               * GUInt8CArrayN.MLton.p1
               * GUInt8CArrayN.FFI.non_opt GUInt8CArrayN.MLton.p2
               * GSSize.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val typeGetLength_ = _import "g_checksum_type_get_length" : GLibChecksumType.FFI.val_ -> GSSize.FFI.val_;
    type t = GLibChecksumRecord.t
    type checksum_type_t = GLibChecksumType.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new checksumType = (GLibChecksumType.FFI.withVal ---> GLibChecksumRecord.FFI.fromPtr true) new_ checksumType
    fun copy self = (GLibChecksumRecord.FFI.withPtr ---> GLibChecksumRecord.FFI.fromPtr true) copy_ self
    fun getString self = (GLibChecksumRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getString_ self
    fun reset self = (GLibChecksumRecord.FFI.withPtr ---> I) reset_ self
    fun update self data =
      let
        val length = GUInt8CArrayN.length data
        val () =
          (
            GLibChecksumRecord.FFI.withPtr
             &&&> GUInt8CArrayN.FFI.withPtr
             &&&> GSSize.FFI.withVal
             ---> I
          )
            update_
            (
              self
               & data
               & length
            )
      in
        ()
      end
    fun typeGetLength checksumType = (GLibChecksumType.FFI.withVal ---> GSSize.FFI.fromVal) typeGetLength_ checksumType
  end
