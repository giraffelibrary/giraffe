structure AtkValueType :> ATK_VALUE_TYPE =
  struct
    datatype enum =
      VERY_WEAK
    | WEAK
    | ACCEPTABLE
    | STRONG
    | VERY_STRONG
    | VERY_LOW
    | LOW
    | MEDIUM
    | HIGH
    | VERY_HIGH
    | VERY_BAD
    | BAD
    | GOOD
    | VERY_GOOD
    | BEST
    | LAST_DEFINED
    structure Enum =
      Enum(
        type enum = enum
        val null = VERY_WEAK
        val toInt =
          fn
            VERY_WEAK => 0
          | WEAK => 1
          | ACCEPTABLE => 2
          | STRONG => 3
          | VERY_STRONG => 4
          | VERY_LOW => 5
          | LOW => 6
          | MEDIUM => 7
          | HIGH => 8
          | VERY_HIGH => 9
          | VERY_BAD => 10
          | BAD => 11
          | GOOD => 12
          | VERY_GOOD => 13
          | BEST => 14
          | LAST_DEFINED => 15
        exception Value of GInt.t
        val fromInt =
          fn
            0 => VERY_WEAK
          | 1 => WEAK
          | 2 => ACCEPTABLE
          | 3 => STRONG
          | 4 => VERY_STRONG
          | 5 => VERY_LOW
          | 6 => LOW
          | 7 => MEDIUM
          | 8 => HIGH
          | 9 => VERY_HIGH
          | 10 => VERY_BAD
          | 11 => BAD
          | 12 => GOOD
          | 13 => VERY_GOOD
          | 14 => BEST
          | 15 => LAST_DEFINED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "atk_value_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      ValueAccessor.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val getLocalizedName_ = call (getSymbol "atk_value_type_get_localized_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "atk_value_type_get_name") (PolyML.cVal --> Utf8.PolyML.cOutPtr)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getLocalizedName valueType = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getLocalizedName_ valueType
    fun getName valueType = (FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ valueType
  end
