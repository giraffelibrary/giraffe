structure GtkMenuItem :>
  GTK_MENU_ITEM
    where type 'a class_t = 'a GtkMenuItemClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_item_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_menu_item_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val activate_ = call (load_sym libgtk "gtk_menu_item_activate") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val deselect_ = call (load_sym libgtk "gtk_menu_item_deselect") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getAccelPath_ = call (load_sym libgtk "gtk_menu_item_get_accel_path") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabel_ = call (load_sym libgtk "gtk_menu_item_get_label") (GObjectObjectClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getReserveIndicator_ = call (load_sym libgtk "gtk_menu_item_get_reserve_indicator") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getSubmenu_ = call (load_sym libgtk "gtk_menu_item_get_submenu") (GObjectObjectClass.PolyML.cPtr --> GObjectObjectClass.PolyML.cPtr)
      val getUseUnderline_ = call (load_sym libgtk "gtk_menu_item_get_use_underline") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val select_ = call (load_sym libgtk "gtk_menu_item_select") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val setAccelPath_ = call (load_sym libgtk "gtk_menu_item_set_accel_path") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setLabel_ = call (load_sym libgtk "gtk_menu_item_set_label") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> FFI.PolyML.cVoid)
      val setReserveIndicator_ = call (load_sym libgtk "gtk_menu_item_set_reserve_indicator") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setSubmenu_ = call (load_sym libgtk "gtk_menu_item_set_submenu") (GObjectObjectClass.PolyML.cPtr &&> GObjectObjectClass.PolyML.cOptPtr --> FFI.PolyML.cVoid)
      val setUseUnderline_ = call (load_sym libgtk "gtk_menu_item_set_use_underline") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val toggleSizeAllocate_ = call (load_sym libgtk "gtk_menu_item_toggle_size_allocate") (GObjectObjectClass.PolyML.cPtr &&> FFI.Int.PolyML.cVal --> FFI.PolyML.cVoid)
    end
    type 'a class_t = 'a GtkMenuItemClass.t
    type 'a activatable_class_t = 'a GtkActivatableClass.t
    type 'a buildable_class_t = 'a GtkBuildableClass.t
    type 'a widget_class_t = 'a GtkWidgetClass.t
    type 'a menu_class_t = 'a GtkMenuClass.t
    type t = base class_t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuItemClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun deselect self = (GObjectObjectClass.C.withPtr ---> I) deselect_ self
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getAccelPath_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> Utf8.C.fromPtr false) getLabel_ self
    fun getReserveIndicator self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReserveIndicator_ self
    fun getSubmenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getSubmenu_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun select self = (GObjectObjectClass.C.withPtr ---> I) select_ self
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withPtr ---> I) setLabel_ (self & label)
    fun setReserveIndicator self reserve = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setReserveIndicator_ (self & reserve)
    fun setSubmenu self submenu = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setSubmenu_ (self & submenu)
    fun setUseUnderline self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setUseUnderline_ (self & setting)
    fun toggleSizeAllocate self allocation = (GObjectObjectClass.C.withPtr &&&> FFI.Int.C.withVal ---> I) toggleSizeAllocate_ (self & allocation)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun activateItemSig f = signal "activate-item" (void ---> ret_void) f
      fun deselectSig f = signal "deselect" (void ---> ret_void) f
      fun selectSig f = signal "select" (void ---> ret_void) f
      fun toggleSizeAllocateSig f = signal "toggle-size-allocate" (get 0w1 int ---> ret_void) f
    end
    local
      open Property
    in
      val accelPathProp =
        {
          get = fn x => get "accel-path" stringOpt x,
          set = fn x => set "accel-path" stringOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x
        }
      val rightJustifiedProp =
        {
          get = fn x => get "right-justified" boolean x,
          set = fn x => set "right-justified" boolean x
        }
      val submenuProp =
        {
          get = fn x => get "submenu" GtkMenuClass.tOpt x,
          set = fn x => set "submenu" GtkMenuClass.tOpt x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x
        }
    end
  end
