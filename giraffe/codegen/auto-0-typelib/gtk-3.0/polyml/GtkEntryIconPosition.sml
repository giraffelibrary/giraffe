structure GtkEntryIconPosition :> GTK_ENTRY_ICON_POSITION =
  struct
    datatype enum =
      PRIMARY
    | SECONDARY
    structure Enum =
      Enum(
        type enum = enum
        val null = PRIMARY
        val toInt =
          fn
            PRIMARY => 0
          | SECONDARY => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => PRIMARY
          | 1 => SECONDARY
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_entry_icon_position_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
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
