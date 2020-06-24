structure GtkMenuItem :>
  GTK_MENU_ITEM
    where type 'a class = 'a GtkMenuItemClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class
    where type 'a menu_class = 'a GtkMenuClass.class =
  struct
    val getType_ = _import "gtk_menu_item_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_menu_item_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabel_ = _import "mlton_gtk_menu_item_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_menu_item_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val activate_ = _import "gtk_menu_item_activate" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> unit;
    val deselect_ = _import "gtk_menu_item_deselect" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> unit;
    val getAccelPath_ = _import "gtk_menu_item_get_accel_path" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val getLabel_ = _import "gtk_menu_item_get_label" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> Utf8.FFI.non_opt Utf8.FFI.out_p;
    val getReserveIndicator_ = _import "gtk_menu_item_get_reserve_indicator" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> GBool.FFI.val_;
    val getRightJustified_ = _import "gtk_menu_item_get_right_justified" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> GBool.FFI.val_;
    val getSubmenu_ = _import "gtk_menu_item_get_submenu" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getUseUnderline_ = _import "gtk_menu_item_get_use_underline" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> GBool.FFI.val_;
    val select_ = _import "gtk_menu_item_select" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p -> unit;
    val setAccelPath_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_menu_item_set_accel_path" :
              GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
              GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setReserveIndicator_ = fn x1 & x2 => (_import "gtk_menu_item_set_reserve_indicator" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRightJustified_ = fn x1 & x2 => (_import "gtk_menu_item_set_right_justified" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setSubmenu_ = fn x1 & x2 => (_import "gtk_menu_item_set_submenu" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GtkMenuClass.FFI.opt GtkMenuClass.FFI.p -> unit;) (x1, x2)
    val setUseUnderline_ = fn x1 & x2 => (_import "gtk_menu_item_set_use_underline" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val toggleSizeAllocate_ = fn x1 & x2 => (_import "gtk_menu_item_toggle_size_allocate" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    val toggleSizeRequest_ = fn x1 & x2 => (_import "gtk_menu_item_toggle_size_request" : GtkMenuItemClass.FFI.non_opt GtkMenuItemClass.FFI.p * GInt.FFI.ref_ -> unit;) (x1, x2)
    type 'a class = 'a GtkMenuItemClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type 'a menu_class = 'a GtkMenuClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkMenuItemClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkMenuItemClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkMenuItemClass.FFI.fromPtr false) newWithMnemonic_ label
    fun activate self = (GtkMenuItemClass.FFI.withPtr ---> I) activate_ self
    fun deselect self = (GtkMenuItemClass.FFI.withPtr ---> I) deselect_ self
    fun getAccelPath self = (GtkMenuItemClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getAccelPath_ self
    fun getLabel self = (GtkMenuItemClass.FFI.withPtr ---> Utf8.FFI.fromPtr 0) getLabel_ self
    fun getReserveIndicator self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getReserveIndicator_ self
    fun getRightJustified self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getRightJustified_ self
    fun getSubmenu self = (GtkMenuItemClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getSubmenu_ self
    fun getUseUnderline self = (GtkMenuItemClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseUnderline_ self
    fun select self = (GtkMenuItemClass.FFI.withPtr ---> I) select_ self
    fun setAccelPath self accelPath = (GtkMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setAccelPath_ (self & accelPath)
    fun setLabel self label = (GtkMenuItemClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setLabel_ (self & label)
    fun setReserveIndicator self reserve = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setReserveIndicator_ (self & reserve)
    fun setRightJustified self rightJustified = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRightJustified_ (self & rightJustified)
    fun setSubmenu self submenu = (GtkMenuItemClass.FFI.withPtr &&&> GtkMenuClass.FFI.withOptPtr ---> I) setSubmenu_ (self & submenu)
    fun setUseUnderline self setting = (GtkMenuItemClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseUnderline_ (self & setting)
    fun toggleSizeAllocate self allocation = (GtkMenuItemClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) toggleSizeAllocate_ (self & allocation)
    fun toggleSizeRequest self requisition =
      let
        val requisition & () = (GtkMenuItemClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && I) toggleSizeRequest_ (self & requisition)
      in
        requisition
      end
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
          set = fn x => set "accel-path" stringOpt x,
          new = fn x => new "accel-path" stringOpt x
        }
      val labelProp =
        {
          get = fn x => get "label" stringOpt x,
          set = fn x => set "label" stringOpt x,
          new = fn x => new "label" stringOpt x
        }
      val rightJustifiedProp =
        {
          get = fn x => get "right-justified" boolean x,
          set = fn x => set "right-justified" boolean x,
          new = fn x => new "right-justified" boolean x
        }
      val submenuProp =
        {
          get = fn x => get "submenu" GtkMenuClass.tOpt x,
          set = fn x => set "submenu" GtkMenuClass.tOpt x,
          new = fn x => new "submenu" GtkMenuClass.tOpt x
        }
      val useUnderlineProp =
        {
          get = fn x => get "use-underline" boolean x,
          set = fn x => set "use-underline" boolean x,
          new = fn x => new "use-underline" boolean x
        }
    end
  end
