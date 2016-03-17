structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class = 'a GioAppInfoClass.class
    where type app_info_create_flags_t = GioAppInfoCreateFlags.t
    where type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createFromCommandline_ =
        call (load_sym libgio "g_app_info_create_from_commandline")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioAppInfoCreateFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getDefaultForType_ = call (load_sym libgio "g_app_info_get_default_for_type") (Utf8.PolyML.cInPtr &&> FFI.Bool.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val getDefaultForUriScheme_ = call (load_sym libgio "g_app_info_get_default_for_uri_scheme") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val launchDefaultForUri_ =
        call (load_sym libgio "g_app_info_launch_default_for_uri")
          (
            Utf8.PolyML.cInPtr
             &&> GObjectObjectClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val resetTypeAssociations_ = call (load_sym libgio "g_app_info_reset_type_associations") (Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val addSupportsType_ =
        call (load_sym libgio "g_app_info_add_supports_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val canDelete_ = call (load_sym libgio "g_app_info_can_delete") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val canRemoveSupportsType_ = call (load_sym libgio "g_app_info_can_remove_supports_type") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val delete_ = call (load_sym libgio "g_app_info_delete") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val dup_ = call (load_sym libgio "g_app_info_dup") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val equal_ = call (load_sym libgio "g_app_info_equal") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getCommandline_ = call (load_sym libgio "g_app_info_get_commandline") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDescription_ = call (load_sym libgio "g_app_info_get_description") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (load_sym libgio "g_app_info_get_display_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getExecutable_ = call (load_sym libgio "g_app_info_get_executable") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIcon_ = call (load_sym libgio "g_app_info_get_icon") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getId_ = call (load_sym libgio "g_app_info_get_id") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (load_sym libgio "g_app_info_get_name") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val removeSupportsType_ =
        call (load_sym libgio "g_app_info_remove_supports_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAsDefaultForExtension_ =
        call (load_sym libgio "g_app_info_set_as_default_for_extension")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAsDefaultForType_ =
        call (load_sym libgio "g_app_info_set_as_default_for_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setAsLastUsedForType_ =
        call (load_sym libgio "g_app_info_set_as_last_used_for_type")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val shouldShow_ = call (load_sym libgio "g_app_info_should_show") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsFiles_ = call (load_sym libgio "g_app_info_supports_files") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val supportsUris_ = call (load_sym libgio "g_app_info_supports_uris") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type 'a class = 'a GioAppInfoClass.class
    type app_info_create_flags_t = GioAppInfoCreateFlags.t
    type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createFromCommandline commandline applicationName flags =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GioAppInfoCreateFlags.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        createFromCommandline_
        (
          commandline
           & applicationName
           & flags
           & []
        )
    fun getDefaultForType contentType mustSupportUris = (Utf8.C.withPtr &&&> FFI.Bool.C.withVal ---> GioAppInfoClass.C.fromPtr true) getDefaultForType_ (contentType & mustSupportUris)
    fun getDefaultForUriScheme uriScheme = (Utf8.C.withPtr ---> GioAppInfoClass.C.fromPtr true) getDefaultForUriScheme_ uriScheme
    fun launchDefaultForUri uri launchContext =
      (
        Utf8.C.withPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        launchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun resetTypeAssociations contentType = (Utf8.C.withPtr ---> I) resetTypeAssociations_ contentType
    fun addSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        addSupportsType_
        (
          self
           & contentType
           & []
        )
    fun canDelete self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canDelete_ self
    fun canRemoveSupportsType self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) canRemoveSupportsType_ self
    fun delete self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) delete_ self
    fun dup self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) dup_ self
    fun equal self appinfo2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & appinfo2)
    fun getCommandline self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getCommandline_ self
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getExecutable self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getExecutable_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun removeSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeSupportsType_
        (
          self
           & contentType
           & []
        )
    fun setAsDefaultForExtension self extension =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAsDefaultForExtension_
        (
          self
           & extension
           & []
        )
    fun setAsDefaultForType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAsDefaultForType_
        (
          self
           & contentType
           & []
        )
    fun setAsLastUsedForType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setAsLastUsedForType_
        (
          self
           & contentType
           & []
        )
    fun shouldShow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) shouldShow_ self
    fun supportsFiles self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsFiles_ self
    fun supportsUris self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsUris_ self
  end
