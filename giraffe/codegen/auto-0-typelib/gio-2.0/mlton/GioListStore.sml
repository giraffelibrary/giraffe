structure GioListStore :>
  GIO_LIST_STORE
    where type 'a class = 'a GioListStoreClass.class
    where type 'a list_model_class = 'a GioListModelClass.class =
  struct
    val getType_ = _import "g_list_store_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_list_store_new" : GObjectType.FFI.val_ -> GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p;
    val append_ = fn x1 & x2 => (_import "g_list_store_append" : GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p -> unit;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_list_store_insert" :
              GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p
               * GUInt32.FFI.val_
               * GObjectObjectClass.FFI.non_opt GObjectObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "g_list_store_remove" : GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "g_list_store_remove_all" : GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p -> unit;
    val splice_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_list_store_splice" :
              GioListStoreClass.FFI.non_opt GioListStoreClass.FFI.p
               * GUInt32.FFI.val_
               * GUInt32.FFI.val_
               * GObjectObjectClassCPtrArrayN.MLton.p1
               * GObjectObjectClassCPtrArrayN.FFI.non_opt GObjectObjectClassCPtrArrayN.MLton.p2
               * GUInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    type 'a class = 'a GioListStoreClass.class
    type 'a list_model_class = 'a GioListModelClass.class
    type t = base class
    fun asListModel self = (GObjectObjectClass.FFI.withPtr ---> GioListModelClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new itemType = (GObjectType.FFI.withVal ---> GioListStoreClass.FFI.fromPtr true) new_ itemType
    fun append self item = (GioListStoreClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withPtr ---> I) append_ (self & item)
    fun insert self (position, item) =
      (
        GioListStoreClass.FFI.withPtr
         &&&> GUInt32.FFI.withVal
         &&&> GObjectObjectClass.FFI.withPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & item
        )
    fun remove self position = (GioListStoreClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GioListStoreClass.FFI.withPtr ---> I) removeAll_ self
    fun splice
      self
      (
        position,
        nRemovals,
        additions
      ) =
      let
        val nAdditions = LargeInt.fromInt (GObjectObjectClassCPtrArrayN.length additions)
        val () =
          (
            GioListStoreClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GUInt32.FFI.withVal
             &&&> GObjectObjectClassCPtrArrayN.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             ---> I
          )
            splice_
            (
              self
               & position
               & nRemovals
               & additions
               & nAdditions
            )
      in
        ()
      end
    local
      open Property
    in
      val itemTypeProp =
        {
          get = fn x => get "item-type" GObjectType.t x,
          new = fn x => new "item-type" GObjectType.t x
        }
    end
  end
