structure GLibIConv :>
  G_LIB_I_CONV
    where type t = GLibIConvRecord.t =
  struct
    val close_ = _import "g_iconv_close" : GLibIConvRecord.FFI.non_opt GLibIConvRecord.FFI.p -> GInt32.FFI.val_;
    type t = GLibIConvRecord.t
    fun close self = (GLibIConvRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) close_ self
  end
