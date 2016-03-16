structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class_t = 'a GtkRecentManagerClass.t
    where type recent_data_record_t = GtkRecentDataRecord.t
    where type recent_info_record_t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_manager_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_recent_manager_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val getDefault_ = call (load_sym libgtk "gtk_recent_manager_get_default") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val addFull_ =
        call (load_sym libgtk "gtk_recent_manager_add_full")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRecentDataRecord.PolyML.cPtr
             --> FFI.Bool.PolyML.cVal
          )
      val addItem_ = call (load_sym libgtk "gtk_recent_manager_add_item") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val hasItem_ = call (load_sym libgtk "gtk_recent_manager_has_item") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.Bool.PolyML.cVal)
      val lookupItem_ =
        call (load_sym libgtk "gtk_recent_manager_lookup_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkRecentInfoRecord.PolyML.cPtr
          )
      val moveItem_ =
        call (load_sym libgtk "gtk_recent_manager_move_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val purgeItems_ = call (load_sym libgtk "gtk_recent_manager_purge_items") (GObjectObjectClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> FFI.Int32.PolyML.cVal)
      val removeItem_ =
        call (load_sym libgtk "gtk_recent_manager_remove_item")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class_t = 'a GtkRecentManagerClass.t
    type recent_data_record_t = GtkRecentDataRecord.t
    type recent_info_record_t = GtkRecentInfoRecord.t
    type t = base class_t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkRecentManagerClass.C.fromPtr false) getDefault_ ()
    fun addFull self uri recentData =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GtkRecentDataRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        addFull_
        (
          self
           & uri
           & recentData
        )
    fun addItem self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) addItem_ (self & uri)
    fun hasItem self uri = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasItem_ (self & uri)
    fun lookupItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> GtkRecentInfoRecord.C.fromPtr true
      )
        lookupItem_
        (
          self
           & uri
           & []
        )
    fun moveItem self uri newUri =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        moveItem_
        (
          self
           & uri
           & newUri
           & []
        )
    fun purgeItems self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Int32.C.fromVal) purgeItems_ (self & [])
    fun removeItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> Utf8.C.withPtr
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        removeItem_
        (
          self
           & uri
           & []
        )
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val filenameProp =
        {
          get = fn x => get "filename" stringOpt x,
          set = fn x => set "filename" stringOpt x
        }
      val sizeProp = {get = fn x => get "size" int x}
    end
  end
