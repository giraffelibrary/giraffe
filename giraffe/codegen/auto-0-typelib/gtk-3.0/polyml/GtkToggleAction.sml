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
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         ---> GtkToggleActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun getActive self = (GtkToggleActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getActive_ self
    fun getDrawAsRadio self = (GtkToggleActionClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDrawAsRadio_ self
    fun setActive self isActive = (GtkToggleActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GtkToggleActionClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
    fun toggled self = (GtkToggleActionClass.FFI.withPtr false ---> I) toggled_ self
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
      val drawAsRadioProp =
        {
          name = "draw-as-radio",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
