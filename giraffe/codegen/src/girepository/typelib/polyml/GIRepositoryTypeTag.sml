structure GIRepositoryTypeTag :>
  sig
    include G_I_REPOSITORY_TYPE_TAG
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
      end
  end =
  struct
    datatype t =
      VOID
    | BOOLEAN
    | INT8
    | UINT8
    | INT16
    | UINT16
    | INT32
    | UINT32
    | INT64
    | UINT64
    | FLOAT
    | DOUBLE
    | GTYPE
    | UTF8
    | FILENAME
    | ARRAY
    | INTERFACE
    | GLIST
    | GSLIST
    | GHASH
    | ERROR
    | UNICHAR
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            VOID => f 0
          | BOOLEAN => f 1
          | INT8 => f 2
          | UINT8 => f 3
          | INT16 => f 4
          | UINT16 => f 5
          | INT32 => f 6
          | UINT32 => f 7
          | INT64 => f 8
          | UINT64 => f 9
          | FLOAT => f 10
          | DOUBLE => f 11
          | GTYPE => f 12
          | UTF8 => f 13
          | FILENAME => f 14
          | ARRAY => f 15
          | INTERFACE => f 16
          | GLIST => f 17
          | GSLIST => f 18
          | GHASH => f 19
          | ERROR => f 20
          | UNICHAR => f 21
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => VOID
          | 1 => BOOLEAN
          | 2 => INT8
          | 3 => UINT8
          | 4 => INT16
          | 5 => UINT16
          | 6 => INT32
          | 7 => UINT32
          | 8 => INT64
          | 9 => UINT64
          | 10 => FLOAT
          | 11 => DOUBLE
          | 12 => GTYPE
          | 13 => UTF8
          | 14 => FILENAME
          | 15 => ARRAY
          | 16 => INTERFACE
          | 17 => GLIST
          | 18 => GSLIST
          | 19 => GHASH
          | 20 => ERROR
          | 21 => UNICHAR
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
      val toString_ =
        call
          (load_sym libgirepository "g_type_tag_to_string")
          (FFI.Enum.PolyML.cVal --> Utf8.PolyML.cOutPtr);
    end
    val toString =
      fn typ =>
        (C.withVal ---> Utf8.C.fromPtr false) toString_ typ
  end
