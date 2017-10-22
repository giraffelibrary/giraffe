structure GtkRevealerTransitionType :> GTK_REVEALER_TRANSITION_TYPE =
  struct
    datatype enum =
      NONE
    | CROSSFADE
    | SLIDE_RIGHT
    | SLIDE_LEFT
    | SLIDE_UP
    | SLIDE_DOWN
    structure Enum =
      Enum(
        type enum = enum
        val null = NONE
        val toInt =
          fn
            NONE => 0
          | CROSSFADE => 1
          | SLIDE_RIGHT => 2
          | SLIDE_LEFT => 3
          | SLIDE_UP => 4
          | SLIDE_DOWN => 5
        exception Value of GInt32.t
        val fromInt =
          fn
            0 => NONE
          | 1 => CROSSFADE
          | 2 => SLIDE_RIGHT
          | 3 => SLIDE_LEFT
          | 4 => SLIDE_UP
          | 5 => SLIDE_DOWN
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_revealer_transition_type_get_type") (cVoid --> GObjectType.PolyML.cVal)
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
