structure GtkRecentInfo :>
  GTK_RECENT_INFO
    where type record_t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_info_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val createAppInfo_ =
        call (load_sym libgtk "gtk_recent_info_create_app_info")
          (
            GtkRecentInfoRecord.PolyML.PTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val exists_ = call (load_sym libgtk "gtk_recent_info_exists") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getAdded_ = call (load_sym libgtk "gtk_recent_info_get_added") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val getAge_ = call (load_sym libgtk "gtk_recent_info_get_age") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Int32.VAL)
      val getApplicationInfo_ =
        call (load_sym libgtk "gtk_recent_info_get_application_info")
          (
            GtkRecentInfoRecord.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.OUTREF
             &&> FFI.PolyML.Word32.REF
             &&> FFI.PolyML.Int64.REF
             --> FFI.PolyML.Bool.VAL
          )
      val getDescription_ = call (load_sym libgtk "gtk_recent_info_get_description") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getDisplayName_ = call (load_sym libgtk "gtk_recent_info_get_display_name") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getGicon_ = call (load_sym libgtk "gtk_recent_info_get_gicon") (GtkRecentInfoRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIcon_ = call (load_sym libgtk "gtk_recent_info_get_icon") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> GObjectObjectClass.PolyML.PTR)
      val getMimeType_ = call (load_sym libgtk "gtk_recent_info_get_mime_type") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getModified_ = call (load_sym libgtk "gtk_recent_info_get_modified") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val getPrivateHint_ = call (load_sym libgtk "gtk_recent_info_get_private_hint") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getShortName_ = call (load_sym libgtk "gtk_recent_info_get_short_name") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getUri_ = call (load_sym libgtk "gtk_recent_info_get_uri") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getUriDisplay_ = call (load_sym libgtk "gtk_recent_info_get_uri_display") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getVisited_ = call (load_sym libgtk "gtk_recent_info_get_visited") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Int64.VAL)
      val hasApplication_ = call (load_sym libgtk "gtk_recent_info_has_application") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hasGroup_ = call (load_sym libgtk "gtk_recent_info_has_group") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val isLocal_ = call (load_sym libgtk "gtk_recent_info_is_local") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val lastApplication_ = call (load_sym libgtk "gtk_recent_info_last_application") (GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val match_ = call (load_sym libgtk "gtk_recent_info_match") (GtkRecentInfoRecord.PolyML.PTR &&> GtkRecentInfoRecord.PolyML.PTR --> FFI.PolyML.Bool.VAL)
    end
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
             &&&> FFI.Word32.withRefVal
             &&&> FFI.Int64.withRefVal
             ---> FFI.String.fromPtr false
                   && FFI.Word32.fromVal
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
