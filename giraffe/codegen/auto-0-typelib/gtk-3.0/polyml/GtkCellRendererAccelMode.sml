structure GtkCellRendererAccelMode :> GTK_CELL_RENDERER_ACCEL_MODE =
  struct
    datatype enum =
      GTK
    | OTHER
    structure Enum =
      Enum(
        type enum = enum
        val null = GTK
        val toInt =
          fn
            GTK => 0
          | OTHER => 1
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => GTK
          | 1 => OTHER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_cell_renderer_accel_mode_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
