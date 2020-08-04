structure GioMenuModel :>
  GIO_MENU_MODEL
    where type 'a class = 'a GioMenuModelClass.class
    where type 'a menu_attribute_iter_class = 'a GioMenuAttributeIterClass.class
    where type 'a menu_link_iter_class = 'a GioMenuLinkIterClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_menu_model_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val getItemAttributeValue_ =
        call (getSymbol "g_menu_model_get_item_attribute_value")
          (
            GioMenuModelClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             &&> GLibVariantTypeRecord.PolyML.cOptPtr
             --> GLibVariantRecord.PolyML.cPtr
          )
      val getItemLink_ =
        call (getSymbol "g_menu_model_get_item_link")
          (
            GioMenuModelClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> Utf8.PolyML.cInPtr
             --> GioMenuModelClass.PolyML.cPtr
          )
      val getNItems_ = call (getSymbol "g_menu_model_get_n_items") (GioMenuModelClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val isMutable_ = call (getSymbol "g_menu_model_is_mutable") (GioMenuModelClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val itemsChanged_ =
        call (getSymbol "g_menu_model_items_changed")
          (
            GioMenuModelClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val iterateItemAttributes_ = call (getSymbol "g_menu_model_iterate_item_attributes") (GioMenuModelClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GioMenuAttributeIterClass.PolyML.cPtr)
      val iterateItemLinks_ = call (getSymbol "g_menu_model_iterate_item_links") (GioMenuModelClass.PolyML.cPtr &&> GInt.PolyML.cVal --> GioMenuLinkIterClass.PolyML.cPtr)
    end
    type 'a class = 'a GioMenuModelClass.class
    type 'a menu_attribute_iter_class = 'a GioMenuAttributeIterClass.class
    type 'a menu_link_iter_class = 'a GioMenuLinkIterClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun getItemAttributeValue
      self
      (
        itemIndex,
        attribute,
        expectedType
      ) =
      (
        GioMenuModelClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         &&&> GLibVariantTypeRecord.FFI.withOptPtr false
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        getItemAttributeValue_
        (
          self
           & itemIndex
           & attribute
           & expectedType
        )
    fun getItemLink self (itemIndex, link) =
      (
        GioMenuModelClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GioMenuModelClass.FFI.fromPtr true
      )
        getItemLink_
        (
          self
           & itemIndex
           & link
        )
    fun getNItems self = (GioMenuModelClass.FFI.withPtr false ---> GInt.FFI.fromVal) getNItems_ self
    fun isMutable self = (GioMenuModelClass.FFI.withPtr false ---> GBool.FFI.fromVal) isMutable_ self
    fun itemsChanged
      self
      (
        position,
        removed,
        added
      ) =
      (
        GioMenuModelClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        itemsChanged_
        (
          self
           & position
           & removed
           & added
        )
    fun iterateItemAttributes self itemIndex = (GioMenuModelClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GioMenuAttributeIterClass.FFI.fromPtr true) iterateItemAttributes_ (self & itemIndex)
    fun iterateItemLinks self itemIndex = (GioMenuModelClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> GioMenuLinkIterClass.FFI.fromPtr true) iterateItemLinks_ (self & itemIndex)
    local
      open ClosureMarshal Signal
    in
      fun itemsChangedSig f =
        signal "items-changed"
          (
            get 0w1 int
             &&&> get 0w2 int
             &&&> get 0w3 int
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
