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
      val fromString_ = call (load_sym libglib "g_quark_from_string") (FFI.String.PolyML.INPTR --> PolyML.VAL)
      val toString_ = call (load_sym libglib "g_quark_to_string") (PolyML.VAL --> FFI.String.PolyML.RETPTR)
    end

    fun fromString string = (FFI.String.C.withConstPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> FFI.String.C.fromPtr false) toString_ quark
  end
