structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_info_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val createAppInfo_ =
        call (getSymbol "gtk_recent_info_create_app_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cOptPtr
          )
      val exists_ = call (getSymbol "gtk_recent_info_exists") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAdded_ = call (getSymbol "gtk_recent_info_get_added") (GtkRecentInfoRecord.PolyML.cPtr --> GLong.PolyML.cVal)
      val getAge_ = call (getSymbol "gtk_recent_info_get_age") (GtkRecentInfoRecord.PolyML.cPtr --> GInt.PolyML.cVal)
      val getApplicationInfo_ =
        call (getSymbol "gtk_recent_info_get_application_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GUInt.PolyML.cRef
             &&> GLong.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getApplications_ = call (getSymbol "gtk_recent_info_get_applications") (GtkRecentInfoRecord.PolyML.cPtr &&> GSize.PolyML.cRef --> Utf8CPtrArray.PolyML.cOutPtr)
      val getDescription_ = call (getSymbol "gtk_recent_info_get_description") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (getSymbol "gtk_recent_info_get_display_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGicon_ = call (getSymbol "gtk_recent_info_get_gicon") (GtkRecentInfoRecord.PolyML.cPtr --> GioIconClass.PolyML.cOptPtr)
      val getGroups_ = call (getSymbol "gtk_recent_info_get_groups") (GtkRecentInfoRecord.PolyML.cPtr &&> GSize.PolyML.cRef --> Utf8CPtrArray.PolyML.cOutPtr)
      val getIcon_ = call (getSymbol "gtk_recent_info_get_icon") (GtkRecentInfoRecord.PolyML.cPtr &&> GInt.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cOptPtr)
      val getMimeType_ = call (getSymbol "gtk_recent_info_get_mime_type") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getModified_ = call (getSymbol "gtk_recent_info_get_modified") (GtkRecentInfoRecord.PolyML.cPtr --> GLong.PolyML.cVal)
      val getPrivateHint_ = call (getSymbol "gtk_recent_info_get_private_hint") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShortName_ = call (getSymbol "gtk_recent_info_get_short_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (getSymbol "gtk_recent_info_get_uri") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUriDisplay_ = call (getSymbol "gtk_recent_info_get_uri_display") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val getVisited_ = call (getSymbol "gtk_recent_info_get_visited") (GtkRecentInfoRecord.PolyML.cPtr --> GLong.PolyML.cVal)
      val hasApplication_ = call (getSymbol "gtk_recent_info_has_application") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasGroup_ = call (getSymbol "gtk_recent_info_has_group") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val isLocal_ = call (getSymbol "gtk_recent_info_is_local") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val lastApplication_ = call (getSymbol "gtk_recent_info_last_application") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val match_ = call (getSymbol "gtk_recent_info_match") (GtkRecentInfoRecord.PolyML.cPtr &&> GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
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
    fun getAdded self = (GtkRecentInfoRecord.FFI.withPtr false ---> GLong.FFI.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.FFI.withPtr false ---> GInt.FFI.fromVal) getAge_ self
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
        val _ & retVal = (GtkRecentInfoRecord.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getApplications_ (self & GSize.null)
      in
        retVal
      end
    fun getDescription self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDescription_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getDisplayName self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getDisplayName_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getGicon self = (GtkRecentInfoRecord.FFI.withPtr false ---> GioIconClass.FFI.fromOptPtr true) getGicon_ self
    fun getGroups self =
      let
        val _ & retVal = (GtkRecentInfoRecord.FFI.withPtr false &&&> GSize.FFI.withRefVal ---> GSize.FFI.fromVal && Utf8CPtrArray.FFI.fromPtr ~1) getGroups_ (self & GSize.null)
      in
        retVal
      end
    fun getIcon self size = (GtkRecentInfoRecord.FFI.withPtr false &&&> GInt.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromOptPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getMimeType_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getModified self = (GtkRecentInfoRecord.FFI.withPtr false ---> GLong.FFI.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr 0) getUri_ self before GtkRecentInfoRecord.FFI.touchPtr self
    fun getUriDisplay self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromOptPtr ~1) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.FFI.withPtr false ---> GLong.FFI.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.FFI.withPtr false ---> Utf8.FFI.fromPtr ~1) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.FFI.withPtr false &&&> GtkRecentInfoRecord.FFI.withPtr false ---> GBool.FFI.fromVal) match_ (self & infoB)
  end
