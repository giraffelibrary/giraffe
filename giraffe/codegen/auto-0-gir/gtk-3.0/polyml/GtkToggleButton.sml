structure GtkToggleButton :>
  GTK_TOGGLE_BUTTON
    where type 'a class = 'a GtkToggleButtonClass.class
    where type 'a actionable_class = 'a GtkActionableClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_toggle_button_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_toggle_button_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val newWithLabel_ = call (getSymbol "gtk_toggle_button_new_with_label") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val newWithMnemonic_ = call (getSymbol "gtk_toggle_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cPtr)
      val getActive_ = call (getSymbol "gtk_toggle_button_get_active") (GtkToggleButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInconsistent_ = call (getSymbol "gtk_toggle_button_get_inconsistent") (GtkToggleButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getMode_ = call (getSymbol "gtk_toggle_button_get_mode") (GtkToggleButtonClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActive_ = call (getSymbol "gtk_toggle_button_set_active") (GtkToggleButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setInconsistent_ = call (getSymbol "gtk_toggle_button_set_inconsistent") (GtkToggleButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setMode_ = call (getSymbol "gtk_toggle_button_set_mode") (GtkToggleButtonClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val toggled_ = call (getSymbol "gtk_toggle_button_toggled") (GtkToggleButtonClass.PolyML.cPtr --> cVoid)
    end
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
