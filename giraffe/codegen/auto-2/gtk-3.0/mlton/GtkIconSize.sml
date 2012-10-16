structure GtkIconSize :>
  sig
    include
      GTK_ICON_SIZE
        where type 'a settingsclass_t = 'a GtkSettingsClass.t
  end =
  struct
    datatype t =
      INVALID
    | MENU
    | SMALLTOOLBAR
    | LARGETOOLBAR
    | BUTTON
    | DND
    | DIALOG
    structure C =
      struct
        type val_ = FFI.Enum.val_
        type ref_ = FFI.Enum.ref_
        exception Value of FFI.Enum.val_
        fun withVal f =
          fn
            INVALID => f 0
          | MENU => f 1
          | SMALLTOOLBAR => f 2
          | LARGETOOLBAR => f 3
          | BUTTON => f 4
          | DND => f 5
          | DIALOG => f 6
        fun withRefVal f = withVal (FFI.Enum.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => MENU
          | 2 => SMALLTOOLBAR
          | 3 => LARGETOOLBAR
          | 4 => BUTTON
          | 5 => DND
          | 6 => DIALOG
          | n => raise Value n
      end
    val getType_ = _import "gtk_icon_size_get_type" : unit -> GObjectType.C.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p -> C.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.C.notnull GObjectValueRecord.C.p * C.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.C.fromVal) getType_,
          getValue = (I ---> C.fromVal) getValue_,
          setValue = (I &&&> C.withVal ---> I) setValue_
        }
    val null = INVALID
    val fromName_ = _import "mlton_gtk_icon_size_from_name" : cstring * unit CPointer.t -> FFI.Int32.val_;
    val getName_ = _import "gtk_icon_size_get_name" : FFI.Int32.val_ -> FFI.String.notnull FFI.String.out_p;
    val lookup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_size_lookup" :
              FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupForSettings_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_icon_size_lookup_for_settings" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.val_
               * FFI.Int32.ref_
               * FFI.Int32.ref_
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val register_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_gtk_icon_size_register" :
              cstring
               * unit CPointer.t
               * FFI.Int32.val_
               * FFI.Int32.val_
               -> FFI.Int32.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val registerAlias_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_icon_size_register_alias" :
              cstring
               * unit CPointer.t
               * FFI.Int32.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a settingsclass_t = 'a GtkSettingsClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun fromName name = (FFI.String.withConstPtr ---> FFI.Int32.fromVal) fromName_ name
    fun getName size = (FFI.Int32.withVal ---> FFI.String.fromPtr false) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            lookup_
            (
              size
               & 0
               & 0
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun lookupForSettings settings size =
      let
        val width
         & height
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.withVal
             &&&> FFI.Int32.withRefVal
             &&&> FFI.Int32.withRefVal
             ---> FFI.Int32.fromVal
                   && FFI.Int32.fromVal
                   && FFI.Bool.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & 0
               & 0
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        FFI.String.withConstPtr
         &&&> FFI.Int32.withVal
         &&&> FFI.Int32.withVal
         ---> FFI.Int32.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (FFI.String.withConstPtr &&&> FFI.Int32.withVal ---> I) registerAlias_ (alias & target)
  end
