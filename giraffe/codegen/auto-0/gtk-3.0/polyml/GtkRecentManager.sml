structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class_t = 'a GtkRecentManagerClass.t
    where type recentdatarecord_t = GtkRecentDataRecord.t
    where type recentinforecord_t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_recent_manager_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_recent_manager_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val getDefault_ = call (load_sym libgtk "gtk_recent_manager_get_default") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val addFull_ =
        call (load_sym libgtk "gtk_recent_manager_add_full")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GtkRecentDataRecord.PolyML.PTR
             --> FFI.PolyML.Bool.VAL
          )
      val addItem_ = call (load_sym libgtk "gtk_recent_manager_add_item") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val hasItem_ = call (load_sym libgtk "gtk_recent_manager_has_item") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.Bool.VAL)
      val lookupItem_ =
        call (load_sym libgtk "gtk_recent_manager_lookup_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GtkRecentInfoRecord.PolyML.PTR
          )
      val moveItem_ =
        call (load_sym libgtk "gtk_recent_manager_move_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> FFI.PolyML.String.INOPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
      val purgeItems_ = call (load_sym libgtk "gtk_recent_manager_purge_items") (GObjectObjectClass.PolyML.PTR &&> GLibErrorRecord.PolyML.OUTOPTREF --> FFI.PolyML.Int32.VAL)
      val removeItem_ =
        call (load_sym libgtk "gtk_recent_manager_remove_item")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.PolyML.String.INPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.PolyML.Bool.VAL
          )
    end
    type 'a class_t = 'a GtkRecentManagerClass.t
    type recentdatarecord_t = GtkRecentDataRecord.t
    type recentinforecord_t = GtkRecentInfoRecord.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkRecentManagerClass.C.fromPtr false) getDefault_ ()
    fun addFull self uri recentData =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GtkRecentDataRecord.C.withPtr
         ---> FFI.Bool.fromVal
      )
        addFull_
        (
          self
           & uri
           & recentData
        )
    fun addItem self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) addItem_ (self & uri)
    fun hasItem self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> FFI.Bool.fromVal) hasItem_ (self & uri)
    fun lookupItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> FFI.String.withConstPtr
         &&&> FFI.String.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
      )
        moveItem_
        (
          self
           & uri
           & newUri
           & []
        )
    fun purgeItems self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Int32.fromVal) purgeItems_ (self & [])
    fun removeItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.withConstPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.fromVal
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
