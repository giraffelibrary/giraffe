structure GtkImageMenuItem :>
  GTK_IMAGE_MENU_ITEM
    where type 'a class_t = 'a GtkImageMenuItemClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_image_menu_item_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_image_menu_item_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newFromStock_ = call (load_sym libgtk "gtk_image_menu_item_new_from_stock") (Utf8.PolyML.cInPtr &&> GObjectObjectClass.PolyML.cOptPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_image_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_image_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getAlwaysShowImage_ = call (load_sym libgtk "gtk_image_menu_item_get_always_show_image") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getImage_ = call (load_sym libgtk "gtk_image_menu_item_get_image") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getUseStock_ = call (load_sym libgtk "gtk_image_menu_item_get_use_stock") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setAccelGroup_ = call (load_sym libgtk "gtk_image_menu_item_set_accel_group") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAlwaysShowImage_ = call (load_sym libgtk "gtk_image_menu_item_set_always_show_image") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setImage_ = call (load_sym libgtk "gtk_image_menu_item_set_image") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setUseStock_ = call (load_sym libgtk "gtk_image_menu_item_set_use_stock") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkImageMenuItemClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a accel_group_class_t = 'a GtkAccelGroupClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkImageMenuItemClass.C.fromPtr false) new_ ()
    fun newFromStock stockId accelGroup = (Utf8.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> GtkImageMenuItemClass.C.fromPtr false) newFromStock_ (stockId & accelGroup)
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkImageMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkImageMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun getAlwaysShowImage self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getAlwaysShowImage_ self
    fun getImage self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getImage_ self
    fun getUseStock self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseStock_ self
    fun setAccelGroup self accelGroup = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withPtr ---> I) setAccelGroup_ (self & accelGroup)
    fun setAlwaysShowImage self alwaysShow = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setAlwaysShowImage_ (self & alwaysShow)
    fun setImage self image = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setImage_ (self & image)
    fun setUseStock self useStock = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseStock_ (self & useStock)
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
