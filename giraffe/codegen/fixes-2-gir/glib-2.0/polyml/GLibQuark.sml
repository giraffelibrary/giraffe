structure GLibQuark :>
  sig
    include G_LIB_QUARK

    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    open FFI.UInt32

    local
      open PolyMLFFI
    in
      val fromString_ = call (load_sym libglib "g_quark_from_string") (Utf8.PolyML.INPTR --> PolyML.VAL)
      val toString_ = call (load_sym libglib "g_quark_to_string") (PolyML.VAL --> Utf8.PolyML.RETPTR)
    end

    fun fromString string = (Utf8.C.withConstPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> Utf8.C.fromPtr false) toString_ quark
  end
