structure GtkIconSize :>
  GTK_ICON_SIZE
    where type 'a settings_class = 'a GtkSettingsClass.class =
  struct
    datatype enum =
      INVALID
    | MENU
    | SMALL_TOOLBAR
    | LARGE_TOOLBAR
    | BUTTON
    | DND
    | DIALOG
    structure Enum =
      Enum(
        type enum = enum
        val null = INVALID
        val toInt =
          fn
            INVALID => 0
          | MENU => 1
          | SMALL_TOOLBAR => 2
          | LARGE_TOOLBAR => 3
          | BUTTON => 4
          | DND => 5
          | DIALOG => 6
        exception Value of GInt.t
        val fromInt =
          fn
            0 => INVALID
          | 1 => MENU
          | 2 => SMALL_TOOLBAR
          | 3 => LARGE_TOOLBAR
          | 4 => BUTTON
          | 5 => DND
          | 6 => DIALOG
          | n => raise Value n
      )
    open Enum
    val getType_ = _import "gtk_icon_size_get_type" : unit -> GObjectType.FFI.val_;
    val getValue_ = _import "g_value_get_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p -> FFI.val_;
    val setValue_ = fn x1 & x2 => (_import "g_value_set_enum" : GObjectValueRecord.FFI.notnull GObjectValueRecord.FFI.p * FFI.val_ -> unit;) (x1, x2)
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    val fromName_ = _import "mlton_gtk_icon_size_from_name" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GInt.FFI.val_;
    val getName_ = _import "gtk_icon_size_get_name" : GInt.FFI.val_ -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val lookup_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_icon_size_lookup" :
              GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
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
              GtkSettingsClass.FFI.notnull GtkSettingsClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> GBool.FFI.val_;
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
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> GInt.FFI.val_;
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
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a settings_class = 'a GtkSettingsClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun fromName name = (Utf8.FFI.withPtr ---> GInt.FFI.fromVal) fromName_ name
    fun getName size = (GInt.FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            lookup_
            (
              size
               & GInt.null
               & GInt.null
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
            GtkSettingsClass.FFI.withPtr
             &&&> GInt.FFI.withVal
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & GInt.null
               & GInt.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        Utf8.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> GInt.FFI.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (Utf8.FFI.withPtr &&&> GInt.FFI.withVal ---> I) registerAlias_ (alias & target)
  end
