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
        exception Value of GInt32.t
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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_icon_size_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val getValue_ = call (getSymbol "g_value_get_enum") (GObjectValueRecord.PolyML.cPtr --> PolyML.cVal)
      val setValue_ = call (getSymbol "g_value_set_enum") (GObjectValueRecord.PolyML.cPtr &&> PolyML.cVal --> PolyMLFFI.cVoid)
    end
    val t =
      GObjectValue.C.createAccessor
        {
          getType = (I ---> GObjectType.FFI.fromVal) getType_,
          getValue = (I ---> FFI.fromVal) getValue_,
          setValue = (I &&&> FFI.withVal ---> I) setValue_
        }
    local
      open PolyMLFFI
    in
      val fromName_ = call (getSymbol "gtk_icon_size_from_name") (Utf8.PolyML.cInPtr --> GInt32.PolyML.cVal)
      val getName_ = call (getSymbol "gtk_icon_size_get_name") (GInt32.PolyML.cVal --> Utf8.PolyML.cOutPtr)
      val lookup_ =
        call (getSymbol "gtk_icon_size_lookup")
          (
            GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val lookupForSettings_ =
        call (getSymbol "gtk_icon_size_lookup_for_settings")
          (
            GtkSettingsClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val register_ =
        call (getSymbol "gtk_icon_size_register")
          (
            Utf8.PolyML.cInPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             --> GInt32.PolyML.cVal
          )
      val registerAlias_ = call (getSymbol "gtk_icon_size_register_alias") (Utf8.PolyML.cInPtr &&> GInt32.PolyML.cVal --> PolyMLFFI.cVoid)
    end
    type 'a settings_class = 'a GtkSettingsClass.class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun fromName name = (Utf8.FFI.withPtr ---> GInt32.FFI.fromVal) fromName_ name
    fun getName size = (GInt32.FFI.withVal ---> Utf8.FFI.fromPtr 0) getName_ size
    fun lookup size =
      let
        val width
         & height
         & retVal =
          (
            GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            lookup_
            (
              size
               & GInt32.null
               & GInt32.null
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
             &&&> GInt32.FFI.withVal
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            lookupForSettings_
            (
              settings
               & size
               & GInt32.null
               & GInt32.null
            )
      in
        if retVal then SOME (width, height) else NONE
      end
    fun register name width height =
      (
        Utf8.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> GInt32.FFI.fromVal
      )
        register_
        (
          name
           & width
           & height
        )
    fun registerAlias alias target = (Utf8.FFI.withPtr &&&> GInt32.FFI.withVal ---> I) registerAlias_ (alias & target)
  end
