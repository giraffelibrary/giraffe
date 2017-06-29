(* GLibQuark is an alias for GUInt32 so transparent signature matching is used.
 *)
structure GLibQuark : G_LIB_QUARK =
  struct
    open GUInt32
    type quark = t

    local
      open PolyMLFFI
    in
      val fromString_ = call (getSymbol "g_quark_from_string") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val toString_ = call (getSymbol "g_quark_to_string") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end

    fun fromString string = (Utf8.FFI.withPtr ---> FFI.fromVal) fromString_ string
    fun toString quark = (FFI.withVal ---> Utf8.FFI.fromPtr 0) toString_ quark
  end
