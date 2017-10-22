structure GdkWindowWindowClass :> GDK_WINDOW_WINDOW_CLASS =
  struct
    datatype enum =
      INPUT_OUTPUT
    | INPUT_ONLY
    structure Enum =
      Enum(
        type enum = enum
        val null = INPUT_OUTPUT
        val toInt =
          fn
            INPUT_OUTPUT => 0
          | INPUT_ONLY => 1
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INPUT_OUTPUT
          | 1 => INPUT_ONLY
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_window_window_class_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
