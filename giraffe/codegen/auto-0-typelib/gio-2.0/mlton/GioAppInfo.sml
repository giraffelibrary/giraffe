structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class_t = 'a GioAppInfoClass.t
    where type appinfocreateflags_t = GioAppInfoCreateFlags.t
    where type 'a applaunchcontextclass_t = 'a GioAppLaunchContextClass.t
    where type 'a iconclass_t = 'a GioIconClass.t =
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
              cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t
               * GioAppInfoCreateFlags.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
              cstring
               * unit CPointer.t
               * FFI.Bool.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultForUriScheme_ = _import "mlton_g_app_info_get_default_for_uri_scheme" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val launchDefaultForUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_app_info_launch_default_for_uri" :
              cstring
               * unit CPointer.t
               * unit GObjectObjectClass.C.p
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val resetTypeAssociations_ = _import "mlton_g_app_info_reset_type_associations" : cstring * unit CPointer.t -> unit;
    val addSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_add_supports_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val canDelete_ = _import "g_app_info_can_delete" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val canRemoveSupportsType_ = _import "g_app_info_can_remove_supports_type" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val delete_ = _import "g_app_info_delete" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val dup_ = _import "g_app_info_dup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val equal_ = fn x1 & x2 => (_import "g_app_info_equal" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;) (x1, x2)
    val getCommandline_ = _import "g_app_info_get_commandline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDescription_ = _import "g_app_info_get_description" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDisplayName_ = _import "g_app_info_get_display_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getExecutable_ = _import "g_app_info_get_executable" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getIcon_ = _import "g_app_info_get_icon" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getId_ = _import "g_app_info_get_id" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getName_ = _import "g_app_info_get_name" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val removeSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_remove_supports_type" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val shouldShow_ = _import "g_app_info_should_show" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsFiles_ = _import "g_app_info_supports_files" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val supportsUris_ = _import "g_app_info_supports_uris" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    type 'a class_t = 'a GioAppInfoClass.t
    type appinfocreateflags_t = GioAppInfoCreateFlags.t
    type 'a applaunchcontextclass_t = 'a GioAppLaunchContextClass.t
    type 'a iconclass_t = 'a GioIconClass.t
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
