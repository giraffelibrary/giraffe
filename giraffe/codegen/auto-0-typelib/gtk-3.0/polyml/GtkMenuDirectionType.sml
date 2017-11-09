structure GtkMenuDirectionType :> GTK_MENU_DIRECTION_TYPE =
  struct
    datatype enum =
      PARENT
    | CHILD
    | NEXT
    | PREV
    structure Enum =
      Enum(
        type enum = enum
        val null = PARENT
        val toInt =
          fn
            PARENT => 0
          | CHILD => 1
          | NEXT => 2
          | PREV => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PARENT
          | 1 => CHILD
          | 2 => NEXT
          | 3 => PREV
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_direction_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
