structure GdkWindowHints :>
  sig
    include GDK_WINDOW_HINTS
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    val POS = 0w1
    val MINSIZE = 0w2
    val MAXSIZE = 0w4
    val BASESIZE = 0w8
    val ASPECT = 0w16
    val RESIZEINC = 0w32
    val WINGRAVITY = 0w64
    val USERPOS = 0w128
    val USERSIZE = 0w256
    val allFlags =
      [
        POS,
        MINSIZE,
        MAXSIZE,
        BASESIZE,
        ASPECT,
        RESIZEINC,
        WINGRAVITY,
        USERPOS,
        USERSIZE
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
      val getType_ = call (load_sym libgdk "gdk_window_hints_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
