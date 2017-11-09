structure GtkLicense :> GTK_LICENSE =
  struct
    datatype enum =
      UNKNOWN
    | CUSTOM
    | GPL_2_0
    | GPL_3_0
    | LGPL_2_1
    | LGPL_3_0
    | BSD
    | MIT_X_11
    | ARTISTIC
    structure Enum =
      Enum(
        type enum = enum
        val null = UNKNOWN
        val toInt =
          fn
            UNKNOWN => 0
          | CUSTOM => 1
          | GPL_2_0 => 2
          | GPL_3_0 => 3
          | LGPL_2_1 => 4
          | LGPL_3_0 => 5
          | BSD => 6
          | MIT_X_11 => 7
          | ARTISTIC => 8
        exception Value of GInt.t
        val fromInt =
          fn
            0 => UNKNOWN
          | 1 => CUSTOM
          | 2 => GPL_2_0
          | 3 => GPL_3_0
          | 4 => LGPL_2_1
          | 5 => LGPL_3_0
          | 6 => BSD
          | 7 => MIT_X_11
          | 8 => ARTISTIC
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_license_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
