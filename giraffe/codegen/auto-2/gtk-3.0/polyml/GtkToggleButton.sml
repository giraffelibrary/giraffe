structure GtkToggleButton :>
  GTK_TOGGLE_BUTTON
    where type 'a class_t = 'a GtkToggleButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toggle_button_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgtk "gtk_toggle_button_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithLabel_ = call (load_sym libgtk "gtk_toggle_button_new_with_label") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val newWithMnemonic_ = call (load_sym libgtk "gtk_toggle_button_new_with_mnemonic") (FFI.PolyML.String.INPTR --> GObjectObjectClass.PolyML.PTR)
      val getActive_ = call (load_sym libgtk "gtk_toggle_button_get_active") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getInconsistent_ = call (load_sym libgtk "gtk_toggle_button_get_inconsistent") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val getMode_ = call (load_sym libgtk "gtk_toggle_button_get_mode") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.Bool.VAL)
      val setActive_ = call (load_sym libgtk "gtk_toggle_button_set_active") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setInconsistent_ = call (load_sym libgtk "gtk_toggle_button_set_inconsistent") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val setMode_ = call (load_sym libgtk "gtk_toggle_button_set_mode") (GObjectObjectClass.PolyML.PTR &&> FFI.PolyML.Bool.VAL --> FFI.PolyML.VOID)
      val toggled_ = call (load_sym libgtk "gtk_toggle_button_toggled") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
    end
    type 'a class_t = 'a GtkToggleButtonClass.t
    type 'a activatableclass_t = 'a GtkActivatableClass.t
    type 'a buildableclass_t = 'a GtkBuildableClass.t
    fun asImplementorIface self = (GObjectObjectClass.C.withPtr ---> AtkImplementorIfaceClass.C.fromPtr false) I self
    fun asActivatable self = (GObjectObjectClass.C.withPtr ---> GtkActivatableClass.C.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GtkToggleButtonClass.C.fromPtr false) new_ ()
    fun newWithLabel label = (FFI.String.withConstPtr ---> GtkToggleButtonClass.C.fromPtr false) newWithLabel_ label
    fun newWithMnemonic label = (FFI.String.withConstPtr ---> GtkToggleButtonClass.C.fromPtr false) newWithMnemonic_ label
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getActive_ self
    fun getInconsistent self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getInconsistent_ self
    fun getMode self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.fromVal) getMode_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setActive_ (self & isActive)
    fun setInconsistent self setting = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setInconsistent_ (self & setting)
    fun setMode self drawIndicator = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.withVal ---> I) setMode_ (self & drawIndicator)
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
