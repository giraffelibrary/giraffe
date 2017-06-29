structure PangoBidiType :> PANGO_BIDI_TYPE =
  struct
    datatype enum =
      L
    | LRE
    | LRO
    | R
    | AL
    | RLE
    | RLO
    | PDF
    | EN
    | ES
    | ET
    | AN
    | CS
    | NSM
    | BN
    | B
    | S
    | WS
    | ON
    structure Enum =
      Enum(
        type enum = enum
        val null = L
        val toInt =
          fn
            L => 0
          | LRE => 1
          | LRO => 2
          | R => 3
          | AL => 4
          | RLE => 5
          | RLO => 6
          | PDF => 7
          | EN => 8
          | ES => 9
          | ET => 10
          | AN => 11
          | CS => 12
          | NSM => 13
          | BN => 14
          | B => 15
          | S => 16
          | WS => 17
          | ON => 18
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => L
          | 1 => LRE
          | 2 => LRO
          | 3 => R
          | 4 => AL
          | 5 => RLE
          | 6 => RLO
          | 7 => PDF
          | 8 => EN
          | 9 => ES
          | 10 => ET
          | 11 => AN
          | 12 => CS
          | 13 => NSM
          | 14 => BN
          | 15 => B
          | 16 => S
          | 17 => WS
          | 18 => ON
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "pango_bidi_type_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val forUnichar_ = call (getSymbol "pango_bidi_type_for_unichar") (GChar.PolyML.cVal --> PolyML.cVal)
    end
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun forUnichar ch = (GChar.FFI.withVal ---> FFI.fromVal) forUnichar_ ch
  end
