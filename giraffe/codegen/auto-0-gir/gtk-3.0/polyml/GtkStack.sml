structure GtkStack :>
  GTK_STACK
    where type 'a class = 'a GtkStackClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type stack_transition_type_t = GtkStackTransitionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_stack_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_stack_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val addNamed_ =
        call (getSymbol "gtk_stack_add_named")
          (
            GtkStackClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val addTitled_ =
        call (getSymbol "gtk_stack_add_titled")
          (
            GtkStackClass.PolyML.cPtr
             &&> GtkWidgetClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> Utf8.PolyML.cInPtr
             --> cVoid
          )
      val getChildByName_ = call (getSymbol "gtk_stack_get_child_by_name") (GtkStackClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getHhomogeneous_ = call (getSymbol "gtk_stack_get_hhomogeneous") (GtkStackClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getHomogeneous_ = call (getSymbol "gtk_stack_get_homogeneous") (GtkStackClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getInterpolateSize_ = call (getSymbol "gtk_stack_get_interpolate_size") (GtkStackClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTransitionDuration_ = call (getSymbol "gtk_stack_get_transition_duration") (GtkStackClass.PolyML.cPtr --> GUInt.PolyML.cVal)
      val getTransitionRunning_ = call (getSymbol "gtk_stack_get_transition_running") (GtkStackClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTransitionType_ = call (getSymbol "gtk_stack_get_transition_type") (GtkStackClass.PolyML.cPtr --> GtkStackTransitionType.PolyML.cVal)
      val getVhomogeneous_ = call (getSymbol "gtk_stack_get_vhomogeneous") (GtkStackClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVisibleChild_ = call (getSymbol "gtk_stack_get_visible_child") (GtkStackClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getVisibleChildName_ = call (getSymbol "gtk_stack_get_visible_child_name") (GtkStackClass.PolyML.cPtr --> Utf8.PolyML.cOutOptPtr)
      val setHhomogeneous_ = call (getSymbol "gtk_stack_set_hhomogeneous") (GtkStackClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setHomogeneous_ = call (getSymbol "gtk_stack_set_homogeneous") (GtkStackClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setInterpolateSize_ = call (getSymbol "gtk_stack_set_interpolate_size") (GtkStackClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTransitionDuration_ = call (getSymbol "gtk_stack_set_transition_duration") (GtkStackClass.PolyML.cPtr &&> GUInt.PolyML.cVal --> cVoid)
      val setTransitionType_ = call (getSymbol "gtk_stack_set_transition_type") (GtkStackClass.PolyML.cPtr &&> GtkStackTransitionType.PolyML.cVal --> cVoid)
      val setVhomogeneous_ = call (getSymbol "gtk_stack_set_vhomogeneous") (GtkStackClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setVisibleChild_ = call (getSymbol "gtk_stack_set_visible_child") (GtkStackClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cPtr --> cVoid)
      val setVisibleChildFull_ =
        call (getSymbol "gtk_stack_set_visible_child_full")
          (
            GtkStackClass.PolyML.cPtr
             &&> Utf8.PolyML.cInPtr
             &&> GtkStackTransitionType.PolyML.cVal
             --> cVoid
          )
      val setVisibleChildName_ = call (getSymbol "gtk_stack_set_visible_child_name") (GtkStackClass.PolyML.cPtr &&> Utf8.PolyML.cInPtr --> cVoid)
    end
    type 'a class = 'a GtkStackClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type stack_transition_type_t = GtkStackTransitionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStackClass.FFI.fromPtr false) new_ ()
    fun addNamed self (child, name) =
      (
        GtkStackClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        addNamed_
        (
          self
           & child
           & name
        )
    fun addTitled
      self
      (
        child,
        name,
        title
      ) =
      (
        GtkStackClass.FFI.withPtr
         &&&> GtkWidgetClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         ---> I
      )
        addTitled_
        (
          self
           & child
           & name
           & title
        )
    fun getChildByName self name = (GtkStackClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getChildByName_ (self & name)
    fun getHhomogeneous self = (GtkStackClass.FFI.withPtr ---> GBool.FFI.fromVal) getHhomogeneous_ self
    fun getHomogeneous self = (GtkStackClass.FFI.withPtr ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getInterpolateSize self = (GtkStackClass.FFI.withPtr ---> GBool.FFI.fromVal) getInterpolateSize_ self
    fun getTransitionDuration self = (GtkStackClass.FFI.withPtr ---> GUInt.FFI.fromVal) getTransitionDuration_ self
    fun getTransitionRunning self = (GtkStackClass.FFI.withPtr ---> GBool.FFI.fromVal) getTransitionRunning_ self
    fun getTransitionType self = (GtkStackClass.FFI.withPtr ---> GtkStackTransitionType.FFI.fromVal) getTransitionType_ self
    fun getVhomogeneous self = (GtkStackClass.FFI.withPtr ---> GBool.FFI.fromVal) getVhomogeneous_ self
    fun getVisibleChild self = (GtkStackClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getVisibleChild_ self
    fun getVisibleChildName self = (GtkStackClass.FFI.withPtr ---> Utf8.FFI.fromOptPtr 0) getVisibleChildName_ self
    fun setHhomogeneous self hhomogeneous = (GtkStackClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHhomogeneous_ (self & hhomogeneous)
    fun setHomogeneous self homogeneous = (GtkStackClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setInterpolateSize self interpolateSize = (GtkStackClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInterpolateSize_ (self & interpolateSize)
    fun setTransitionDuration self duration = (GtkStackClass.FFI.withPtr &&&> GUInt.FFI.withVal ---> I) setTransitionDuration_ (self & duration)
    fun setTransitionType self transition = (GtkStackClass.FFI.withPtr &&&> GtkStackTransitionType.FFI.withVal ---> I) setTransitionType_ (self & transition)
    fun setVhomogeneous self vhomogeneous = (GtkStackClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setVhomogeneous_ (self & vhomogeneous)
    fun setVisibleChild self child = (GtkStackClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withPtr ---> I) setVisibleChild_ (self & child)
    fun setVisibleChildFull self (name, transition) =
      (
        GtkStackClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GtkStackTransitionType.FFI.withVal
         ---> I
      )
        setVisibleChildFull_
        (
          self
           & name
           & transition
        )
    fun setVisibleChildName self name = (GtkStackClass.FFI.withPtr &&&> Utf8.FFI.withPtr ---> I) setVisibleChildName_ (self & name)
    local
      open Property
    in
      val hhomogeneousProp =
        {
          get = fn x => get "hhomogeneous" boolean x,
          set = fn x => set "hhomogeneous" boolean x,
          new = fn x => new "hhomogeneous" boolean x
        }
      val homogeneousProp =
        {
          get = fn x => get "homogeneous" boolean x,
          set = fn x => set "homogeneous" boolean x,
          new = fn x => new "homogeneous" boolean x
        }
      val interpolateSizeProp =
        {
          get = fn x => get "interpolate-size" boolean x,
          set = fn x => set "interpolate-size" boolean x,
          new = fn x => new "interpolate-size" boolean x
        }
      val transitionDurationProp =
        {
          get = fn x => get "transition-duration" uint x,
          set = fn x => set "transition-duration" uint x,
          new = fn x => new "transition-duration" uint x
        }
      val transitionRunningProp = {get = fn x => get "transition-running" boolean x}
      val transitionTypeProp =
        {
          get = fn x => get "transition-type" GtkStackTransitionType.t x,
          set = fn x => set "transition-type" GtkStackTransitionType.t x,
          new = fn x => new "transition-type" GtkStackTransitionType.t x
        }
      val vhomogeneousProp =
        {
          get = fn x => get "vhomogeneous" boolean x,
          set = fn x => set "vhomogeneous" boolean x,
          new = fn x => new "vhomogeneous" boolean x
        }
      val visibleChildProp =
        {
          get = fn x => get "visible-child" GtkWidgetClass.tOpt x,
          set = fn x => set "visible-child" GtkWidgetClass.tOpt x,
          new = fn x => new "visible-child" GtkWidgetClass.tOpt x
        }
      val visibleChildNameProp =
        {
          get = fn x => get "visible-child-name" stringOpt x,
          set = fn x => set "visible-child-name" stringOpt x,
          new = fn x => new "visible-child-name" stringOpt x
        }
    end
  end
