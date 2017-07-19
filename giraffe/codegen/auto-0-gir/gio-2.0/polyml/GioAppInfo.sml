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
      val getType_ = call (getSymbol "g_app_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val createFromCommandline_ =
        call (getSymbol "g_app_info_create_from_commandline")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GioAppInfoCreateFlags.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cPtr
          )
      val getDefaultForType_ = call (getSymbol "g_app_info_get_default_for_type") (Utf8.PolyML.cInPtr &&> GBool.PolyML.cVal --> GioAppInfoClass.PolyML.cPtr)
      val getDefaultForUriScheme_ = call (getSymbol "g_app_info_get_default_for_uri_scheme") (Utf8.PolyML.cInPtr --> GioAppInfoClass.PolyML.cPtr)
      val launchDefaultForUri_ =
        call (getSymbol "g_app_info_launch_default_for_uri")
          (
            Utf8.PolyML.cInPtr
             &&> GioAppLaunchContextClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val resetTypeAssociations_ = call (getSymbol "g_app_info_reset_type_associations") (Utf8.PolyML.cInPtr --> cVoid)
      val addSupportsType_ =
        call (getSymbol "g_app_info_add_supports_type")
          (
            GioAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val canDelete_ = call (getSymbol "g_app_info_can_delete") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val canRemoveSupportsType_ = call (getSymbol "g_app_info_can_remove_supports_type") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val delete_ = call (getSymbol "g_app_info_delete") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val dup_ = call (getSymbol "g_app_info_dup") (GioAppInfoClass.PolyML.cPtr --> GioAppInfoClass.PolyML.cPtr)
      val equal_ = call (getSymbol "g_app_info_equal") (GioAppInfoClass.PolyML.cPtr &&> GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getCommandline_ = call (getSymbol "g_app_info_get_commandline") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDescription_ = call (getSymbol "g_app_info_get_description") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (getSymbol "g_app_info_get_display_name") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getExecutable_ = call (getSymbol "g_app_info_get_executable") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getIcon_ = call (getSymbol "g_app_info_get_icon") (GioAppInfoClass.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getId_ = call (getSymbol "g_app_info_get_id") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getName_ = call (getSymbol "g_app_info_get_name") (GioAppInfoClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val removeSupportsType_ =
        call (getSymbol "g_app_info_remove_supports_type")
          (
            GioAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAsDefaultForExtension_ =
        call (getSymbol "g_app_info_set_as_default_for_extension")
          (
            GioAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAsDefaultForType_ =
        call (getSymbol "g_app_info_set_as_default_for_type")
          (
            GioAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setAsLastUsedForType_ =
        call (getSymbol "g_app_info_set_as_last_used_for_type")
          (
            GioAppInfoClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val shouldShow_ = call (getSymbol "g_app_info_should_show") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsFiles_ = call (getSymbol "g_app_info_supports_files") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val supportsUris_ = call (getSymbol "g_app_info_supports_uris") (GioAppInfoClass.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type 'a class = 'a GioAppInfoClass.class
    type app_info_create_flags_t = GioAppInfoCreateFlags.t
    type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    type 'a icon_class = 'a GioIconClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createFromCommandline
      (
        commandline,
        applicationName,
        flags
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GioAppInfoCreateFlags.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromPtr true
      )
        createFromCommandline_
        (
          commandline
           & applicationName
           & flags
           & []
        )
    fun getDefaultForType (contentType, mustSupportUris) = (Utf8.FFI.withPtr &&&> GBool.FFI.withVal ---> GioAppInfoClass.FFI.fromPtr true) getDefaultForType_ (contentType & mustSupportUris)
    fun getDefaultForUriScheme uriScheme = (Utf8.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) getDefaultForUriScheme_ uriScheme
    fun launchDefaultForUri (uri, launchContext) =
      (
        Utf8.FFI.withPtr
         &&&> GioAppLaunchContextClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        launchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun resetTypeAssociations contentType = (Utf8.FFI.withPtr ---> I) resetTypeAssociations_ contentType
    fun addSupportsType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        addSupportsType_
        (
          self
           & contentType
           & []
        )
    fun canDelete self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) canDelete_ self
    fun canRemoveSupportsType self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) canRemoveSupportsType_ self
    fun delete self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) delete_ self
    fun dup self = (GioAppInfoClass.FFI.withPtr ---> GioAppInfoClass.FFI.fromPtr true) dup_ self
    fun equal self appinfo2 = (GioAppInfoClass.FFI.withPtr &&&> GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) equal_ (self & appinfo2)
    fun getCommandline self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getCommandline_ self
    fun getDescription self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getDisplayName self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getExecutable self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getExecutable_ self
    fun getIcon self = (GioAppInfoClass.FFI.withPtr ---> GioIconClass.FFI.fromPtr false) getIcon_ self
    fun getId self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getId_ self
    fun getName self = (GioAppInfoClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getName_ self
    fun removeSupportsType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        removeSupportsType_
        (
          self
           & contentType
           & []
        )
    fun setAsDefaultForExtension self extension =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setAsDefaultForExtension_
        (
          self
           & extension
           & []
        )
    fun setAsDefaultForType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setAsDefaultForType_
        (
          self
           & contentType
           & []
        )
    fun setAsLastUsedForType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
      )
        setAsLastUsedForType_
        (
          self
           & contentType
           & []
        )
    fun shouldShow self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) shouldShow_ self
    fun supportsFiles self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsFiles_ self
    fun supportsUris self = (GioAppInfoClass.FFI.withPtr ---> GBool.FFI.fromVal) supportsUris_ self
  end
