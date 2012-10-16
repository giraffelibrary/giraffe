structure GtkFileChooserAction :>
  sig
    include GTK_FILE_CHOOSER_ACTION
  end =
  struct
    datatype t =
      OPEN
    | SAVE
    | SELECTFOLDER
    | CREATEFOLDER
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            OPEN => f 0
          | SAVE => f 1
          | SELECTFOLDER => f 2
          | CREATEFOLDER => f 3
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => OPEN
          | 1 => SAVE
          | 2 => SELECTFOLDER
          | 3 => CREATEFOLDER
          | n => raise Value n
      end
    val getType_ = _import "gtk_file_chooser_action_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = OPEN
    val getType = (I ---> GObjectType.C.fromVal) getType_
  end
