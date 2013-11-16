structure GLibSliceConfig :>
  sig
    include G_LIB_SLICE_CONFIG
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      ALWAYSMALLOC
    | BYPASSMAGAZINES
    | WORKINGSETMSECS
    | COLORINCREMENT
    | CHUNKSIZES
    | CONTENTIONCOUNTER
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ALWAYSMALLOC => f 1
          | BYPASSMAGAZINES => f 2
          | WORKINGSETMSECS => f 3
          | COLORINCREMENT => f 4
          | CHUNKSIZES => f 5
          | CONTENTIONCOUNTER => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            1 => ALWAYSMALLOC
          | 2 => BYPASSMAGAZINES
          | 3 => WORKINGSETMSECS
          | 4 => COLORINCREMENT
          | 5 => CHUNKSIZES
          | 6 => CONTENTIONCOUNTER
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = ALWAYSMALLOC
  end
