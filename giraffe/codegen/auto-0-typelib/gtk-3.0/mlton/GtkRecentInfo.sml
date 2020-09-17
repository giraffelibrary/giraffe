structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type t = GtkRecentInfoRecord.t =
  struct
    val getType_ = _import "gtk_recent_info_get_type" : unit -> GObjectType.FFI.val_;
    val createAppInfo_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_info_create_app_info" :
              GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GioAppInfoClass.FFI.opt GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val exists_ = _import "gtk_recent_info_exists" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val getAdded_ = _import "gtk_recent_info_get_added" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GInt64.FFI.val_;
    val getAge_ = _import "gtk_recent_info_get_age" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GInt32.FFI.val_;
    val getApplicationInfo_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_recent_info_get_application_info" :
              GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.r1
               * (Utf8.FFI.opt, Utf8.FFI.non_opt) Utf8.MLton.r2
               * GUInt32.FFI.ref_
               * GInt64.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7
            )
    val getApplications_ = fn x1 & x2 => (_import "gtk_recent_info_get_applications" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;) (x1, x2)
    val getDescription_ = _import "gtk_recent_info_get_description" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getDisplayName_ = _import "gtk_recent_info_get_display_name" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getGicon_ = _import "gtk_recent_info_get_gicon" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GioIconClass.FFI.opt GioIconClass.FFI.p;
    val getGroups_ = fn x1 & x2 => (_import "gtk_recent_info_get_groups" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p * GUInt64.FFI.ref_ -> Utf8CPtrArray.FFI.non_opt Utf8CPtrArray.FFI.out_p;) (x1, x2)
    val getIcon_ = fn x1 & x2 => (_import "gtk_recent_info_get_icon" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p * GInt32.FFI.val_ -> GdkPixbufPixbufClass.FFI.opt GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getMimeType_ = _import "gtk_recent_info_get_mime_type" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getModified_ = _import "gtk_recent_info_get_modified" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GInt64.FFI.val_;
    val getPrivateHint_ = _import "gtk_recent_info_get_private_hint" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val getShortName_ = _import "gtk_recent_info_get_short_name" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUri_ = _import "gtk_recent_info_get_uri" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getUriDisplay_ = _import "gtk_recent_info_get_uri_display" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getVisited_ = _import "gtk_recent_info_get_visited" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GInt64.FFI.val_;
    val hasApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_info_has_application" :
              GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasGroup_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_info_has_group" :
              GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isLocal_ = _import "gtk_recent_info_is_local" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val lastApplication_ = _import "gtk_recent_info_last_application" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val match_ = fn x1 & x2 => (_import "gtk_recent_info_match" : GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p * GtkRecentInfoRecord.FFI.non_opt GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.FFI.withPtr false
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromOptPtr true
      )
        createAppInfo_
        (
          self
           & appName
           & []
        )
    fun exists self = (GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) exists_ self
    fun getAdded self = (GtkRecentInfoRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.FFI.withPtr false ---> GInt32.FFI.fromVal) getAge_ self
    fun getApplicationInfo self appName =
      let
        val appExec
         & count
         & time
         & retVal =
          (
            GtkRecentInfoRecord.FFI.withPtr false
             &&&> Utf8.FFI.withPtr 0
             &&&> Utf8.FFI.withRefOptPtr 0
             &&&> GUInt32.FFI.withRefVal
             &&&> GInt64.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GUInt32.FFI.fromVal
                   && GInt64.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getApplicationInfo_
            (
              self
               & appName
               & NONE
               & GUInt32.null
               & GInt64.null
            )
      in
        (
          if retVal
          then
            SOME
              (
                appExec,
                count,
                time
              )
          else NONE
        )
         before GtkRecentInfoRecord.FFI.touchPtr self
         before Utf8.FFI.touchPtr appName
      end
    fun getApplications self =
      let
        val _ & retVal = (GtkRecentInfoRecord.FFI.withPtr false &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getApplications_ (self & GUInt64.null)
      in
        retVal
      end
    fun getDescription self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getDisplayName self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDisplayName_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getGicon self = (GtkRecentInfoRecord.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr true) getGicon_ self
    fun getGroups self =
      let
        val _ & retVal = (GtkRecentInfoRecord.FFI.withPtr false &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getGroups_ (self & GUInt64.null)
      in
        retVal
      end
    fun getIcon self size = (GtkRecentInfoRecord.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMimeType_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getModified self = (GtkRecentInfoRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUri_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getUriDisplay self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.FFI.withPtr false ---> GInt64.FFI.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.FFI.withPtr false &&&> GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) match_ (self & infoB)
  end
