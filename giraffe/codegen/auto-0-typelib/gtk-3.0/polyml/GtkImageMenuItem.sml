structure GtkImageMenuItem :>
  GTK_IMAGE_MENU_ITEM
    where type 'a class = 'a GtkImageMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a accel_group_class = 'a GtkAccelGroupClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_image_menu_item_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_image_menu_item_new") (FFI.PolyML.cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_image_menu_item_new_from_stock") (Utf8.PolyML.cInPtr &&> GtkAccelGroupClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_image_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_image_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getAlwaysShowImage_ = call (load_sym libgtk "gtk_image_menu_item_get_always_show_image") (GtkImageMenuItemClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getImage_ = call (load_sym libgtk "gtk_image_menu_item_get_image") (GtkImageMenuItemClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getUseStock_ = call (load_sym libgtk "gtk_image_menu_item_get_use_stock") (GtkImageMenuItemClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAccelGroup_ = call (load_sym libgtk "gtk_image_menu_item_set_accel_group") (GtkImageMenuItemClass.PolyML.cPtr &&> GtkAccelGroupClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAlwaysShowImage_ = call (load_sym libgtk "gtk_image_menu_item_set_always_show_image") (GtkImageMenuItemClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setImage_ = call (load_sym libgtk "gtk_image_menu_item_set_image") (GtkImageMenuItemClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setUseStock_ = call (load_sym libgtk "gtk_image_menu_item_set_use_stock") (GtkImageMenuItemClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkImageMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a accel_group_class = 'a GtkAccelGroupClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkImageMenuItemClass.C.fromPtr false) new_ ()
    fun newFromStock stockId accelGroup = (Utf8.C.withPtr &&&> GtkAccelGroupClass.C.withOptPtr ---> GtkImageMenuItemClass.C.fromPtr false) newFromStock_ (stockId & accelGroup)
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkImageMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkImageMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun getAlwaysShowImage self = (GtkImageMenuItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getAlwaysShowImage_ self
    fun getImage self = (GtkImageMenuItemClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getUseStock self = (GtkImageMenuItemClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseStock_ self
    fun setAccelGroup self accelGroup = (GtkImageMenuItemClass.C.withPtr &&&> GtkAccelGroupClass.C.withPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAlwaysShowImage self alwaysShow = (GtkImageMenuItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setImage self image = (GtkImageMenuItemClass.C.withPtr &&&> GtkWidgetClass.C.withOptPtr ---> I) setImage_ (self & image)
    fun setUseStock self useStock = (GtkImageMenuItemClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseStock_ (self & useStock)
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
