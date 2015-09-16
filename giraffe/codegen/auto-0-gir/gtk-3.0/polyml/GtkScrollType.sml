structure GtkScrollType :>
  sig
    include GTK_SCROLL_TYPE
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NONE
    | JUMP
    | STEP_BACKWARD
    | STEP_FORWARD
    | PAGE_BACKWARD
    | PAGE_FORWARD
    | STEP_UP
    | STEP_DOWN
    | PAGE_UP
    | PAGE_DOWN
    | STEP_LEFT
    | STEP_RIGHT
    | PAGE_LEFT
    | PAGE_RIGHT
    | START
    | END
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NONE => f 0
          | JUMP => f 1
          | STEP_BACKWARD => f 2
          | STEP_FORWARD => f 3
          | PAGE_BACKWARD => f 4
          | PAGE_FORWARD => f 5
          | STEP_UP => f 6
          | STEP_DOWN => f 7
          | PAGE_UP => f 8
          | PAGE_DOWN => f 9
          | STEP_LEFT => f 10
          | STEP_RIGHT => f 11
          | PAGE_LEFT => f 12
          | PAGE_RIGHT => f 13
          | START => f 14
          | END => f 15
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NONE
          | 1 => JUMP
          | 2 => STEP_BACKWARD
          | 3 => STEP_FORWARD
          | 4 => PAGE_BACKWARD
          | 5 => PAGE_FORWARD
          | 6 => STEP_UP
          | 7 => STEP_DOWN
          | 8 => PAGE_UP
          | 9 => PAGE_DOWN
          | 10 => STEP_LEFT
          | 11 => STEP_RIGHT
          | 12 => PAGE_LEFT
          | 13 => PAGE_RIGHT
          | 14 => START
          | 15 => END
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_scroll_type_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NONE
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
