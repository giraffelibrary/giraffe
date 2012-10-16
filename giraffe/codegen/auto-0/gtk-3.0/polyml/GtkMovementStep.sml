structure GtkMovementStep :>
  sig
    include GTK_MOVEMENT_STEP
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      LOGICALPOSITIONS
    | VISUALPOSITIONS
    | WORDS
    | DISPLAYLINES
    | DISPLAYLINEENDS
    | PARAGRAPHS
    | PARAGRAPHENDS
    | PAGES
    | BUFFERENDS
    | HORIZONTALPAGES
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            LOGICALPOSITIONS => f 0
          | VISUALPOSITIONS => f 1
          | WORDS => f 2
          | DISPLAYLINES => f 3
          | DISPLAYLINEENDS => f 4
          | PARAGRAPHS => f 5
          | PARAGRAPHENDS => f 6
          | PAGES => f 7
          | BUFFERENDS => f 8
          | HORIZONTALPAGES => f 9
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => LOGICALPOSITIONS
          | 1 => VISUALPOSITIONS
          | 2 => WORDS
          | 3 => DISPLAYLINES
          | 4 => DISPLAYLINEENDS
          | 5 => PARAGRAPHS
          | 6 => PARAGRAPHENDS
          | 7 => PAGES
          | 8 => BUFFERENDS
          | 9 => HORIZONTALPAGES
          | n => raise Value n
      end
    structure PolyML =
      struct
        val VAL = FFI.PolyML.Enum.VAL
        val REF = FFI.PolyML.Enum.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_movement_step_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = LOGICALPOSITIONS
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
