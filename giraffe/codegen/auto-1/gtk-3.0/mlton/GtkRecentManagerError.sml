structure GtkRecentManagerError :>
  sig
    include GTK_RECENT_MANAGER_ERROR
  end =
  struct
    datatype t =
      NOTFOUND
    | INVALIDURI
    | INVALIDENCODING
    | NOTREGISTERED
    | READ
    | WRITE
    | UNKNOWN
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            NOTFOUND => f 0
          | INVALIDURI => f 1
          | INVALIDENCODING => f 2
          | NOTREGISTERED => f 3
          | READ => f 4
          | WRITE => f 5
          | UNKNOWN => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => NOTFOUND
          | 1 => INVALIDURI
          | 2 => INVALIDENCODING
          | 3 => NOTREGISTERED
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
