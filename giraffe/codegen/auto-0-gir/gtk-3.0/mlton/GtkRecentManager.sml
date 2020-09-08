structure GtkRecentManager :>
  GTK_RECENT_MANAGER
    where type 'a class = 'a GtkRecentManagerClass.class
    where type recent_data_t = GtkRecentDataRecord.t
    where type recent_info_t = GtkRecentInfoRecord.t =
  struct
    val getType_ = _import "gtk_recent_manager_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_recent_manager_new" : unit -> GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p;
    val getDefault_ = _import "gtk_recent_manager_get_default" : unit -> GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p;
    val addFull_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_add_full" :
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkRecentDataRecord.FFI.non_opt GtkRecentDataRecord.FFI.p
               -> GBool.FFI.val_;
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
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
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
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GtkRecentInfoRecord.FFI.opt GtkRecentInfoRecord.FFI.p;
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
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val purgeItems_ = fn x1 & x2 => (_import "gtk_recent_manager_purge_items" : GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GInt.FFI.val_;) (x1, x2)
    val removeItem_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_recent_manager_remove_item" :
              GtkRecentManagerClass.FFI.non_opt GtkRecentManagerClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
    fun purgeItems self = (GtkRecentManagerClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> GInt.FFI.fromVal) purgeItems_ (self & [])
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
