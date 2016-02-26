structure GLibQuark :>
  sig
    include G_LIB_QUARK

    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    open FFI.UInt32

    local
      open PolyMLFFI
    in
      val fromString_ = call (load_sym libglib "g_quark_from_string") (Utf8.PolyML.cInPtr --> PolyML.cVal)
      val toString_ = call (load_sym libglib "g_quark_to_string") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end

    fun fromString string = (Utf8.C.withPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> Utf8.C.fromPtr false) toString_ quark
  end
