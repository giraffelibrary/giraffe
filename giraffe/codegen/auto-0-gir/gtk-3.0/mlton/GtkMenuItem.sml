structure GtkMenuItem :>
  GTK_MENU_ITEM
    where type 'a class_t = 'a GtkMenuItemClass.t
    where type 'a activatable_class_t = 'a GtkActivatableClass.t
    where type 'a buildable_class_t = 'a GtkBuildableClass.t
    where type 'a widget_class_t = 'a GtkWidgetClass.t
    where type 'a menu_class_t = 'a GtkMenuClass.t =
  struct
    val getType_ = _import "gtk_menu_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_menu_item_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_menu_item_new_with_label" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_menu_item_new_with_mnemonic" : GCharVec.MLton.p1 * GCharVec.C.notnull GCharVec.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val activate_ = _import "gtk_menu_item_activate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val deselect_ = _import "gtk_menu_item_deselect" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getAccelPath_ = _import "gtk_menu_item_get_accel_path" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getLabel_ = _import "gtk_menu_item_get_label" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.String.C.notnull FFI.String.C.out_p;
    val getReserveIndicator_ = _import "gtk_menu_item_get_reserve_indicator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getSubmenu_ = _import "gtk_menu_item_get_submenu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getUseUnderline_ = _import "gtk_menu_item_get_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val select_ = _import "gtk_menu_item_select" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_item_set_accel_path" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * unit GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setLabel_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_item_set_label" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * GCharVec.MLton.p1
               * GCharVec.C.notnull GCharVec.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReserveIndicator_ = fn x1 & x2 => (_import "gtk_menu_item_set_reserve_indicator" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setSubmenu_ = fn x1 & x2 => (_import "gtk_menu_item_set_submenu" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_menu_item_set_use_underline" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val toggleSizeAllocate_ = fn x1 & x2 => (_import "gtk_menu_item_toggle_size_allocate" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int.C.val_ -> unit;) (x1, x2)
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
    fun newWithLabel label = (FFI.String.C.withConstPtr ---> GtkMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.C.withConstPtr ---> GtkMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun activate self = (GObjectObjectClass.C.withPtr ---> I) activate_ self
    fun deselect self = (GObjectObjectClass.C.withPtr ---> I) deselect_ self
    fun getAccelPath self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getAccelPath_ self
    fun getLabel self = (GObjectObjectClass.C.withPtr ---> FFI.String.C.fromPtr false) getLabel_ self
    fun getReserveIndicator self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getReserveIndicator_ self
    fun getSubmenu self = (GObjectObjectClass.C.withPtr ---> GtkWidgetClass.C.fromPtr false) getSubmenu_ self
    fun getUseUnderline self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getUseUnderline_ self
    fun select self = (GObjectObjectClass.C.withPtr ---> I) select_ self
    fun setAccelPath self accelPath = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setLabel self label = (GObjectObjectClass.C.withPtr &&&> FFI.String.C.withConstPtr ---> I) setLabel_ (self & label)
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
