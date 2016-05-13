structure GtkIconSize :>
  sig
    include
      GTK_ICON_SIZE
        where type 'a settings_class = 'a GtkSettingsClass.class
    structure PolyML :
      sig
        val cVal : C.val_ PolyMLFFI.conversion
        val cRef : C.ref_ PolyMLFFI.conversion
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
        val cVal = FFI.Enum.PolyML.cVal
        val cRef = FFI.Enum.PolyML.cRef
      end
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_icon_size_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
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
    val null = INVALID
    local
      open PolyMLFFI
    in
      val fromName_ = call (load_sym libgtk "gtk_icon_size_from_name") (Utf8.PolyML.cInPtr --> FFI.Int32.PolyML.cVal)
      val getName_ = call (load_sym libgtk "gtk_icon_size_get_name") (FFI.Int32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val lookup_ =
        call (load_sym libgtk "gtk_icon_size_lookup")
          (
            FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val lookupForSettings_ =
        call (load_sym libgtk "gtk_icon_size_lookup_for_settings")
          (
            GtkSettingsClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val register_ =
        call (load_sym libgtk "gtk_icon_size_register")
          (
            Utf8.PolyML.cInPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             --> FFI.Int32.PolyML.cVal
          )
      val registerAlias_ = call (load_sym libgtk "gtk_icon_size_register_alias") (Utf8.PolyML.cInPtr &&> FFI.Int32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a settings_class = 'a GtkSettingsClass.class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun fromName name = (Utf8.C.withPtr ---> FFI.Int32.C.fromVal) fromName_ name
    fun getName size = (FFI.Int32.C.withVal ---> Utf8.C.fromPtr false) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookup_
            (
              size
               & FFI.Int32.null
               & FFI.Int32.null
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
            GtkSettingsClass.C.withPtr
             &&&> FFI.Int32.C.withVal
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & FFI.Int32.null
               & FFI.Int32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        Utf8.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         ---> FFI.Int32.C.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (Utf8.C.withPtr &&&> FFI.Int32.C.withVal ---> I) registerAlias_ (alias & target)
  end
