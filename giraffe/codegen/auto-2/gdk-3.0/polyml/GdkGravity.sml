structure GdkGravity :>
  sig
    include GDK_GRAVITY
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      NORTHWEST
    | NORTH
    | NORTHEAST
    | WEST
    | CENTER
    | EAST
    | SOUTHWEST
    | SOUTH
    | SOUTHEAST
    | STATIC
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NORTHWEST => f 1
          | NORTH => f 2
          | NORTHEAST => f 3
          | WEST => f 4
          | CENTER => f 5
          | EAST => f 6
          | SOUTHWEST => f 7
          | SOUTH => f 8
          | SOUTHEAST => f 9
          | STATIC => f 10
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            1 => NORTHWEST
          | 2 => NORTH
          | 3 => NORTHEAST
          | 4 => WEST
          | 5 => CENTER
          | 6 => EAST
          | 7 => SOUTHWEST
          | 8 => SOUTH
          | 9 => SOUTHEAST
          | 10 => STATIC
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
      val getType_ = call (load_sym libgdk "gdk_gravity_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = NORTHWEST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
