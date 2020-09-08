structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class = 'a GtkRecentManagerClass.class
    where type recent_data_t = GtkRecentDataRecord.t
    where type recent_info_t = GtkRecentInfoRecord.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_recent_manager_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_recent_manager_new") (cVoid --> GtkRecentManagerClass.PolyML.cPtr)
      val getDefault_ = call (getSymbol "gtk_recent_manager_get_default") (cVoid --> GtkRecentManagerClass.PolyML.cPtr)
      val addFull_ =
        call (getSymbol "gtk_recent_manager_add_full")
          (
            GtkRecentManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkRecentDataRecord.PolyML.cPtr
             --> GBool.PolyML.cVal
          )
      val addItem_ = call (getSymbol "gtk_recent_manager_add_item") (GtkRecentManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val hasItem_ = call (getSymbol "gtk_recent_manager_has_item") (GtkRecentManagerClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GBool.PolyML.cVal)
      val lookupItem_ =
        call (getSymbol "gtk_recent_manager_lookup_item")
          (
            GtkRecentManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GtkRecentInfoRecord.PolyML.cOptPtr
          )
      val moveItem_ =
        call (getSymbol "gtk_recent_manager_move_item")
          (
            GtkRecentManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val purgeItems_ = call (getSymbol "gtk_recent_manager_purge_items") (GtkRecentManagerClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GInt32.PolyML.cVal)
      val removeItem_ =
        call (getSymbol "gtk_recent_manager_remove_item")
          (
            GtkRecentManagerClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a GtkRecentManagerClass.class
    type recent_data_t = GtkRecentDataRecord.t
    type recent_info_t = GtkRecentInfoRecord.t
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRecentManagerClass.FFI.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkRecentManagerClass.FFI.fromPtr false) getDefault_ ()
    fun addFull self (uri, recentData) =
      (
        GtkRecentManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkRecentDataRecord.FFI.withPtr false
         ---> GBool.FFI.fromVal
      )
        addFull_
        (
          self
           & uri
           & recentData
        )
    fun addItem self uri = (GtkRecentManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) addItem_ (self & uri)
    fun hasItem self uri = (GtkRecentManagerClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GBool.FFI.fromVal) hasItem_ (self & uri)
    fun lookupItem self uri =
      (
        GtkRecentManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> GtkRecentInfoRecord.FFI.fromOptPtr true
      )
        lookupItem_
        (
          self
           & uri
           & []
        )
    fun moveItem self (uri, newUri) =
      (
        GtkRecentManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        moveItem_
        (
          self
           & uri
           & newUri
           & []
        )
    fun purgeItems self = (GtkRecentManagerClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GInt32.FFI.fromVal) purgeItems_ (self & [])
    fun removeItem self uri =
      (
        GtkRecentManagerClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
      open ValueAccessor
    in
      val filenameProp =
        {
          name = "filename",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = ignore,
          init = fn x => C.set stringOpt x
        }
      val sizeProp =
        {
          name = "size",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = ignore
        }
    end
  end
