structure GtkIconSize :>
  sig
    include
      GTK_ICON_SIZE
        where type 'a settings_class_t = 'a GtkSettingsClass.t
    structure PolyML :
      sig
        val VAL : C.val_ CInterface.Conversion
        val REF : C.ref_ CInterface.Conversion
      end
  end =
  struct
    datatype t =
      INVALID
    | MENU
    | SMALL_TOOLBAR
    | LARGE_TOOLBAR
    | BUTTON
    | DND
    | DIALOG
    structure C =
      struct
        type val_ = FFI.Enum.C.val_
        type ref_ = FFI.Enum.C.ref_
        exception Value of FFI.Enum.C.val_
        fun withVal f =
          fn
            INVALID => f 0
          | MENU => f 1
          | SMALL_TOOLBAR => f 2
          | LARGE_TOOLBAR => f 3
          | BUTTON => f 4
          | DND => f 5
          | DIALOG => f 6
        fun withRefVal f = withVal (FFI.Enum.C.withRef f)
        val fromVal =
          fn
            0 => INVALID
          | 1 => MENU
          | 2 => SMALL_TOOLBAR
          | 3 => LARGE_TOOLBAR
          | 4 => BUTTON
          | 5 => DND
          | 6 => DIALOG
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
      val getType_ = call (load_sym libgtk "gtk_icon_size_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
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
    val null = INVALID
    local
      open PolyMLFFI
    in
      val fromName_ = call (load_sym libgtk "gtk_icon_size_from_name") (FFI.String.PolyML.INPTR --> FFI.Int.PolyML.VAL)
      val getName_ = call (load_sym libgtk "gtk_icon_size_get_name") (FFI.Int.PolyML.VAL --> FFI.String.PolyML.RETPTR)
      val lookup_ =
        call (load_sym libgtk "gtk_icon_size_lookup")
          (
            FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val lookupForSettings_ =
        call (load_sym libgtk "gtk_icon_size_lookup_for_settings")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val register_ =
        call (load_sym libgtk "gtk_icon_size_register")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             --> FFI.Int.PolyML.VAL
          )
      val registerAlias_ = call (load_sym libgtk "gtk_icon_size_register_alias") (FFI.String.PolyML.INPTR &&> FFI.Int.PolyML.VAL --> FFI.PolyML.VOID)
    end
    type 'a settings_class_t = 'a GtkSettingsClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun fromName name = (FFI.String.C.withConstPtr ---> FFI.Int.C.fromVal) fromName_ name
    fun getName size = (FFI.Int.C.withVal ---> FFI.String.C.fromPtr false) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookup_
            (
              size
               & FFI.Int.null
               & FFI.Int.null
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
             &&&> FFI.Int.C.withVal
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & FFI.Int.null
               & FFI.Int.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         ---> FFI.Int.C.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (FFI.String.C.withConstPtr &&&> FFI.Int.C.withVal ---> I) registerAlias_ (alias & target)
  end
