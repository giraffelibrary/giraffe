structure GtkToggleButton :>
  GTK_TOGGLE_BUTTON
    where type 'a class_t = 'a GtkToggleButtonClass.t
    where type 'a activatableclass_t = 'a GtkActivatableClass.t
    where type 'a buildableclass_t = 'a GtkBuildableClass.t =
  struct
    val getType_ = _import "gtk_toggle_button_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "gtk_toggle_button_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithLabel_ = _import "mlton_gtk_toggle_button_new_with_label" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithMnemonic_ = _import "mlton_gtk_toggle_button_new_with_mnemonic" : cstring * unit CPointer.t -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val getActive_ = _import "gtk_toggle_button_get_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getInconsistent_ = _import "gtk_toggle_button_get_inconsistent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val getMode_ = _import "gtk_toggle_button_get_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Bool.val_;
    val setActive_ = fn x1 & x2 => (_import "gtk_toggle_button_set_active" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setInconsistent_ = fn x1 & x2 => (_import "gtk_toggle_button_set_inconsistent" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_toggle_button_set_mode" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Bool.val_ -> unit;) (x1, x2)
    val toggled_ = _import "gtk_toggle_button_toggled" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
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
