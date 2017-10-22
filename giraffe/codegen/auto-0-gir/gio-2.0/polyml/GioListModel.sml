structure GioListModel :>
  GIO_LIST_MODEL
    where type 'a class = 'a GioListModelClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_list_model_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getNItems_ = call (getSymbol "g_list_model_get_n_items") (GioListModelClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getObject_ = call (getSymbol "g_list_model_get_object") (GioListModelClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> GObjectObjectClass.PolyML.cPtr)
      val itemsChanged_ =
        call (getSymbol "g_list_model_items_changed")
          (
            GioListModelClass.PolyML.cPtr
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             &&> GUInt.PolyML.cVal
             --> cVoid
          )
    end
    type 'a class = 'a GioListModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getNItems self = (GioListModelClass.FFI.withPtr ---> GUInt.FFI.fromVal) getNItems_ self
    fun getObject self position = (GioListModelClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> GObjectObjectClass.FFI.fromPtr true) getObject_ (self & position)
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
