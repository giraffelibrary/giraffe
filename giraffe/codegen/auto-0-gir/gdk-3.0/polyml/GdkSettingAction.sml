structure GdkSettingAction :> GDK_SETTING_ACTION =
  struct
    datatype enum =
      NEW
    | CHANGED
    | DELETED
    structure Enum =
      Enum(
        type enum = enum
        val null = NEW
        val toInt =
          fn
            NEW => 0
          | CHANGED => 1
          | DELETED => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NEW
          | 1 => CHANGED
          | 2 => DELETED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_setting_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
