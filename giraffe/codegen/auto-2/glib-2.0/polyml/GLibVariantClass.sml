structure GLibVariantClass :>
  sig
    include G_LIB_VARIANT_CLASS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      BOOLEAN
    | BYTE
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | HANDLE
    | DOUBLE
    | STRING
    | OBJECTPATH
    | SIGNATURE
    | VARIANT
    | MAYBE
    | ARRAY
    | TUPLE
    | DICTENTRY
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            BOOLEAN => f 98
          | BYTE => f 121
          | INT16 => f 110
          | UINT16 => f 113
          | INT32 => f 105
          | UINT32 => f 117
          | INT64 => f 120
          | UINT64 => f 116
          | HANDLE => f 104
          | DOUBLE => f 100
          | STRING => f 115
          | OBJECTPATH => f 111
          | SIGNATURE => f 103
          | VARIANT => f 118
          | MAYBE => f 109
          | ARRAY => f 97
          | TUPLE => f 40
          | DICTENTRY => f 123
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            98 => BOOLEAN
          | 121 => BYTE
          | 110 => INT16
          | 113 => UINT16
          | 105 => INT32
          | 117 => UINT32
          | 120 => INT64
          | 116 => UINT64
          | 104 => HANDLE
          | 100 => DOUBLE
          | 115 => STRING
          | 111 => OBJECTPATH
          | 103 => SIGNATURE
          | 118 => VARIANT
          | 109 => MAYBE
          | 97 => ARRAY
          | 40 => TUPLE
          | 123 => DICTENTRY
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    val null = BOOLEAN
  end
