structure GLibQuark :>
  sig
    include G_LIB_QUARK
  end =
  struct
    open FFI.UInt32

    val fromString_ = _import "mlton_g_quark_from_string" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> C.val_;
    val toString_ = _import "g_quark_to_string" : C.val_ -> Utf8.C.notnull Utf8.C.out_p;

    fun fromString string = (Utf8.C.withPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> Utf8.C.fromPtr false) toString_ quark
  end
