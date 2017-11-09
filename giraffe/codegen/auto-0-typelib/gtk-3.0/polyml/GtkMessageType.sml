structure GtkMessageType :> GTK_MESSAGE_TYPE =
  struct
    datatype enum =
      INFO
    | WARNING
    | QUESTION
    | ERROR
    | OTHER
    structure Enum =
      Enum(
        type enum = enum
        val null = INFO
        val toInt =
          fn
            INFO => 0
          | WARNING => 1
          | QUESTION => 2
          | ERROR => 3
          | OTHER => 4
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => INFO
          | 1 => WARNING
          | 2 => QUESTION
          | 3 => ERROR
          | 4 => OTHER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_message_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
