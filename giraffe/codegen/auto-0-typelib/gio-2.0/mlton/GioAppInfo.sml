structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class = 'a GioAppInfoClass.class
    where type app_info_create_flags_t = GioAppInfoCreateFlags.t
    where type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    val getType_ = _import "g_app_info_get_type" : unit -> GObjectType.C.val_;
    val createFromCommandline_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_app_info_create_from_commandline" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioAppInfoCreateFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getDefaultForType_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_app_info_get_default_for_type" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * FFI.Bool.C.val_
               -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultForUriScheme_ = _import "mlton_g_app_info_get_default_for_uri_scheme" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
    val launchDefaultForUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_app_info_launch_default_for_uri" :
              Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * unit GioAppLaunchContextClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resetTypeAssociations_ = _import "mlton_g_app_info_reset_type_associations" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> unit;
    val addSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_add_supports_type" :
              GioAppInfoClass.C.notnull GioAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val canDelete_ = _import "g_app_info_can_delete" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
    val canRemoveSupportsType_ = _import "g_app_info_can_remove_supports_type" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
    val delete_ = _import "g_app_info_delete" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
    val dup_ = _import "g_app_info_dup" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> GioAppInfoClass.C.notnull GioAppInfoClass.C.p;
    val equal_ = fn x1 & x2 => (_import "g_app_info_equal" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p * GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getCommandline_ = _import "g_app_info_get_commandline" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getDescription_ = _import "g_app_info_get_description" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getDisplayName_ = _import "g_app_info_get_display_name" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getExecutable_ = _import "g_app_info_get_executable" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getIcon_ = _import "g_app_info_get_icon" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> GioIconClass.C.notnull GioIconClass.C.p;
    val getId_ = _import "g_app_info_get_id" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val getName_ = _import "g_app_info_get_name" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> Utf8.C.notnull Utf8.C.out_p;
    val removeSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_remove_supports_type" :
              GioAppInfoClass.C.notnull GioAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAsDefaultForExtension_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_set_as_default_for_extension" :
              GioAppInfoClass.C.notnull GioAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAsDefaultForType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_set_as_default_for_type" :
              GioAppInfoClass.C.notnull GioAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAsLastUsedForType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_set_as_last_used_for_type" :
              GioAppInfoClass.C.notnull GioAppInfoClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val shouldShow_ = _import "g_app_info_should_show" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
    val supportsFiles_ = _import "g_app_info_supports_files" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
    val supportsUris_ = _import "g_app_info_supports_uris" : GioAppInfoClass.C.notnull GioAppInfoClass.C.p -> FFI.Bool.C.val_;
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
         &&&> GioAppLaunchContextClass.C.withOptPtr
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
        GioAppInfoClass.C.withPtr
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
    fun canDelete self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) canDelete_ self
    fun canRemoveSupportsType self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) canRemoveSupportsType_ self
    fun delete self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) delete_ self
    fun dup self = (GioAppInfoClass.C.withPtr ---> GioAppInfoClass.C.fromPtr true) dup_ self
    fun equal self appinfo2 = (GioAppInfoClass.C.withPtr &&&> GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) equal_ (self & appinfo2)
    fun getCommandline self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getCommandline_ self
    fun getDescription self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getDisplayName self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getExecutable self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getExecutable_ self
    fun getIcon self = (GioAppInfoClass.C.withPtr ---> GioIconClass.C.fromPtr false) getIcon_ self
    fun getId self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getId_ self
    fun getName self = (GioAppInfoClass.C.withPtr ---> Utf8.C.fromPtr false) getName_ self
    fun removeSupportsType self contentType =
      (
        GioAppInfoClass.C.withPtr
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
        GioAppInfoClass.C.withPtr
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
        GioAppInfoClass.C.withPtr
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
        GioAppInfoClass.C.withPtr
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
    fun shouldShow self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) shouldShow_ self
    fun supportsFiles self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsFiles_ self
    fun supportsUris self = (GioAppInfoClass.C.withPtr ---> FFI.Bool.C.fromVal) supportsUris_ self
  end
