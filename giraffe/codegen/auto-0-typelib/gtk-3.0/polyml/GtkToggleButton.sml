structure GtkToggleButton :>
  GTK_TOGGLE_BUTTON
    where type 'a class = 'a GtkToggleButtonClass.class
    where type 'a activatable_class = 'a GtkActivatableClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toggle_button_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgtk "gtk_toggle_button_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val newWithLabel_ = call (load_sym libgtk "gtk_toggle_button_new_with_label") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_toggle_button_new_with_mnemonic") (Utf8.PolyML.cInPtr --> GObjectObjectClass.PolyML.cPtr)
      val getActive_ = call (load_sym libgtk "gtk_toggle_button_get_active") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getInconsistent_ = call (load_sym libgtk "gtk_toggle_button_get_inconsistent") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getMode_ = call (load_sym libgtk "gtk_toggle_button_get_mode") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setActive_ = call (load_sym libgtk "gtk_toggle_button_set_active") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setInconsistent_ = call (load_sym libgtk "gtk_toggle_button_set_inconsistent") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setMode_ = call (load_sym libgtk "gtk_toggle_button_set_mode") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val toggled_ = call (load_sym libgtk "gtk_toggle_button_toggled") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkToggleButtonClass.class
    type 'a activatable_class = 'a GtkActivatableClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToggleButtonClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (Utf8.C.withPtr ---> GtkToggleButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (Utf8.C.withPtr ---> GtkToggleButtonClass.C.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun getInconsistent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getInconsistent_ self
    fun getMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getMode_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
    fun setInconsistent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setInconsistent_ (self & setting)
    fun setMode self drawIndicator = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setMode_ (self & drawIndicator)
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
