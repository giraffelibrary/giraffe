structure GLibQuark :>
  sig
    include G_LIB_QUARK

    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
      end
  end =
  struct
    structure C =
      struct
        type val_ = int
        fun withVal f = f
        fun fromVal w = w
      end

    structure PolyML =
      struct
        val VAL = CInterface.UINT
      end

    type t = int

    local
      open PolyMLFFI
    in
      val fromString_ = call (load_sym libglib "g_quark_from_string") (FFI.PolyML.String.INPTR --> PolyML.VAL)
      val toString_ = call (load_sym libglib "g_quark_to_string") (PolyML.VAL --> FFI.PolyML.String.RETPTR)
    end

    fun fromString string = (FFI.String.withConstPtr ---> C.fromVal) fromString_ string
    fun toString quark = (C.withVal ---> FFI.String.fromPtr false) toString_ quark
  end
