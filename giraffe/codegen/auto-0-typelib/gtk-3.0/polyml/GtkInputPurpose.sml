structure GtkInputPurpose :> GTK_INPUT_PURPOSE =
  struct
    datatype enum =
      FREE_FORM
    | ALPHA
    | DIGITS
    | NUMBER
    | PHONE
    | URL
    | EMAIL
    | NAME
    | PASSWORD
    | PIN
    structure Enum =
      Enum(
        type enum = enum
        val null = FREE_FORM
        val toInt =
          fn
            FREE_FORM => 0
          | ALPHA => 1
          | DIGITS => 2
          | NUMBER => 3
          | PHONE => 4
          | URL => 5
          | EMAIL => 6
          | NAME => 7
          | PASSWORD => 8
          | PIN => 9
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FREE_FORM
          | 1 => ALPHA
          | 2 => DIGITS
          | 3 => NUMBER
          | 4 => PHONE
          | 5 => URL
          | 6 => EMAIL
          | 7 => NAME
          | 8 => PASSWORD
          | 9 => PIN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_input_purpose_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
