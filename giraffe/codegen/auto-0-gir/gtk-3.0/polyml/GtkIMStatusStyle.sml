structure GtkIMStatusStyle :> GTK_I_M_STATUS_STYLE =
  struct
    datatype enum =
      NOTHING
    | CALLBACK
    | NONE
    structure Enum =
      Enum(
        type enum = enum
        val null = NOTHING
        val toInt =
          fn
            NOTHING => 0
          | CALLBACK => 1
          | NONE => 2
        exception Value of GInt.t
        val fromInt =
          fn
            0 => NOTHING
          | 1 => CALLBACK
          | 2 => NONE
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_im_status_style_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
