structure GtkExpanderStyle :> GTK_EXPANDER_STYLE =
  struct
    datatype enum =
      COLLAPSED
    | SEMI_COLLAPSED
    | SEMI_EXPANDED
    | EXPANDED
    structure Enum =
      Enum(
        type enum = enum
        val null = COLLAPSED
        val toInt =
          fn
            COLLAPSED => 0
          | SEMI_COLLAPSED => 1
          | SEMI_EXPANDED => 2
          | EXPANDED => 3
        exception Value of GInt.t
        val fromInt =
          fn
            0 => COLLAPSED
          | 1 => SEMI_COLLAPSED
          | 2 => SEMI_EXPANDED
          | 3 => EXPANDED
          | n => raise Value n
      )
    open Enum
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_expander_style_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
