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
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_info_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val createAppInfo_ =
        call (load_sym libgtk "gtk_recent_info_create_app_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cPtr
          )
      val exists_ = call (load_sym libgtk "gtk_recent_info_exists") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getAdded_ = call (load_sym libgtk "gtk_recent_info_get_added") (GtkRecentInfoRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getAge_ = call (load_sym libgtk "gtk_recent_info_get_age") (GtkRecentInfoRecord.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getApplicationInfo_ =
        call (load_sym libgtk "gtk_recent_info_get_application_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> GUInt32.PolyML.cRef
             &&> GInt64.PolyML.cRef
             --> GBool.PolyML.cVal
          )
      val getApplications_ = call (load_sym libgtk "gtk_recent_info_get_applications") (GtkRecentInfoRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CVectorN.PolyML.cOutPtr)
      val getDescription_ = call (load_sym libgtk "gtk_recent_info_get_description") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (load_sym libgtk "gtk_recent_info_get_display_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGicon_ = call (load_sym libgtk "gtk_recent_info_get_gicon") (GtkRecentInfoRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getGroups_ = call (load_sym libgtk "gtk_recent_info_get_groups") (GtkRecentInfoRecord.PolyML.cPtr &&> GUInt64.PolyML.cRef --> Utf8CVectorN.PolyML.cOutPtr)
      val getIcon_ = call (load_sym libgtk "gtk_recent_info_get_icon") (GtkRecentInfoRecord.PolyML.cPtr &&> GInt32.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getMimeType_ = call (load_sym libgtk "gtk_recent_info_get_mime_type") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getModified_ = call (load_sym libgtk "gtk_recent_info_get_modified") (GtkRecentInfoRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val getPrivateHint_ = call (load_sym libgtk "gtk_recent_info_get_private_hint") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getShortName_ = call (load_sym libgtk "gtk_recent_info_get_short_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (load_sym libgtk "gtk_recent_info_get_uri") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUriDisplay_ = call (load_sym libgtk "gtk_recent_info_get_uri_display") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisited_ = call (load_sym libgtk "gtk_recent_info_get_visited") (GtkRecentInfoRecord.PolyML.cPtr --> GInt64.PolyML.cVal)
      val hasApplication_ = call (load_sym libgtk "gtk_recent_info_has_application") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasGroup_ = call (load_sym libgtk "gtk_recent_info_has_group") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val isLocal_ = call (load_sym libgtk "gtk_recent_info_is_local") (GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val lastApplication_ = call (load_sym libgtk "gtk_recent_info_last_application") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val match_ = call (load_sym libgtk "gtk_recent_info_match") (GtkRecentInfoRecord.PolyML.cPtr &&> GtkRecentInfoRecord.PolyML.cPtr --> GBool.PolyML.cVal)
    end
    type t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> GioAppInfoClass.FFI.fromPtr true
      )
        createAppInfo_
        (
          self
           & appName
           & []
        )
    fun exists self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) exists_ self
    fun getAdded self = (GtkRecentInfoRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.FFI.withPtr ---> GInt32.FFI.fromVal) getAge_ self
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
        val length & retVal = (GtkRecentInfoRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getApplications_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getDescription self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDescription_ self
    fun getDisplayName self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getDisplayName_ self
    fun getGicon self = (GtkRecentInfoRecord.FFI.withPtr ---> GioIconClass.FFI.fromPtr true) getGicon_ self
    fun getGroups self =
      let
        val length & retVal = (GtkRecentInfoRecord.FFI.withPtr &&&> GUInt64.FFI.withRefVal ---> GUInt64.FFI.fromVal && Utf8CVectorN.FFI.fromPtr 2) getGroups_ (self & GUInt64.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun getIcon self size = (GtkRecentInfoRecord.FFI.withPtr &&&> GInt32.FFI.withVal ---> GdkPixbufPixbufClass.FFI.fromPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.FFI.withPtr ---> GInt64.FFI.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GBool.FFI.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.FFI.withPtr ---> Utf8.FFI.fromPtr 1) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.FFI.withPtr &&&> GtkRecentInfoRecord.FFI.withPtr ---> GBool.FFI.fromVal) match_ (self & infoB)
  end
