structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type record_t = GtkRecentInfoRecord.t =
  struct
    val getType_ = _import "gtk_recent_info_get_type" : unit -> GObjectType.C.val_;
    val createAppInfo_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_info_create_app_info" :
              GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val exists_ = _import "gtk_recent_info_exists" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.C.val_;
    val getAdded_ = _import "gtk_recent_info_get_added" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Long.C.val_;
    val getAge_ = _import "gtk_recent_info_get_age" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Int.C.val_;
    val getApplicationInfo_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_recent_info_get_application_info" :
              GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.r1
               * (unit, GCharVec.C.notnull) GCharVec.MLton.r2
               * FFI.UInt.C.ref_
               * FFI.Long.C.ref_
               -> FFI.Bool.C.val_;
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
    val getDescription_ = _import "gtk_recent_info_get_description" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getDisplayName_ = _import "gtk_recent_info_get_display_name" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getGicon_ = _import "gtk_recent_info_get_gicon" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIcon_ = fn x1 & x2 => (_import "gtk_recent_info_get_icon" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p * FFI.Int.C.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getMimeType_ = _import "gtk_recent_info_get_mime_type" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getModified_ = _import "gtk_recent_info_get_modified" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Long.C.val_;
    val getPrivateHint_ = _import "gtk_recent_info_get_private_hint" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.C.val_;
    val getShortName_ = _import "gtk_recent_info_get_short_name" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUri_ = _import "gtk_recent_info_get_uri" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getUriDisplay_ = _import "gtk_recent_info_get_uri_display" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getVisited_ = _import "gtk_recent_info_get_visited" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Long.C.val_;
    val hasApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_info_has_application" :
              GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
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
              GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isLocal_ = _import "gtk_recent_info_is_local" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.C.val_;
    val lastApplication_ = _import "gtk_recent_info_last_application" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val match_ = fn x1 & x2 => (_import "gtk_recent_info_match" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p * GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.C.val_;) (x1, x2)
    type record_t = GtkRecentInfoRecord.t
    type t = record_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.C.withPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        createAppInfo_
        (
          self
           & appName
           & []
        )
    fun exists self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) exists_ self
    fun getAdded self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Long.C.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int.C.fromVal) getAge_ self
    fun getApplicationInfo self appName =
      let
        val appExec
         & count
         & time
         & retVal =
          (
            GtkRecentInfoRecord.C.withPtr
             &&&> FFI.String.C.withConstPtr
             &&&> FFI.String.C.withRefConstOptPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.Long.C.withRefVal
             ---> FFI.String.C.fromPtr false
                   && FFI.UInt.C.fromVal
                   && FFI.Long.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getApplicationInfo_
            (
              self
               & appName
               & NONE
               & FFI.UInt.null
               & FFI.Long.null
            )
      in
        if retVal
        then
          SOME
            (
              appExec,
              count,
              time
            )
        else NONE
      end
    fun getDescription self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getDescription_ self
    fun getDisplayName self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getDisplayName_ self
    fun getGicon self = (GtkRecentInfoRecord.C.withPtr ---> GioIconClass.C.fromPtr true) getGicon_ self
    fun getIcon self size = (GtkRecentInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Long.C.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Long.C.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.C.withPtr &&&> GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) match_ (self & infoB)
  end
