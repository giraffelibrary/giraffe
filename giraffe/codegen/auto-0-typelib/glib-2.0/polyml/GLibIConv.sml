structure GLibIConv :>
  G_LIB_I_CONV
    where type t = GLibIConvRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val close_ = call (getSymbol "g_iconv_close") (GLibIConvRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
    end
    type t = GLibIConvRecord.t
    fun close self = (GLibIConvRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) close_ self
  end
