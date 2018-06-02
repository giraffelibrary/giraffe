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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_list_store_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_list_store_new") (GObjectType.PolyML.cVal --> GioListStoreClass.PolyML.cPtr)
      val append_ = call (getSymbol "g_list_store_append") (GioListStoreClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> cVoid)
      val insert_ =
        call (getSymbol "g_list_store_insert")
          (
            GioListStoreClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GObjectObjectClass.PolyML.cPtr
             --> cVoid
          )
      val remove_ = call (getSymbol "g_list_store_remove") (GioListStoreClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val removeAll_ = call (getSymbol "g_list_store_remove_all") (GioListStoreClass.PolyML.cPtr --> cVoid)
      val splice_ =
        call (getSymbol "g_list_store_splice")
          (
            GioListStoreClass.PolyML.cPtr
             &&> GUInt32.PolyML.cVal
             &&> GUInt32.PolyML.cVal
             &&> GObjectObjectClassCVectorN.PolyML.cInPtr
             &&> GUInt32.PolyML.cVal
             --> cVoid
          )
    end
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
        val nAdditions = LargeInt.fromInt (GObjectObjectClassCVectorN.length additions)
        val () =
          (
            GioListStoreClass.FFI.withPtr
             &&&> GUInt32.FFI.withVal
             &&&> GUInt32.FFI.withVal
             &&&> GObjectObjectClassCVectorN.FFI.withPtr
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