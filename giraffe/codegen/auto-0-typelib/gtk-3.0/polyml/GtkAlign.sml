structure GtkAlign :> GTK_ALIGN =
  struct
    datatype enum =
      FILL
    | START
    | END
    | CENTER
    structure Enum =
      Enum(
        type enum = enum
        val null = FILL
        val toInt =
          fn
            FILL => 0
          | START => 1
          | END => 2
          | CENTER => 3
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => FILL
          | 1 => START
          | 2 => END
          | 3 => CENTER
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_align_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
