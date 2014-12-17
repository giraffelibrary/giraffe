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
             &&> FFI.String.PolyML.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val exists_ = call (load_sym libgtk "gtk_recent_info_exists") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getAdded_ = call (load_sym libgtk "gtk_recent_info_get_added") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val getAge_ = call (load_sym libgtk "gtk_recent_info_get_age") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Int32.PolyML.VAL)
      val getApplicationInfo_ =
        call (load_sym libgtk "gtk_recent_info_get_application_info")
          (
            GtkRecentInfoRecord.PolyML.PTR
             &&> FFI.String.PolyML.INPTR
             &&> FFI.String.PolyML.OUTREF
             &&> FFI.UInt32.PolyML.REF
             &&> FFI.Int64.PolyML.REF
             --> FFI.Bool.PolyML.VAL
          )
      val getDescription_ = call (load_sym libgtk "gtk_recent_info_get_description") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getDisplayName_ = call (load_sym libgtk "gtk_recent_info_get_display_name") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getGicon_ = call (load_sym libgtk "gtk_recent_info_get_gicon") (GtkRecentInfoRecord.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getIcon_ = call (load_sym libgtk "gtk_recent_info_get_icon") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.Int32.PolyML.VAL --> GObjectObjectClass.PolyML.PTR)
      val getMimeType_ = call (load_sym libgtk "gtk_recent_info_get_mime_type") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getModified_ = call (load_sym libgtk "gtk_recent_info_get_modified") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val getPrivateHint_ = call (load_sym libgtk "gtk_recent_info_get_private_hint") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val getShortName_ = call (load_sym libgtk "gtk_recent_info_get_short_name") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUri_ = call (load_sym libgtk "gtk_recent_info_get_uri") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getUriDisplay_ = call (load_sym libgtk "gtk_recent_info_get_uri_display") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val getVisited_ = call (load_sym libgtk "gtk_recent_info_get_visited") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Int64.PolyML.VAL)
      val hasApplication_ = call (load_sym libgtk "gtk_recent_info_has_application") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val hasGroup_ = call (load_sym libgtk "gtk_recent_info_has_group") (GtkRecentInfoRecord.PolyML.PTR &&> FFI.String.PolyML.INPTR --> FFI.Bool.PolyML.VAL)
      val isLocal_ = call (load_sym libgtk "gtk_recent_info_is_local") (GtkRecentInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
      val lastApplication_ = call (load_sym libgtk "gtk_recent_info_last_application") (GtkRecentInfoRecord.PolyML.PTR --> FFI.String.PolyML.RETPTR)
      val match_ = call (load_sym libgtk "gtk_recent_info_match") (GtkRecentInfoRecord.PolyML.PTR &&> GtkRecentInfoRecord.PolyML.PTR --> FFI.Bool.PolyML.VAL)
    end
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
    fun getAdded self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.C.fromVal) getAdded_ self
    fun getAge self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int32.C.fromVal) getAge_ self
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
             &&&> FFI.UInt32.C.withRefVal
             &&&> FFI.Int64.C.withRefVal
             ---> FFI.String.C.fromPtr false
                   && FFI.UInt32.C.fromVal
                   && FFI.Int64.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getApplicationInfo_
            (
              self
               & appName
               & NONE
               & FFI.UInt32.null
               & FFI.Int64.null
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
    fun getIcon self size = (GtkRecentInfoRecord.C.withPtr &&&> FFI.Int32.C.withVal ---> GdkPixbufPixbufClass.C.fromPtr true) getIcon_ (self & size)
    fun getMimeType self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getMimeType_ self
    fun getModified self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.C.fromVal) getModified_ self
    fun getPrivateHint self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) getPrivateHint_ self
    fun getShortName self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) getShortName_ self
    fun getUri self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr false) getUri_ self
    fun getUriDisplay self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) getUriDisplay_ self
    fun getVisited self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Int64.C.fromVal) getVisited_ self
    fun hasApplication self appName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasApplication_ (self & appName)
    fun hasGroup self groupName = (GtkRecentInfoRecord.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasGroup_ (self & groupName)
    fun isLocal self = (GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) isLocal_ self
    fun lastApplication self = (GtkRecentInfoRecord.C.withPtr ---> FFI.String.C.fromPtr true) lastApplication_ self
    fun match self infoB = (GtkRecentInfoRecord.C.withPtr &&&> GtkRecentInfoRecord.C.withPtr ---> FFI.Bool.C.fromVal) match_ (self & infoB)
  end
