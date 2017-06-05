structure GLibVariantClass :> G_LIB_VARIANT_CLASS =
  struct
    datatype enum =
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
    structure Enum =
      Enum(
        type enum = enum
        val null = BOOLEAN
        val toInt =
          fn
            BOOLEAN => 98
          | BYTE => 121
          | INT_16 => 110
          | UINT_16 => 113
          | INT_32 => 105
          | UINT_32 => 117
          | INT_64 => 120
          | UINT_64 => 116
          | HANDLE => 104
          | DOUBLE => 100
          | STRING => 115
          | OBJECT_PATH => 111
          | SIGNATURE => 103
          | VARIANT => 118
          | MAYBE => 109
          | ARRAY => 97
          | TUPLE => 40
          | DICT_ENTRY => 123
        exception Value of GInt32.t
        val fromInt =
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
      )
    open Enum
  end
