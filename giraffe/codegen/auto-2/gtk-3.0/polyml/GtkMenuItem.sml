structure GtkMenuItem :>
  GTK_MENU_ITEM
    where type 'a class_t = 'a GtkMenuItemClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t
    where type 'a widgetclass_t = 'a GtkWidgetClass.t
    where type 'a menuclass_t = 'a GtkMenuClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_menu_item_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_menu_item_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_menu_item_new_with_label") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_menu_item_new_with_mnemonic") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val activate_ = call (load_sym libgtk "gtk_menu_item_activate") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val deselect_ = call (load_sym libgtk "gtk_menu_item_deselect") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getAccelPath_ = call (load_sym libgtk "gtk_menu_item_get_accel_path") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getLabel_ = call (load_sym libgtk "gtk_menu_item_get_label") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.String.RETPTR)
      val getReserveIndicator_ = call (load_sym libgtk "gtk_menu_item_get_reserve_indicator") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getSubmenu_ = call (load_sym libgtk "gtk_menu_item_get_submenu") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val getUseUnderline_ = call (load_sym libgtk "gtk_menu_item_get_use_underline") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val select_ = call (load_sym libgtk "gtk_menu_item_select") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val setAccelPath_ = call (load_sym libgtk "gtk_menu_item_set_accel_path") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INOPTPTR --> FFI.PolyML.VOID)
      val setLabel_ = call (load_sym libgtk "gtk_menu_item_set_label") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.String.INPTR --> FFI.PolyML.VOID)
      val setReserveIndicator_ = call (load_sym libgtk "gtk_menu_item_set_reserve_indicator") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setSubmenu_ = call (load_sym libgtk "gtk_menu_item_set_submenu") (GObjectObjectClass.PolyML.PTR &&> GObjectObjectClass.PolyML.OPTPTR --> FFI.PolyML.VOID)
      val setUseUnderline_ = call (load_sym libgtk "gtk_menu_item_set_use_underline") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val toggleSizeAllocate_ = call (load_sym libgtk "gtk_menu_item_toggle_size_allocate") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Int32.VAL --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkMenuItemClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    type 'a widgetclass_t = 'a GtkWidgetClass.t
    type 'a menuclass_t = 'a GtkMenuClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkMenuItemClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (FFI.String.withConstPtr ---> GtkMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.withConstPtr ---> GtkMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun deselect self = (GObjectObjectClass.C.withPtr ---> I) deselect_ self
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getAccelPath_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.fromPtr false) getLabel_ self
    fun getReserveIndicator self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getReserveIndicator_ self
    fun getSubmenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getSubmenu_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getUseUnderline_ self
    fun select self = (GObjectObjectClass.C.withPtr ---> I) select_ self
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.withConstPtr ---> I) setLabel_ (self & label)
    fun setReserveIndicator self reserve = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setReserveIndicator_ (self & reserve)
    fun setSubmenu self submenu = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) setSubmenu_ (self & submenu)
    fun setUseUnderline self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setUseUnderline_ (self & setting)
    fun toggleSizeAllocate self allocation = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.withVal ---> I) toggleSizeAllocate_ (self & allocation)
    local
      open ClosureMarshal Signal
    in
      fun activateSig f = signal "activate" (void ---> ret_void) f
      fun activateItemSig f = signal "activate-item" (void ---> ret_void) f
      fun deselectSig f = signal "deselect" (void ---> ret_void) f
      fun selectSig f = signal "select" (void ---> ret_void) f
      fun toggleSizeAllocateSig f = signal "toggle-size-allocate" (get 0w1 int ---> ret_void) f
      fun toggleSizeRequestSig f = signal "toggle-size-request" (void ---> ret_void) f
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
