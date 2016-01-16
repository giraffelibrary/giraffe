structure GLibSliceConfig :>
  sig
    include G_LIB_SLICE_CONFIG
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      ALWAYS_MALLOC
    | BYPASS_MAGAZINES
    | WORKING_SET_MSECS
    | COLOR_INCREMENT
    | CHUNK_SIZES
    | CONTENTION_COUNTER
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            ALWAYS_MALLOC => f 1
          | BYPASS_MAGAZINES => f 2
          | WORKING_SET_MSECS => f 3
          | COLOR_INCREMENT => f 4
          | CHUNK_SIZES => f 5
          | CONTENTION_COUNTER => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            1 => ALWAYS_MALLOC
          | 2 => BYPASS_MAGAZINES
          | 3 => WORKING_SET_MSECS
          | 4 => COLOR_INCREMENT
          | 5 => CHUNK_SIZES
          | 6 => CONTENTION_COUNTER
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    val null = ALWAYS_MALLOC
  end
