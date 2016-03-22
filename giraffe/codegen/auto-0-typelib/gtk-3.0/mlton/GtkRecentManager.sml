structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class = 'a GtkRecentManagerClass.class
    where type recent_data_t = GtkRecentDataRecord.t
    where type recent_info_t = GtkRecentInfoRecord.t =
  struct
    val getType_ = _import "gtk_recent_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_manager_new" : unit -> GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p;
    val getDefault_ = _import "gtk_recent_manager_get_default" : unit -> GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p;
    val addFull_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_add_full" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * GtkRecentDataRecord.C.notnull GtkRecentDataRecord.C.p
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addItem_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_manager_add_item" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val hasItem_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_recent_manager_has_item" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val lookupItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_lookup_item" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> GtkRecentInfoRecord.C.notnull GtkRecentInfoRecord.C.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val moveItem_ =
      fn
        x1
         & (x2, x3)
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_gtk_recent_manager_move_item" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val purgeItems_ = fn x1 & x2 => (_import "gtk_recent_manager_purge_items" : GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Int32.C.val_;) (x1, x2)
    val removeItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_remove_item" :
              GtkRecentManagerClass.C.notnull GtkRecentManagerClass.C.p
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkRecentManagerClass.class
    type recent_data_t = GtkRecentDataRecord.t
    type recent_info_t = GtkRecentInfoRecord.t
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkRecentManagerClass.C.fromPtr true) new_ ()
    fun getDefault () = (I ---> GtkRecentManagerClass.C.fromPtr false) getDefault_ ()
    fun addFull self uri recentData =
      (
        GtkRecentManagerClass.C.withPtr
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
    fun addItem self uri = (GtkRecentManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) addItem_ (self & uri)
    fun hasItem self uri = (GtkRecentManagerClass.C.withPtr &&&> Utf8.C.withPtr ---> FFI.Bool.C.fromVal) hasItem_ (self & uri)
    fun lookupItem self uri =
      (
        GtkRecentManagerClass.C.withPtr
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
        GtkRecentManagerClass.C.withPtr
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
    fun purgeItems self = (GtkRecentManagerClass.C.withPtr &&&> GLibErrorRecord.handleError ---> FFI.Int32.C.fromVal) purgeItems_ (self & [])
    fun removeItem self uri =
      (
        GtkRecentManagerClass.C.withPtr
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
