structure GtkRecentManagerError :>
  sig
    include GTK_RECENT_MANAGER_ERROR
    structure PolyML :
      sig
        val VAL : C.val_ PolyMLFFI.conversion
        val REF : C.ref_ PolyMLFFI.conversion
      end
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
    structure PolyML =
      struct
        val VAL = FFI.Enum.PolyML.VAL
        val REF = FFI.Enum.PolyML.REF
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_manager_error_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
