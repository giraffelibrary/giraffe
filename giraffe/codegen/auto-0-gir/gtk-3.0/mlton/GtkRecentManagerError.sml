structure GtkRecentManagerError :>
  sig
    include GTK_RECENT_MANAGER_ERROR
  end =
  struct
    datatype t =
      NOT_FOUND
    | INVALID_URI
    | INVALID_ENCODING
    | NOT_REGISTERED
    | READ
    | WRITE
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            NOT_FOUND => f 0
          | INVALID_URI => f 1
          | INVALID_ENCODING => f 2
          | NOT_REGISTERED => f 3
          | READ => f 4
          | WRITE => f 5
          | UNKNOWN => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => NOT_FOUND
          | 1 => INVALID_URI
          | 2 => INVALID_ENCODING
          | 3 => NOT_REGISTERED
          | 4 => READ
          | 5 => WRITE
          | 6 => UNKNOWN
          | n => raise Value n
      end
    val getType_ = _import "gtk_recent_manager_error_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    exception Error of t
    val handler =
      GLibErrorRecord.makeHandler
        (
          "gtk-recent-manager-error-quark",
          C.fromVal,
          Error
        )
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
exception GtkRecentManagerError = GtkRecentManagerError.Error
