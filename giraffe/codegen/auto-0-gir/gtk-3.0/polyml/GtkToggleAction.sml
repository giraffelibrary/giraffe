structure GtkToggleAction :>
  GTK_TOGGLE_ACTION
    where type 'a class = 'a GtkToggleActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgtk "gtk_toggle_action_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ =
        call (load_sym libgtk "gtk_toggle_action_new")
          (
            Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> GObjectObjectClass.PolyML.cPtr
          )
      val getActive_ = call (load_sym libgtk "gtk_toggle_action_get_active") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val getDrawAsRadio_ = call (load_sym libgtk "gtk_toggle_action_get_draw_as_radio") (GObjectObjectClass.PolyML.cPtr --> FFI.Bool.PolyML.cVal)
      val setActive_ = call (load_sym libgtk "gtk_toggle_action_set_active") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val setDrawAsRadio_ = call (load_sym libgtk "gtk_toggle_action_set_draw_as_radio") (GObjectObjectClass.PolyML.cPtr &&> FFI.Bool.PolyML.cVal --> FFI.PolyML.cVoid)
      val toggled_ = call (load_sym libgtk "gtk_toggle_action_toggled") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
    end
    type 'a class = 'a GtkToggleActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         ---> GtkToggleActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
        )
    fun getActive self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getActive_ self
    fun getDrawAsRadio self = (GObjectObjectClass.C.withPtr ---> FFI.Bool.C.fromVal) getDrawAsRadio_ self
    fun setActive self isActive = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setActive_ (self & isActive)
    fun setDrawAsRadio self drawAsRadio = (GObjectObjectClass.C.withPtr &&&> FFI.Bool.C.withVal ---> I) setDrawAsRadio_ (self & drawAsRadio)
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
    end
  end
