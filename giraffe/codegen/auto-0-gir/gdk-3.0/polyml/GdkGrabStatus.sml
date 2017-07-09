structure GdkGrabStatus :> GDK_GRAB_STATUS =
  struct
    datatype enum =
      SUCCESS
    | ALREADY_GRABBED
    | INVALID_TIME
    | NOT_VIEWABLE
    | FROZEN
    structure Enum =
      Enum(
        type enum = enum
        val null = SUCCESS
        val toInt =
          fn
            SUCCESS => 0
          | ALREADY_GRABBED => 1
          | INVALID_TIME => 2
          | NOT_VIEWABLE => 3
          | FROZEN => 4
        exception Value of GInt.t
        val fromInt =
          fn
            0 => SUCCESS
          | 1 => ALREADY_GRABBED
          | 2 => INVALID_TIME
          | 3 => NOT_VIEWABLE
          | 4 => FROZEN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_grab_status_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
  end
