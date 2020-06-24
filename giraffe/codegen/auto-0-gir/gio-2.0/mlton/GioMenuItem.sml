structure GioMenuItem :>
  GIO_MENU_ITEM
    where type 'a class = 'a GioMenuItemClass.class
    where type 'a icon_class = 'a GioIconClass.class
    where type 'a menu_model_class = 'a GioMenuModelClass.class =
  struct
    val getType_ = _import "g_menu_item_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2) & (x3, x4) =>
          (
            _import "mlton_g_menu_item_new" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val newFromModel_ = fn x1 & x2 => (_import "g_menu_item_new_from_model" : GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p * GInt.FFI.val_ -> GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p;) (x1, x2)
    val newSection_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_menu_item_new_section" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               -> GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newSubmenu_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_menu_item_new_submenu" :
              Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p
               -> GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getAttributeValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_item_get_attribute_value" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantTypeRecord.FFI.opt GLibVariantTypeRecord.FFI.p
               -> GLibVariantRecord.FFI.non_opt GLibVariantRecord.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getLink_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_menu_item_get_link" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val setActionAndTargetValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_item_set_action_and_target_value" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setAttributeValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_item_set_attribute_value" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GLibVariantRecord.FFI.opt GLibVariantRecord.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setDetailedAction_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_menu_item_set_detailed_action" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setIcon_ = fn x1 & x2 => (_import "g_menu_item_set_icon" : GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p * GioIconClass.FFI.non_opt GioIconClass.FFI.p -> unit;) (x1, x2)
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_g_menu_item_set_label" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLink_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_g_menu_item_set_link" :
              GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setSection_ = fn x1 & x2 => (_import "g_menu_item_set_section" : GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    val setSubmenu_ = fn x1 & x2 => (_import "g_menu_item_set_submenu" : GioMenuItemClass.FFI.non_opt GioMenuItemClass.FFI.p * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p -> unit;) (x1, x2)
    type 'a class = 'a GioMenuItemClass.class
    type 'a icon_class = 'a GioIconClass.class
    type 'a menu_model_class = 'a GioMenuModelClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new (label, detailedAction) = (Utf8.FFI.withOptPtr &&&> Utf8.FFI.withOptPtr ---> GioMenuItemClass.FFI.fromPtr true) new_ (label & detailedAction)
    fun newFromModel (model, itemIndex) = (GioMenuModelClass.FFI.withPtr &&&> GInt.FFI.withVal ---> GioMenuItemClass.FFI.fromPtr true) newFromModel_ (model & itemIndex)
    fun newSection (label, section) = (Utf8.FFI.withOptPtr &&&> GioMenuModelClass.FFI.withPtr ---> GioMenuItemClass.FFI.fromPtr true) newSection_ (label & section)
    fun newSubmenu (label, submenu) = (Utf8.FFI.withOptPtr &&&> GioMenuModelClass.FFI.withPtr ---> GioMenuItemClass.FFI.fromPtr true) newSubmenu_ (label & submenu)
    fun getAttributeValue self (attribute, expectedType) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantTypeRecord.FFI.withOptPtr
         ---> GLibVariantRecord.FFI.fromPtr true
      )
        getAttributeValue_
        (
          self
           & attribute
           & expectedType
        )
    fun getLink self link = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GioMenuModelClass.FFI.fromPtr true) getLink_ (self & link)
    fun setActionAndTargetValue self (action, targetValue) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setActionAndTargetValue_
        (
          self
           & action
           & targetValue
        )
    fun setAttributeValue self (attribute, value) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GLibVariantRecord.FFI.withOptPtr
         ---> I
      )
        setAttributeValue_
        (
          self
           & attribute
           & value
        )
    fun setDetailedAction self detailedAction = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setDetailedAction_ (self & detailedAction)
    fun setIcon self icon = (GioMenuItemClass.FFI.withPtr &&&> GioIconClass.FFI.withPtr ---> I) setIcon_ (self & icon)
    fun setLabel self label = (GioMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setLabel_ (self & label)
    fun setLink self (link, model) =
      (
        GioMenuItemClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GioMenuModelClass.FFI.withOptPtr
         ---> I
      )
        setLink_
        (
          self
           & link
           & model
        )
    fun setSection self section = (GioMenuItemClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setSection_ (self & section)
    fun setSubmenu self submenu = (GioMenuItemClass.FFI.withPtr &&&> GioMenuModelClass.FFI.withOptPtr ---> I) setSubmenu_ (self & submenu)
  end
