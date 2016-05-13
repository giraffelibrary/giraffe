structure GdkGravity :>
  sig
    include GDK_GRAVITY
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      NORTH_WEST
    | NORTH
    | NORTH_EAST
    | WEST
    | CENTER
    | EAST
    | SOUTH_WEST
    | SOUTH
    | SOUTH_EAST
    | STATIC
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NORTH_WEST => f 1
          | NORTH => f 2
          | NORTH_EAST => f 3
          | WEST => f 4
          | CENTER => f 5
          | EAST => f 6
          | SOUTH_WEST => f 7
          | SOUTH => f 8
          | SOUTH_EAST => f 9
          | STATIC => f 10
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            1 => NORTH_WEST
          | 2 => NORTH
          | 3 => NORTH_EAST
          | 4 => WEST
          | 5 => CENTER
          | 6 => EAST
          | 7 => SOUTH_WEST
          | 8 => SOUTH
          | 9 => SOUTH_EAST
          | 10 => STATIC
          | n => raise Value n
      end
    structure PolyML =
      struct
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgdk "gdk_gravity_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (load_sym libgobject "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (load_sym libgobject "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = NORTH_WEST
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
