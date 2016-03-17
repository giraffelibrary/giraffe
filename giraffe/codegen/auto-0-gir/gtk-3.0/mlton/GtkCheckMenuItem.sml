structure GtkCheckMenuItem :>
  GTK_CHECK_MENU_ITEM
    where type 'a class = 'a GtkCheckMenuItemClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_check_menu_item_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_check_menu_item_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_check_menu_item_new_with_label" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_check_menu_item_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.C.notnull Utf8.MLton.p2 -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getActive_ = _import "gtk_check_menu_item_get_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getDrawAsRadio_ = _import "gtk_check_menu_item_get_draw_as_radio" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val getInconsistent_ = _import "gtk_check_menu_item_get_inconsistent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.C.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_check_menu_item_set_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setDrawAsRadio_ = fn x1 & x2 => (_import "gtk_check_menu_item_set_draw_as_radio" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val setInconsistent_ = fn x1 & x2 => (_import "gtk_check_menu_item_set_inconsistent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.C.val_ -> unit;) (x1, x2)
    val toggled_ = _import "gtk_check_menu_item_toggled" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    type 'a class = 'a GtkCheckMenuItemClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkCheckMenuItemClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkCheckMenuItemClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkCheckMenuItemClass.C.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun getDrawAsRadio self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawAsRadio_ self
    fun getInconsistent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInconsistent_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun setInconsistent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInconsistent_ (self & setting)
    fun toggled self = (GObjectObjectClass.C.withPtr ---> I) toggled_ self
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x
        }
      val drawAsRadioProp =
        {
          get = fn x => get "draw-as-radio" boolean x,
          set = fn x => set "draw-as-radio" boolean x
        }
      val inconsistentProp =
        {
          get = fn x => get "inconsistent" boolean x,
          set = fn x => set "inconsistent" boolean x
        }
    end
  end
