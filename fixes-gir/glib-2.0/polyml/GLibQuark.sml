(* GLibQuark is an alias for GUInt32 so transparent signature matching is used.
 *)
structure GLibQuark : G_LIB_QUARK =
  struct
    open GUInt32
    type quark = t

    local
      open PolyMLFFI
    in
      val fromString_ = call (externalFunctionSymbol "g_quark_from_string") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val toString_ = call (externalFunctionSymbol "g_quark_to_string") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end

    local
      val call = Utf8.FFI.withPtr 0 ---> FFI.fromVal
    in
      fun fromString string = call fromString_ string
    end
    local
      val call = FFI.withVal ---> Utf8.FFI.fromPtr 0
    in
      fun toString quark = call toString_ quark
    end
  end
