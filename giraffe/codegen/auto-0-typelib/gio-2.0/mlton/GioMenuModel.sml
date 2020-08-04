structure GioMenuModel :>
  GIO_MENU_MODEL
    where type 'a class = 'a GioMenuModelClass.class
    where type 'a menu_attribute_iter_class = 'a GioMenuAttributeIterClass.class
    where type 'a menu_link_iter_class = 'a GioMenuLinkIterClass.class =
  struct
    val getType_ = _import "g_menu_model_get_type" : unit -> GObjectType.FFI.val_;
    val getItemAttributeValue_ =
      fn
        x1
         & x2
         & (x3, x4)
         & x5 =>
          (
            _import "mlton_g_menu_model_get_item_attribute_value" :
              GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5
            )
    val getItemLink_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_g_menu_model_get_item_link" :
              GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getNItems_ = _import "g_menu_model_get_n_items" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p -> GInt32.FFI.val_;
    val isMutable_ = _import "g_menu_model_is_mutable" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p -> GBool.FFI.val_;
    val itemsChanged_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "g_menu_model_items_changed" :
              GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val iterateItemAttributes_ = fn x1 & x2 => (_import "g_menu_model_iterate_item_attributes" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p * GInt32.FFI.val_ -> GioMenuAttributeIterClass.FFI.non_opt GioMenuAttributeIterClass.FFI.p;) (x1, x2)
    val iterateItemLinks_ = fn x1 & x2 => (_import "g_menu_model_iterate_item_links" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p * GInt32.FFI.val_ -> GioMenuLinkIterClass.FFI.non_opt GioMenuLinkIterClass.FFI.p;) (x1, x2)
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
         &&&> GInt32.FFI.withVal
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
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GioMenuModelClass.FFI.fromPtr true
      )
        getItemLink_
        (
          self
           & itemIndex
           & link
        )
    fun getNItems self = (GioMenuModelClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNItems_ self
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
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        itemsChanged_
        (
          self
           & position
           & removed
           & added
        )
    fun iterateItemAttributes self itemIndex = (GioMenuModelClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GioMenuAttributeIterClass.FFI.fromPtr true) iterateItemAttributes_ (self & itemIndex)
    fun iterateItemLinks self itemIndex = (GioMenuModelClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GioMenuLinkIterClass.FFI.fromPtr true) iterateItemLinks_ (self & itemIndex)
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
