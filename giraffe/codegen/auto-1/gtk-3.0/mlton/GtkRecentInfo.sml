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
               * cstring
               * unit CPointer.t
               * (unit, unit) GLibErrorRecord.C.r
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val exists_ = _import "gtk_recent_info_exists" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.val_;
    val getAdded_ = _import "gtk_recent_info_get_added" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Int64.val_;
    val getAge_ = _import "gtk_recent_info_get_age" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Int32.val_;
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
               * cstring
               * unit CPointer.t
               * cstring
               * unit CPointer.t ref
               * FFI.UInt32.ref_
               * FFI.Int64.ref_
               -> FFI.Bool.val_;
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
    val getDescription_ = _import "gtk_recent_info_get_description" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getDisplayName_ = _import "gtk_recent_info_get_display_name" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getGicon_ = _import "gtk_recent_info_get_gicon" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getIcon_ = fn x1 & x2 => (_import "gtk_recent_info_get_icon" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p * FFI.Int32.val_ -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val getMimeType_ = _import "gtk_recent_info_get_mime_type" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getModified_ = _import "gtk_recent_info_get_modified" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Int64.val_;
    val getPrivateHint_ = _import "gtk_recent_info_get_private_hint" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.val_;
    val getShortName_ = _import "gtk_recent_info_get_short_name" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getUri_ = _import "gtk_recent_info_get_uri" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getUriDisplay_ = _import "gtk_recent_info_get_uri_display" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val getVisited_ = _import "gtk_recent_info_get_visited" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Int64.val_;
    val hasApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_info_has_application" :
              GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
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
               * cstring
               * unit CPointer.t
               -> FFI.Bool.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isLocal_ = _import "gtk_recent_info_is_local" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.val_;
    val lastApplication_ = _import "gtk_recent_info_last_application" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.String.notnull FFI.String.out_p;
    val match_ = fn x1 & x2 => (_import "gtk_recent_info_match" : GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p * GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p -> FFI.Bool.val_;) (x1, x2)
    type record_t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.C.withPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> GioAppInfoClass.C.fromPtr true
      )
        createAppInfo_
        (
          self
           & appName
           & []
        )
    fun exists self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.fromVal) exists_ self
    fun getAdded self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int32.fromVal) getAge_ self
    fun getApplicationInfo self appName =
      let
        val appExec
         & count
         & time
         & retVal =
          (
            GtkRecentInfoRecord.C.withPtr
             &&&> FFI.String.withConstPtr
             &&&> FFI.String.withRefConstOptPtr
             &&&> FFI.UInt32.withRefVal
             &&&> FFI.Int64.withRefVal
             ---> FFI.String.fromPtr false
                   && FFI.UInt32.fromVal
                   && FFI.Int64.fromVal
                   && FFI.Bool.fromVal
          )
            getApplicationInfo_
            (
              self
               & appName
               & NONE
               & 0
               & 0
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
    fun getDescription self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr false) getDescription_ self
    fun getDisplayName self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr false) getDisplayName_ self
    fun getGicon self = (GtkRecentInfoRecord.C.withPtr ---> GioIconClass.C.fromPtr true) getGicon_ self
    fun getIcon self size = (GtkRecentInfoRecord.C.withPtr &&&> FFI.Int32.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr false) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr true) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr false) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr true) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.fromPtr true) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.C.withPtr &&&> GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.fromVal) match_ (self & infoB)
  end
