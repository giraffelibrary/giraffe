structure GtkToggleButton :>
  GTK_TOGGLE_BUTTON
    where type 'a class = 'a GtkToggleButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_toggle_button_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_toggle_button_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithLabel_ = _import "mlton_gtk_toggle_button_new_with_label" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newWithMnemonic_ = _import "mlton_gtk_toggle_button_new_with_mnemonic" : Utf8.MLton.p1 * Utf8.FFI.non_opt Utf8.MLton.p2 -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getActive_ = _import "gtk_toggle_button_get_active" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p -> GBool.FFI.val_;
    val getInconsistent_ = _import "gtk_toggle_button_get_inconsistent" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p -> GBool.FFI.val_;
    val getMode_ = _import "gtk_toggle_button_get_mode" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p -> GBool.FFI.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_button_set_active" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setInconsistent_ = fn x1 & x2 => (_import "gtk_toggle_button_set_inconsistent" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_toggle_button_set_mode" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val toggled_ = _import "gtk_toggle_button_toggled" : GtkToggleButtonClass.FFI.non_opt GtkToggleButtonClass.FFI.p -> unit;
    type 'a class = 'a GtkToggleButtonClass.class
    type 'a actionable_class = 'a GtkActionableClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr false ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToggleButtonClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr 0 ---> GtkToggleButtonClass.FFI.fromPtr false) newWithLabel_ label before Utf8.FFI.touchPtr label
    fun newWithMnemonic label = (Utf8.FFI.withPtr 0 ---> GtkToggleButtonClass.FFI.fromPtr false) newWithMnemonic_ label before Utf8.FFI.touchPtr label
    fun getActive self = (GtkToggleButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun getInconsistent self = (GtkToggleButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInconsistent_ self
    fun getMode self = (GtkToggleButtonClass.FFI.withPtr false ---> GBool.FFI.fromVal) getMode_ self
    fun setActive self isActive = (GtkToggleButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setInconsistent self setting = (GtkToggleButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInconsistent_ (self & setting)
    fun setMode self drawIndicator = (GtkToggleButtonClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setMode_ (self & drawIndicator)
    fun toggled self = (GtkToggleButtonClass.FFI.withPtr false ---> I) toggled_ self
    local
      open ClosureMarshal Signal
    in
      fun toggledSig f = signal "toggled" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val drawIndicatorProp =
        {
          name = "draw-indicator",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val inconsistentProp =
        {
          name = "inconsistent",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
