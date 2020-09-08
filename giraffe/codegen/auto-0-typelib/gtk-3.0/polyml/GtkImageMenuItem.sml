structure GtkImageMenuItem :>
  GTK_IMAGE_MENU_ITEM
    where type 'a class = 'a GtkImageMenuItemClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_image_menu_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_image_menu_item_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (getSymbol "gtk_image_menu_item_new_from_stock") (Utf8.PolyML.cInPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_image_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_image_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAlwaysShowImage_ = call (getSymbol "gtk_image_menu_item_get_always_show_image") (GtkImageMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getImage_ = call (getSymbol "gtk_image_menu_item_get_image") (GtkImageMenuItemClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getUseStock_ = call (getSymbol "gtk_image_menu_item_get_use_stock") (GtkImageMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setAccelGroup_ = call (getSymbol "gtk_image_menu_item_set_accel_group") (GtkImageMenuItemClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> cVoid)
      val setAlwaysShowImage_ = call (getSymbol "gtk_image_menu_item_set_always_show_image") (GtkImageMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setImage_ = call (getSymbol "gtk_image_menu_item_set_image") (GtkImageMenuItemClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setUseStock_ = call (getSymbol "gtk_image_menu_item_set_use_stock") (GtkImageMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkImageMenuItemClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkImageMenuItemClass.FFI.fromPtr false) new_ ()
    fun newFromStock (stockId, accelGroup) = (Utf8.FFI.withPtr 0 &&&> GtkAccelGroupClass.FFI.withOptPtr false ---> GtkImageMenuItemClass.FFI.fromPtr false) newFromStock_ (stockId & accelGroup)
    fun newWithLabel label = (Utf8.FFI.withPtr 0 ---> GtkImageMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr 0 ---> GtkImageMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getAlwaysShowImage self = (GtkImageMenuItemClass.FFI.withPtr false ---> GBool.FFI.fromVal) getAlwaysShowImage_ self
    fun getImage self = (GtkImageMenuItemClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getUseStock self = (GtkImageMenuItemClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseStock_ self
    fun setAccelGroup self accelGroup = (GtkImageMenuItemClass.FFI.withPtr false &&&> GtkAccelGroupClass.FFI.withPtr false ---> I) setAccelGroup_ (self & accelGroup)
    fun setAlwaysShowImage self alwaysShow = (GtkImageMenuItemClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setImage self image = (GtkImageMenuItemClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setImage_ (self & image)
    fun setUseStock self useStock = (GtkImageMenuItemClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setUseStock_ (self & useStock)
    local
      open ValueAccessor
    in
      val accelGroupProp =
        {
          name = "accel-group",
          gtype = fn () => C.gtype GtkAccelGroupClass.tOpt (),
          get = ignore,
          set = fn x => C.set GtkAccelGroupClass.tOpt x,
          init = fn x => C.set GtkAccelGroupClass.tOpt x
        }
      val alwaysShowImageProp =
        {
          name = "always-show-image",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val imageProp =
        {
          name = "image",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val useStockProp =
        {
          name = "use-stock",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
