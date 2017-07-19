structure GtkImageMenuItem :>
  GTK_IMAGE_MENU_ITEM
    where type 'a class = 'a GtkImageMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_image_menu_item_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_image_menu_item_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newFromStock_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_gtk_image_menu_item_new_from_stock" :
              Utf8.MLton.p1
               * Utf8.FFI.notnull Utf8.MLton.p2
               * unit GtkAccelGroupClass.FFI.p
               -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newWithLabel_ = _import "mlton_gtk_image_menu_item_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_image_menu_item_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.notnull Utf8.MLton.p2 -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getAlwaysShowImage_ = _import "gtk_image_menu_item_get_always_show_image" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p -> GBool.FFI.val_;
    val getImage_ = _import "gtk_image_menu_item_get_image" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getUseStock_ = _import "gtk_image_menu_item_get_use_stock" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p -> GBool.FFI.val_;
    val setAccelGroup_ = fn x1 & x2 => (_import "gtk_image_menu_item_set_accel_group" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p * GtkAccelGroupClass.FFI.notnull GtkAccelGroupClass.FFI.p -> unit;) (x1, x2)
    val setAlwaysShowImage_ = fn x1 & x2 => (_import "gtk_image_menu_item_set_always_show_image" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setImage_ = fn x1 & x2 => (_import "gtk_image_menu_item_set_image" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setUseStock_ = fn x1 & x2 => (_import "gtk_image_menu_item_set_use_stock" : GtkImageMenuItemClass.FFI.notnull GtkImageMenuItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkImageMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkImageMenuItemClass.FFI.fromPtr false) new_ ()
    fun newFromStock (stockId, accelGroup) = (Utf8.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withOptPtr ---> GtkImageMenuItemClass.FFI.fromPtr false) newFromStock_ (stockId & accelGroup)
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkImageMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkImageMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getAlwaysShowImage self = (GtkImageMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getAlwaysShowImage_ self
    fun getImage self = (GtkImageMenuItemClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getImage_ self
    fun getUseStock self = (GtkImageMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseStock_ self
    fun setAccelGroup self accelGroup = (GtkImageMenuItemClass.FFI.withPtr &&&> GtkAccelGroupClass.FFI.withPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAlwaysShowImage self alwaysShow = (GtkImageMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setImage self image = (GtkImageMenuItemClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setImage_ (self & image)
    fun setUseStock self useStock = (GtkImageMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseStock_ (self & useStock)
    local
      open Property
    in
      val accelGroupProp = {set = fn x => set "accel-group" GtkAccelGroupClass.tOpt x}
      val alwaysShowImageProp =
        {
          get = fn x => get "always-show-image" boolean x,
          set = fn x => set "always-show-image" boolean x
        }
      val imageProp =
        {
          get = fn x => get "image" GtkWidgetClass.tOpt x,
          set = fn x => set "image" GtkWidgetClass.tOpt x
        }
      val useStockProp =
        {
          get = fn x => get "use-stock" boolean x,
          set = fn x => set "use-stock" boolean x
        }
    end
  end
