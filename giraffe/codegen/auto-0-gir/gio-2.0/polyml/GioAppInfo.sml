structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class_t = 'a GioAppInfoClass.t
    where type app_info_create_flags_t = GioAppInfoCreateFlags.t
    where type 'a app_launch_context_class_t = 'a GioAppLaunchContextClass.t
    where type 'a icon_class_t = 'a GioIconClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_app_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createFromCommandline_ =
        call (load_sym libgio "g_app_info_create_from_commandline")
          (
            FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.INOPTPTR
             &&> GioAppInfoCreateFlags.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val getDefaultForType_ = call (load_sym libgio "g_app_info_get_default_for_type") (FFI.String.PolyML.INPTR &&> FFI.Bool.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getDefaultForUriScheme_ = call (load_sym libgio "g_app_info_get_default_for_uri_scheme") (FFI.String.PolyML.INPTR --> GObjectObjectClass.PolyML.PTR)
      val launchDefaultForUri_ =
        call (load_sym libgio "g_app_info_launch_default_for_uri")
          (
            FFI.String.PolyML.INPTR
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val resetTypeAssociations_ = call (load_sym libgio "g_app_info_reset_type_associations") (FFI.String.PolyML.INPTR --> FFI.PolyML.VOID)
      val addSupportsType_ =
        call (load_sym libgio "g_app_info_add_supports_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val canDelete_ = call (load_sym libgio "g_app_info_can_delete") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val canRemoveSupportsType_ = call (load_sym libgio "g_app_info_can_remove_supports_type") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val delete_ = call (load_sym libgio "g_app_info_delete") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val dup_ = call (load_sym libgio "g_app_info_dup") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val equal_ = call (load_sym libgio "g_app_info_equal") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getCommandline_ = call (load_sym libgio "g_app_info_get_commandline") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getDescription_ = call (load_sym libgio "g_app_info_get_description") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getDisplayName_ = call (load_sym libgio "g_app_info_get_display_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getExecutable_ = call (load_sym libgio "g_app_info_get_executable") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getIcon_ = call (load_sym libgio "g_app_info_get_icon") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getId_ = call (load_sym libgio "g_app_info_get_id") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getName_ = call (load_sym libgio "g_app_info_get_name") (GObjectObjectClass.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val removeSupportsType_ =
        call (load_sym libgio "g_app_info_remove_supports_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAsDefaultForExtension_ =
        call (load_sym libgio "g_app_info_set_as_default_for_extension")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAsDefaultForType_ =
        call (load_sym libgio "g_app_info_set_as_default_for_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setAsLastUsedForType_ =
        call (load_sym libgio "g_app_info_set_as_last_used_for_type")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val shouldShow_ = call (load_sym libgio "g_app_info_should_show") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsFiles_ = call (load_sym libgio "g_app_info_supports_files") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val supportsUris_ = call (load_sym libgio "g_app_info_supports_uris") (GObjectObjectClass.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
    type 'a class_t = 'a GioAppInfoClass.t
    type app_info_create_flags_t = GioAppInfoCreateFlags.t
    type 'a app_launch_context_class_t = 'a GioAppLaunchContextClass.t
    type 'a icon_class_t = 'a GioIconClass.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createFromCommandline commandline applicationName flags =
      (
        FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
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
    fun getDefaultForType contentType mustSupportUris = (FFI.String.C.withConstPtr &&&> FFI.Bool.C.withVal ---> GioAppInfoClass.C.fromPtr true) getDefaultForType_ (contentType & mustSupportUris)
    fun getDefaultForUriScheme uriScheme = (FFI.String.C.withConstPtr ---> GioAppInfoClass.C.fromPtr true) getDefaultForUriScheme_ uriScheme
    fun launchDefaultForUri uri launchContext =
      (
        FFI.String.C.withConstPtr
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        launchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun resetTypeAssociations contentType = (FFI.String.C.withConstPtr ---> I) resetTypeAssociations_ contentType
    fun addSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
    fun getCommandline self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getCommandline_ self
    fun getDescription self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getDisplayName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getExecutable self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getExecutable_ self
    fun getIcon self = (GObjectObjectClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getId self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getId_ self
    fun getName self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getName_ self
    fun removeSupportsType self contentType =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
