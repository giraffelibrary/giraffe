structure GLibQuark :> G_LIB_QUARK =
  struct
    open GUInt32
    type quark = t

    val fromString_ = _import "mlton_g_quark_from_string" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> FFI.val_;
    val toString_ = _import "g_quark_to_string" : FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;

    fun fromString string = (Utf8.FFI.withPtr ---> FFI.fromVal) fromString_ string
    fun toString quark = (FFI.withVal ---> Utf8.FFI.fromPtr 0) toString_ quark
  end
