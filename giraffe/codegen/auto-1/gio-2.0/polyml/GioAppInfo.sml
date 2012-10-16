structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class_t = 'a GioAppInfoClass.t
    where type appinfocreateflags_t = GioAppInfoCreateFlags.t
    where type 'a applaunchcontextclass_t = 'a GioAppLaunchContextClass.t
    where type 'a iconclass_t = 'a GioIconClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createFromCommandline_ =
        call (load_sym libgio "g_app_info_create_from_commandline")
          (
            FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GioAppInfoCreateFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDefaultForType_ = call (load_sym libgio "g_app_info_get_default_for_type") (FFI.PolyML.String.INPTR &&> FFI.PolyML.Bool.VAL --> GObjectObjectClass.PolyML.PTR)
      val getDefaultForUriScheme_ = call (load_sym libgio "g_app_info_get_default_for_uri_scheme") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val launchDefaultForUri_ =
        call (load_sym libgio "g_app_info_launch_default_for_uri")
          (
            FFI.PolyML.String.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val resetTypeAssociations_ = call (load_sym libgio "g_app_info_reset_type_associations") (FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val addSupportsType_ =
        call (load_sym libgio "g_app_info_add_supports_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val canDelete_ = call (load_sym libgio "g_app_info_can_delete") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val canRemoveSupportsType_ = call (load_sym libgio "g_app_info_can_remove_supports_type") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val delete_ = call (load_sym libgio "g_app_info_delete") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val dup_ = call (load_sym libgio "g_app_info_dup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val equal_ = call (load_sym libgio "g_app_info_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getCommandline_ = call (load_sym libgio "g_app_info_get_commandline") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getDescription_ = call (load_sym libgio "g_app_info_get_description") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getDisplayName_ = call (load_sym libgio "g_app_info_get_display_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getExecutable_ = call (load_sym libgio "g_app_info_get_executable") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getIcon_ = call (load_sym libgio "g_app_info_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getId_ = call (load_sym libgio "g_app_info_get_id") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getName_ = call (load_sym libgio "g_app_info_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val removeSupportsType_ =
        call (load_sym libgio "g_app_info_remove_supports_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setAsDefaultForExtension_ =
        call (load_sym libgio "g_app_info_set_as_default_for_extension")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setAsDefaultForType_ =
        call (load_sym libgio "g_app_info_set_as_default_for_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val setAsLastUsedForType_ =
        call (load_sym libgio "g_app_info_set_as_last_used_for_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val shouldShow_ = call (load_sym libgio "g_app_info_should_show") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val supportsFiles_ = call (load_sym libgio "g_app_info_supports_files") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val supportsUris_ = call (load_sym libgio "g_app_info_supports_uris") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
    type 'a class_t = 'a GioAppInfoClass.t
    type appinfocreateflags_t = GioAppInfoCreateFlags.t
    type 'a applaunchcontextclass_t = 'a GioAppLaunchContextClass.t
    type 'a iconclass_t = 'a GioIconClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createFromCommandline commandline applicationName flags =
      (
        FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GioAppInfoCreateFlags.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        createFromCommandline_
        (
          commandline
           & applicationName
           & flags
           & []
        )
    fun getDefaultForType contentType mustSupportUris = (FFI.String.withConstPtr &&&> FFI.Bool.withVal ---> GioAppInfoClass.C.fromPtr true) getDefaultForType_ (contentType & mustSupportUris)
    fun getDefaultForUriScheme uriScheme = (FFI.String.withConstPtr ---> GioAppInfoClass.C.fromPtr true) getDefaultForUriScheme_ uriScheme
    fun launchDefaultForUri uri launchContext =
      (
        FFI.String.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        launchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun resetTypeAssociations contentType = (FFI.String.withConstPtr ---> I) resetTypeAssociations_ contentType
    fun addSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        addSupportsType_
        (
          self
           & contentType
           & []
        )
    fun canDelete self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canDelete_ self
    fun canRemoveSupportsType self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) canRemoveSupportsType_ self
    fun delete self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) delete_ self
    fun dup self = (GObjectObjectClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) dup_ self
    fun equal self appinfo2 = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) equal_ (self & appinfo2)
    fun getCommandline self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getCommandline_ self
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDescription_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getDisplayName_ self
    fun getExecutable self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getExecutable_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getId_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getName_ self
    fun removeSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        setAsLastUsedForType_
        (
          self
           & contentType
           & []
        )
    fun shouldShow self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) shouldShow_ self
    fun supportsFiles self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) supportsFiles_ self
    fun supportsUris self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) supportsUris_ self
  end
