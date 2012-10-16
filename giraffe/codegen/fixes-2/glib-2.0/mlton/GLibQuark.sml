structure GLibQuark :>
  sig
    include G_LIB_QUARK
  end =
  struct
    structure C =
      struct
        type val_ = Word32.word
        fun withVal f = f
        fun fromVal w = w
      end

    type t = Word32.word

    val fromString_ = _import "mlton_g_quark_from_string" : cstring * unit CPointer.t -> C.val_;
    val toString_ = _import "g_quark_to_string" : C.val_ -> FFI.String.notnull FFI.String.out_p;

    fun fromString string = (FFI.String.withConstPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> FFI.String.fromPtr false) toString_ quark
  end
