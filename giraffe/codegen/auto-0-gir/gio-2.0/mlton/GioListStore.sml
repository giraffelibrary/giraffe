structure GioListStore :>
  GIO_LIST_STORE
    where type 'a class = 'a GioListStoreClass.class
    where type 'a list_model_class = 'a GioListModelClass.class =
  struct
    structure GObjectObjectClassCVectorNType =
      CPointerCVectorNType(
        structure CElemType = GObjectObjectClass.C.PointerType
        structure Sequence = VectorSequence
      )
    structure GObjectObjectClassCVectorN = CVectorN(GObjectObjectClassCVectorNType)
    val getType_ = _import "g_list_store_get_type" : unit -> GObjectType.FFI.val_;
    val append_ = fn x1 & x2 => (_import "g_list_store_append" : GioListStoreClass.FFI.notnull GioListStoreClass.FFI.p * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p -> unit;) (x1, x2)
    val insert_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_list_store_insert" :
              GioListStoreClass.FFI.notnull GioListStoreClass.FFI.p
               * GUInt.FFI.val_
               * GObjectObjectClass.FFI.notnull GObjectObjectClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val remove_ = fn x1 & x2 => (_import "g_list_store_remove" : GioListStoreClass.FFI.notnull GioListStoreClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val removeAll_ = _import "g_list_store_remove_all" : GioListStoreClass.FFI.notnull GioListStoreClass.FFI.p -> unit;
    val splice_ =
      fn
        x1
         & x2
         & x3
         & (x4, x5)
         & x6 =>
          (
            _import "mlton_g_list_store_splice" :
              GioListStoreClass.FFI.notnull GioListStoreClass.FFI.p
               * GUInt.FFI.val_
               * GUInt.FFI.val_
               * GObjectObjectClassCVectorN.MLton.p1
               * GObjectObjectClassCVectorN.FFI.notnull GObjectObjectClassCVectorN.MLton.p2
               * GUInt.FFI.val_
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
    fun append self item = (GioListStoreClass.FFI.withPtr &&&> GObjectObjectClass.FFI.withPtr ---> I) append_ (self & item)
    fun insert self (position, item) =
      (
        GioListStoreClass.FFI.withPtr
         &&&> GUInt.FFI.withVal
         &&&> GObjectObjectClass.FFI.withPtr
         ---> I
      )
        insert_
        (
          self
           & position
           & item
        )
    fun remove self position = (GioListStoreClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) remove_ (self & position)
    fun removeAll self = (GioListStoreClass.FFI.withPtr ---> I) removeAll_ self
    fun splice
      self
      (
        position,
        nRemovals,
        additions
      ) =
      let
        val nAdditions = LargeInt.fromInt (GObjectObjectClassCVectorN.length additions)
        val () =
          (
            GioListStoreClass.FFI.withPtr
             &&&> GUInt.FFI.withVal
             &&&> GUInt.FFI.withVal
             &&&> GObjectObjectClassCVectorN.FFI.withPtr
             &&&> GUInt.FFI.withVal
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
  end
