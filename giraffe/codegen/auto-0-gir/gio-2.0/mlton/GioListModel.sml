structure GioListModel :>
  GIO_LIST_MODEL
    where type 'a class = 'a GioListModelClass.class =
  struct
    val getType_ = _import "g_list_model_get_type" : unit -> GObjectType.FFI.val_;
    val getItemType_ = _import "g_list_model_get_item_type" : GioListModelClass.FFI.notnull GioListModelClass.FFI.p -> GObjectType.FFI.val_;
    val getNItems_ = _import "g_list_model_get_n_items" : GioListModelClass.FFI.notnull GioListModelClass.FFI.p -> GUInt.FFI.val_;
    val getItem_ = fn x1 & x2 => (_import "g_list_model_get_object" : GioListModelClass.FFI.notnull GioListModelClass.FFI.p * GUInt.FFI.val_ -> unit GObjectObjectClass.FFI.p;) (x1, x2)
    val itemsChanged_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_list_model_items_changed" :
              GioListModelClass.FFI.notnull GioListModelClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GioListModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getItemType self = (GioListModelClass.FFI.withPtr ---> GObjectType.FFI.fromVal) getItemType_ self
    fun getNItems self = (GioListModelClass.FFI.withPtr ---> GUInt.FFI.fromVal) getNItems_ self
    fun getItem self position = (GioListModelClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectObjectClass.FFI.fromOptPtr true) getItem_ (self & position)
    fun itemsChanged
      self
      (
        position,
        removed,
        added
      ) =
      (
        GioListModelClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         &&&> GUInt.FFI.withVal
         ---> I
      )
        itemsChanged_
        (
          self
           & position
           & removed
           & added
        )
    local
      open ClosureMarshal Signal
    in
      fun itemsChangedSig f =
        signal "items-changed"
          (
            get 0w1 uint
             &&&> get 0w2 uint
             &&&> get 0w3 uint
             ---> ret_void
          )
          (
            fn
              position
               & removed
               & added =>
                f
                  (
                    position,
                    removed,
                    added
                  )
          )
    end
  end
