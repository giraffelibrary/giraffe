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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asActionable self = (GObjectObjectClass.FFI.withPtr ---> GtkActionableClass.FFI.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.FFI.withPtr ---> GtkActivatableClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkToggleButtonClass.FFI.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.FFI.withPtr ---> GtkToggleButtonClass.FFI.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.FFI.withPtr ---> GtkToggleButtonClass.FFI.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GtkToggleButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getInconsistent self = (GtkToggleButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getInconsistent_ self
    fun getMode self = (GtkToggleButtonClass.FFI.withPtr ---> GBool.FFI.fromVal) getMode_ self
    fun setActive self isActive = (GtkToggleButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setInconsistent self setting = (GtkToggleButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInconsistent_ (self & setting)
    fun setMode self drawIndicator = (GtkToggleButtonClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setMode_ (self & drawIndicator)
    fun toggled self = (GtkToggleButtonClass.FFI.withPtr ---> I) toggled_ self
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
      val drawIndicatorProp =
        {
          get = fn x => get "draw-indicator" boolean x,
          set = fn x => set "draw-indicator" boolean x
        }
      val inconsistentProp =
        {
          get = fn x => get "inconsistent" boolean x,
          set = fn x => set "inconsistent" boolean x
        }
    end
  end
