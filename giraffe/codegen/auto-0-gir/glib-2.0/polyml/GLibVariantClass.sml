structure GLibVariantClass :>
  sig
    include G_LIB_VARIANT_CLASS
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      BOOLEAN
    | BYTE
    | INT_16
    | UINT_16
    | INT_32
    | UINT_32
    | INT_64
    | UINT_64
    | HANDLE
    | DOUBLE
    | STRING
    | OBJECT_PATH
    | SIGNATURE
    | VARIANT
    | MAYBE
    | ARRAY
    | TUPLE
    | DICT_ENTRY
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            BOOLEAN => f 98
          | BYTE => f 121
          | INT_16 => f 110
          | UINT_16 => f 113
          | INT_32 => f 105
          | UINT_32 => f 117
          | INT_64 => f 120
          | UINT_64 => f 116
          | HANDLE => f 104
          | DOUBLE => f 100
          | STRING => f 115
          | OBJECT_PATH => f 111
          | SIGNATURE => f 103
          | VARIANT => f 118
          | MAYBE => f 109
          | ARRAY => f 97
          | TUPLE => f 40
          | DICT_ENTRY => f 123
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            98 => BOOLEAN
          | 121 => BYTE
          | 110 => INT_16
          | 113 => UINT_16
          | 105 => INT_32
          | 117 => UINT_32
          | 120 => INT_64
          | 116 => UINT_64
          | 104 => HANDLE
          | 100 => DOUBLE
          | 115 => STRING
          | 111 => OBJECT_PATH
          | 103 => SIGNATURE
          | 118 => VARIANT
          | 109 => MAYBE
          | 97 => ARRAY
          | 40 => TUPLE
          | 123 => DICT_ENTRY
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    val null = BOOLEAN
  end
