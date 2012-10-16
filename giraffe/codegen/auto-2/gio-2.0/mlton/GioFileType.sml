structure GioFileType :>
  sig
    include GIO_FILE_TYPE
  end =
  struct
    datatype t =
      UNKNOWN
    | REGULAR
    | DIRECTORY
    | SYMBOLICLINK
    | SPECIAL
    | SHORTCUT
    | MOUNTABLE
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            UNKNOWN => f 0
          | REGULAR => f 1
          | DIRECTORY => f 2
          | SYMBOLICLINK => f 3
          | SPECIAL => f 4
          | SHORTCUT => f 5
          | MOUNTABLE => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => UNKNOWN
          | 1 => REGULAR
          | 2 => DIRECTORY
          | 3 => SYMBOLICLINK
          | 4 => SPECIAL
          | 5 => SHORTCUT
          | 6 => MOUNTABLE
          | n => raise Value n
      end
    val getType_ = _import "g_file_type_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = UNKNOWN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
