structure GioAppInfo :>
  GIO_APP_INFO
    where type 'a class = 'a GioAppInfoClass.class
    where type app_info_create_flags_t = GioAppInfoCreateFlags.t
    where type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    where type 'a async_result_class = 'a GioAsyncResultClass.class
    where type 'a icon_class = 'a GioIconClass.class =
  struct
    structure Utf8CVectorType =
      CPointerCVectorType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVector = CVector(Utf8CVectorType)
    val getType_ = _import "g_app_info_get_type" : unit -> GObjectType.FFI.val_;
    val createFromCommandline_ =
      fn
        (x1, x2)
         & (x3, x4)
         & x5
         & x6 =>
          (
            _import "mlton_g_app_info_create_from_commandline" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * GioAppInfoCreateFlags.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
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
               * Utf8.FFI.notnull Utf8.MLton.p2
               * GBool.FFI.val_
               -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getDefaultForUriScheme_ = _import "mlton_g_app_info_get_default_for_uri_scheme" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
    val launchDefaultForUri_ =
      fn
        (x1, x2)
         & x3
         & x4 =>
          (
            _import "mlton_g_app_info_launch_default_for_uri" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GioAppLaunchContextClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val launchDefaultForUriFinish_ = fn x1 & x2 => (_import "g_app_info_launch_default_for_uri_finish" : GioAsyncResultClass.FFI.notnull GioAsyncResultClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val resetTypeAssociations_ = _import "mlton_g_app_info_reset_type_associations" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> unit;
    val addSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_add_supports_type" :
              GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val canDelete_ = _import "g_app_info_can_delete" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    val canRemoveSupportsType_ = _import "g_app_info_can_remove_supports_type" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    val delete_ = _import "g_app_info_delete" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    val dup_ = _import "g_app_info_dup" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p;
    val equal_ = fn x1 & x2 => (_import "g_app_info_equal" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p * GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getCommandline_ = _import "g_app_info_get_commandline" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getDescription_ = _import "g_app_info_get_description" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getDisplayName_ = _import "g_app_info_get_display_name" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getExecutable_ = _import "g_app_info_get_executable" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getIcon_ = _import "g_app_info_get_icon" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GioIconClass.FFI.notnull GioIconClass.FFI.p;
    val getId_ = _import "g_app_info_get_id" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getName_ = _import "g_app_info_get_name" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getSupportedTypes_ = _import "g_app_info_get_supported_types" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> Utf8CVector.FFI.notnull Utf8CVector.FFI.out_p;
    val removeSupportsType_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_app_info_remove_supports_type" :
              GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val shouldShow_ = _import "g_app_info_should_show" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    val supportsFiles_ = _import "g_app_info_supports_files" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    val supportsUris_ = _import "g_app_info_supports_uris" : GioAppInfoClass.FFI.notnull GioAppInfoClass.FFI.p -> GBool.FFI.val_;
    type 'a class = 'a GioAppInfoClass.class
    type app_info_create_flags_t = GioAppInfoCreateFlags.t
    type 'a app_launch_context_class = 'a GioAppLaunchContextClass.class
    type 'a async_result_class = 'a GioAsyncResultClass.class
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
         ---> ignore
      )
        launchDefaultForUri_
        (
          uri
           & launchContext
           & []
        )
    fun launchDefaultForUriFinish result = (GioAsyncResultClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) launchDefaultForUriFinish_ (result & [])
    fun resetTypeAssociations contentType = (Utf8.FFI.withPtr ---> I) resetTypeAssociations_ contentType
    fun addSupportsType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
    fun getSupportedTypes self = (GioAppInfoClass.FFI.withPtr ---> Utf8CVector.FFI.fromPtr 0) getSupportedTypes_ self
    fun removeSupportsType self contentType =
      (
        GioAppInfoClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
         ---> ignore
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
         ---> ignore
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
         ---> ignore
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
