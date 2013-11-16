structure GdkEventMask :>
  sig
    include GDK_EVENT_MASK
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val EXPOSUREMASK = 0w2
    val POINTERMOTIONMASK = 0w4
    val POINTERMOTIONHINTMASK = 0w8
    val BUTTONMOTIONMASK = 0w16
    val BUTTON1MOTIONMASK = 0w32
    val BUTTON2MOTIONMASK = 0w64
    val BUTTON3MOTIONMASK = 0w128
    val BUTTONPRESSMASK = 0w256
    val BUTTONRELEASEMASK = 0w512
    val KEYPRESSMASK = 0w1024
    val KEYRELEASEMASK = 0w2048
    val ENTERNOTIFYMASK = 0w4096
    val LEAVENOTIFYMASK = 0w8192
    val FOCUSCHANGEMASK = 0w16384
    val STRUCTUREMASK = 0w32768
    val PROPERTYCHANGEMASK = 0w65536
    val VISIBILITYNOTIFYMASK = 0w131072
    val PROXIMITYINMASK = 0w262144
    val PROXIMITYOUTMASK = 0w524288
    val SUBSTRUCTUREMASK = 0w1048576
    val SCROLLMASK = 0w2097152
    val ALLEVENTSMASK = 0w4194302
    val allFlags =
      [
        EXPOSUREMASK,
        POINTERMOTIONMASK,
        POINTERMOTIONHINTMASK,
        BUTTONMOTIONMASK,
        BUTTON1MOTIONMASK,
        BUTTON2MOTIONMASK,
        BUTTON3MOTIONMASK,
        BUTTONPRESSMASK,
        BUTTONRELEASEMASK,
        KEYPRESSMASK,
        KEYRELEASEMASK,
        ENTERNOTIFYMASK,
        LEAVENOTIFYMASK,
        FOCUSCHANGEMASK,
        STRUCTUREMASK,
        PROPERTYCHANGEMASK,
        VISIBILITYNOTIFYMASK,
        PROXIMITYINMASK,
        PROXIMITYOUTMASK,
        SUBSTRUCTUREMASK,
        SCROLLMASK,
        ALLEVENTSMASK
      ]
    structure BitFlags =
      Word32BitFlags (
        val allFlags = allFlags
      )
    open BitFlags
    type t = flags
    structure C =
      struct
        type val_ = FFI.Flags.C.val_
        type ref_ = FFI.Flags.C.ref_
        fun withVal f = f
        fun withRefVal f = withVal (FFI.Flags.C.withRef f)
        fun fromVal w = w
      end
    structure PolyML =
      struct
        val VAL = FFI.Flags.PolyML.VAL
        val REF = FFI.Flags.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_event_mask_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val getValue_ = call (load_sym libgobject "g_value_get_flags") (GObjectValueRecord.PolyML.PTR --> PolyML.VAL)
      val setValue_ = call (load_sym libgobject "g_value_set_flags") (GObjectValueRecord.PolyML.PTR &&> PolyML.VAL --> FFI.PolyML.VOID)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
