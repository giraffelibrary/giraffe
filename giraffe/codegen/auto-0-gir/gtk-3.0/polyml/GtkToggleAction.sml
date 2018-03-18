structure GtkToggleAction :>
  GTK_TOGGLE_ACTION
    where type 'a class = 'a GtkToggleActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_toggle_action_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (getSymbol "gtk_toggle_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GtkToggleActionClass.PolyML.cPtr
          )
      val getActive_ = call (getSymbol "gtk_toggle_action_get_active") (GtkToggleActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDrawAsRadio_ = call (getSymbol "gtk_toggle_action_get_draw_as_radio") (GtkToggleActionClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val setActive_ = call (getSymbol "gtk_toggle_action_set_active") (GtkToggleActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setDrawAsRadio_ = call (getSymbol "gtk_toggle_action_set_draw_as_radio") (GtkToggleActionClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val toggled_ = call (getSymbol "gtk_toggle_action_toggled") (GtkToggleActionClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkToggleActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> GtkToggleActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun getActive self = (GtkToggleActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getActive_ self
    fun getDrawAsRadio self = (GtkToggleActionClass.FFI.withPtr ---> GBool.FFI.fromVal) getDrawAsRadio_ self
    fun setActive self isActive = (GtkToggleActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GtkToggleActionClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun toggled self = (GtkToggleActionClass.FFI.withPtr ---> I) toggled_ self
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
          set = fn x => set "active" boolean x,
          new = fn x => new "active" boolean x
        }
      val drawAsRadioProp =
        {
          get = fn x => get "draw-as-radio" boolean x,
          set = fn x => set "draw-as-radio" boolean x,
          new = fn x => new "draw-as-radio" boolean x
        }
    end
  end
