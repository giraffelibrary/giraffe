structure GtkMenuItem :>
  GTK_MENU_ITEM
    where type 'a class = 'a GtkMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_menu_item_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_menu_item_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_menu_item_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_menu_item_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val activate_ = call (getSymbol "gtk_menu_item_activate") (GtkMenuItemClass.PolyML.cPtr --> cVoid)
      val deselect_ = call (getSymbol "gtk_menu_item_deselect") (GtkMenuItemClass.PolyML.cPtr --> cVoid)
      val getAccelPath_ = call (getSymbol "gtk_menu_item_get_accel_path") (GtkMenuItemClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getLabel_ = call (getSymbol "gtk_menu_item_get_label") (GtkMenuItemClass.PolyML.cPtr --> Utf8.PolyML.cOutPtr)
      val getReserveIndicator_ = call (getSymbol "gtk_menu_item_get_reserve_indicator") (GtkMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRightJustified_ = call (getSymbol "gtk_menu_item_get_right_justified") (GtkMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getSubmenu_ = call (getSymbol "gtk_menu_item_get_submenu") (GtkMenuItemClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getUseUnderline_ = call (getSymbol "gtk_menu_item_get_use_underline") (GtkMenuItemClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val select_ = call (getSymbol "gtk_menu_item_select") (GtkMenuItemClass.PolyML.cPtr --> cVoid)
      val setAccelPath_ = call (getSymbol "gtk_menu_item_set_accel_path") (GtkMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
      val setLabel_ = call (getSymbol "gtk_menu_item_set_label") (GtkMenuItemClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
      val setReserveIndicator_ = call (getSymbol "gtk_menu_item_set_reserve_indicator") (GtkMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRightJustified_ = call (getSymbol "gtk_menu_item_set_right_justified") (GtkMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setSubmenu_ = call (getSymbol "gtk_menu_item_set_submenu") (GtkMenuItemClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setUseUnderline_ = call (getSymbol "gtk_menu_item_set_use_underline") (GtkMenuItemClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val toggleSizeAllocate_ = call (getSymbol "gtk_menu_item_toggle_size_allocate") (GtkMenuItemClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuItemClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun activate self = (GtkMenuItemClass.FFI.withPtr ---> I) activate_ self
    fun deselect self = (GtkMenuItemClass.FFI.withPtr ---> I) deselect_ self
    fun getAccelPath self = (GtkMenuItemClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getAccelPath_ self
    fun getLabel self = (GtkMenuItemClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getReserveIndicator self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getReserveIndicator_ self
    fun getRightJustified self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getRightJustified_ self
    fun getSubmenu self = (GtkMenuItemClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getSubmenu_ self
    fun getUseUnderline self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun select self = (GtkMenuItemClass.FFI.withPtr ---> I) select_ self
    fun setAccelPath self accelPath = (GtkMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setLabel self label = (GtkMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setReserveIndicator self reserve = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReserveIndicator_ (self & reserve)
    fun setRightJustified self rightJustified = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRightJustified_ (self & rightJustified)
    fun setSubmenu self submenu = (GtkMenuItemClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setSubmenu_ (self & submenu)
    fun setUseUnderline self setting = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & setting)
    fun toggleSizeAllocate self allocation = (GtkMenuItemClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) toggleSizeAllocate_ (self & allocation)
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
