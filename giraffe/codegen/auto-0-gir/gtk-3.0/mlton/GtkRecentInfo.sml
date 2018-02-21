structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type t = GtkRecentInfoRecord.t =
  struct
    structure Utf8CVectorNType =
      CPointerCVectorNType(
        structure CElemType = Utf8.C.ArrayType
        structure Sequence = ListSequence
      )
    structure Utf8CVectorN = CVectorN(Utf8CVectorNType)
    val getType_ = _import "gtk_recent_info_get_type" : unit -> GObjectType.FFI.val_;
    val createAppInfo_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_info_create_app_info" :
              GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.FFI.r
               -> unit GioAppInfoClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val exists_ = _import "gtk_recent_info_exists" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val getAdded_ = _import "gtk_recent_info_get_added" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GLong.FFI.val_;
    val getAge_ = _import "gtk_recent_info_get_age" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GInt.FFI.val_;
    val getApplicationInfo_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6
         & x7 =>
          (
            _import "mlton_gtk_recent_info_get_application_info" :
              GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * Utf8.MLton.r1
               * (unit, Utf8.FFI.notnull) Utf8.MLton.r2
               * GUInt.FFI.ref_
               * GLong.FFI.ref_
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
    val getApplications_ = fn x1 & x2 => (_import "gtk_recent_info_get_applications" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p * GSize.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getDescription_ = _import "gtk_recent_info_get_description" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getDisplayName_ = _import "gtk_recent_info_get_display_name" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getGicon_ = _import "gtk_recent_info_get_gicon" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> unit GioIconClass.FFI.p;
    val getGroups_ = fn x1 & x2 => (_import "gtk_recent_info_get_groups" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p * GSize.FFI.ref_ -> Utf8CVectorN.FFI.notnull Utf8CVectorN.FFI.out_p;) (x1, x2)
    val getIcon_ = fn x1 & x2 => (_import "gtk_recent_info_get_icon" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p * GInt.FFI.val_ -> unit GdkPixbufPixbufClass.FFI.p;) (x1, x2)
    val getMimeType_ = _import "gtk_recent_info_get_mime_type" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getModified_ = _import "gtk_recent_info_get_modified" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GLong.FFI.val_;
    val getPrivateHint_ = _import "gtk_recent_info_get_private_hint" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val getShortName_ = _import "gtk_recent_info_get_short_name" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUri_ = _import "gtk_recent_info_get_uri" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val getUriDisplay_ = _import "gtk_recent_info_get_uri_display" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> unit Utf8.FFI.out_p;
    val getVisited_ = _import "gtk_recent_info_get_visited" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GLong.FFI.val_;
    val hasApplication_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_info_has_application" :
              GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
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
              GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val isLocal_ = _import "gtk_recent_info_is_local" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;
    val lastApplication_ = _import "gtk_recent_info_last_application" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> Utf8.FFI.notnull Utf8.FFI.out_p;
    val match_ = fn x1 & x2 => (_import "gtk_recent_info_match" : GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p * GtkRecentInfoRecord.FFI.notnull GtkRecentInfoRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    type t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromOptPtr true
      )
        createAppInfo_
        (
          self
           & appName
           & []
        )
    fun exists self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) exists_ self
    fun getAdded self = (GtkRecentInfoRecord.FFI.withPtr ---> GLong.FFI.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.FFI.withPtr ---> GInt.FFI.fromVal) getAge_ self
    fun getApplicationInfo self appName =
      let
        val appExec
         & count
         & time
         & retVal =
          (
            GtkRecentInfoRecord.FFI.withPtr
             &&&> Utf8.FFI.withPtr
             &&&> Utf8.FFI.withRefOptPtr
             &&&> GUInt.FFI.withRefVal
             &&&> GLong.FFI.withRefVal
             ---> Utf8.FFI.fromPtr 0
                   && GUInt.FFI.fromVal
                   && GLong.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getApplicationInfo_
            (
              self
               & appName
               & NONE
               & GUInt.null
               & GLong.null
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
    fun getApplications self =
      let
        val length & retVal = (GtkRecentInfoRecord.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getApplications_ (self & GSize.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getDescription self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getDisplayName self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getGicon self = (GtkRecentInfoRecord.FFI.withPtr ---> GioIconClass.FFI.fromOptPtr true) getGicon_ self
    fun getGroups self =
      let
        val length & retVal = (GtkRecentInfoRecord.FFI.withPtr &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getGroups_ (self & GSize.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getIcon self size = (GtkRecentInfoRecord.FFI.withPtr &&&> GInt.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.FFI.withPtr ---> GLong.FFI.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromOptPtr 1) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.FFI.withPtr ---> GLong.FFI.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.FFI.withPtr &&&> GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) match_ (self & infoB)
  end
