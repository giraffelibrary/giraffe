structure GtkFileChooserAction :> GTK_FILE_CHOOSER_ACTION =
  struct
    datatype enum =
      OPEN
    | SAVE
    | SELECT_FOLDER
    | CREATE_FOLDER
    structure Enum =
      Enum(
        type enum = enum
        val null = OPEN
        val toInt =
          fn
            OPEN => 0
          | SAVE => 1
          | SELECT_FOLDER => 2
          | CREATE_FOLDER => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => OPEN
          | 1 => SAVE
          | 2 => SELECT_FOLDER
          | 3 => CREATE_FOLDER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_file_chooser_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
