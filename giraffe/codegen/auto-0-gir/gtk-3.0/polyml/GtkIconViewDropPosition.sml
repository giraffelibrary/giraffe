structure GtkIconViewDropPosition :> GTK_ICON_VIEW_DROP_POSITION =
  struct
    datatype enum =
      NO_DROP
    | DROP_INTO
    | DROP_LEFT
    | DROP_RIGHT
    | DROP_ABOVE
    | DROP_BELOW
    structure Enum =
      Enum(
        type enum = enum
        val null = NO_DROP
        val toInt =
          fn
            NO_DROP => 0
          | DROP_INTO => 1
          | DROP_LEFT => 2
          | DROP_RIGHT => 3
          | DROP_ABOVE => 4
          | DROP_BELOW => 5
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NO_DROP
          | 1 => DROP_INTO
          | 2 => DROP_LEFT
          | 3 => DROP_RIGHT
          | 4 => DROP_ABOVE
          | 5 => DROP_BELOW
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_view_drop_position_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
