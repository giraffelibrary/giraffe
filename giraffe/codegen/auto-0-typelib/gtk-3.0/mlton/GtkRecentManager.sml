structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class_t = 'a GtkRecentManagerClass.t
    where type recent_data_record_t = GtkRecentDataRecord.t
    where type recent_info_record_t = GtkRecentInfoRecord.t =
  struct
    val getType_ = _import "gtk_recent_manager_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_recent_manager_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getDefault_ = _import "gtk_recent_manager_get_default" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val addFull_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_add_full" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
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
    val purgeItems_ = fn x1 & x2 => (_import "gtk_recent_manager_purge_items" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * (unit, unit) GLibErrorRecord.C.r -> FFI.Int32.C.val_;) (x1, x2)
    val removeItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_remove_item" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
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
         &&&> FFI.String.C.withConstPtr
         &&&> GtkRecentDataRecord.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        addFull_
        (
          self
           & uri
           & recentData
        )
    fun addItem self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) addItem_ (self & uri)
    fun hasItem self uri = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> FFI.Bool.C.fromVal) hasItem_ (self & uri)
    fun lookupItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
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
         &&&> FFI.String.C.withConstPtr
         &&&> FFI.String.C.withConstOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        moveItem_
        (
          self
           & uri
           & newUri
           & []
        )
    fun purgeItems self = (GObjectObjectClass.C.withPtr &&&> GLibErrorRecord.C.handleError ---> FFI.Int32.C.fromVal) purgeItems_ (self & [])
    fun removeItem self uri =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.String.C.withConstPtr
         &&&> GLibErrorRecord.C.handleError
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
