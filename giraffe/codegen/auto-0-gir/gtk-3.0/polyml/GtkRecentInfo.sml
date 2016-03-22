structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_info_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val createAppInfo_ =
        call (load_sym libgtk "gtk_recent_info_create_app_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GioAppInfoClass.PolyML.cPtr
          )
      val exists_ = call (load_sym libgtk "gtk_recent_info_exists") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getAdded_ = call (load_sym libgtk "gtk_recent_info_get_added") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getAge_ = call (load_sym libgtk "gtk_recent_info_get_age") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getApplicationInfo_ =
        call (load_sym libgtk "gtk_recent_info_get_application_info")
          (
            GtkRecentInfoRecord.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cOutRef
             &&> FFI.UInt.PolyML.cRef
             &&> FFI.Long.PolyML.cRef
             --> FFI.Bool.PolyML.cVal
          )
      val getDescription_ = call (load_sym libgtk "gtk_recent_info_get_description") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getDisplayName_ = call (load_sym libgtk "gtk_recent_info_get_display_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getGicon_ = call (load_sym libgtk "gtk_recent_info_get_gicon") (GtkRecentInfoRecord.PolyML.cPtr --> GioIconClass.PolyML.cPtr)
      val getIcon_ = call (load_sym libgtk "gtk_recent_info_get_icon") (GtkRecentInfoRecord.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> GdkPixbufPixbufClass.PolyML.cPtr)
      val getMimeType_ = call (load_sym libgtk "gtk_recent_info_get_mime_type") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getModified_ = call (load_sym libgtk "gtk_recent_info_get_modified") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val getPrivateHint_ = call (load_sym libgtk "gtk_recent_info_get_private_hint") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getShortName_ = call (load_sym libgtk "gtk_recent_info_get_short_name") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUri_ = call (load_sym libgtk "gtk_recent_info_get_uri") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getUriDisplay_ = call (load_sym libgtk "gtk_recent_info_get_uri_display") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getVisited_ = call (load_sym libgtk "gtk_recent_info_get_visited") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Long.PolyML.cVal)
      val hasApplication_ = call (load_sym libgtk "gtk_recent_info_has_application") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hasGroup_ = call (load_sym libgtk "gtk_recent_info_has_group") (GtkRecentInfoRecord.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val isLocal_ = call (load_sym libgtk "gtk_recent_info_is_local") (GtkRecentInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val lastApplication_ = call (load_sym libgtk "gtk_recent_info_last_application") (GtkRecentInfoRecord.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val match_ = call (load_sym libgtk "gtk_recent_info_match") (GtkRecentInfoRecord.PolyML.cPtr &&> GtkRecentInfoRecord.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
    end
    type t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun createAppInfo self appName =
      (
        GtkRecentInfoRecord.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
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
             &&&> Utf8.C.withPtr
             &&&> Utf8.C.withRefOptPtr
             &&&> FFI.UInt.C.withRefVal
             &&&> FFI.Long.C.withRefVal
             ---> Utf8.C.fromPtr false
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
    fun getDescription self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getDescription_ self
    fun getDisplayName self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getDisplayName_ self
    fun getGicon self = (GtkRecentInfoRecord.C.withPtr ---> GioIconClass.C.fromPtr true) getGicon_ self
    fun getIcon self size = (GtkRecentInfoRecord.C.withPtr &&&> FFI.Int.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Long.C.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr true) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr false) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr true) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Long.C.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.C.withPtr ---> Utf8.C.fromPtr true) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.C.withPtr &&&> GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) match_ (self & infoB)
  end
