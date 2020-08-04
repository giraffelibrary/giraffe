structure GtkStack :>
  GTK_STACK
    where type 'a class = 'a GtkStackClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type stack_transition_type_t = GtkStackTransitionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_stack_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_stack_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val addNamed_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_stack_add_named" :
              GtkStackClass.FFI.non_opt GtkStackClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val addTitled_ =
      fn
        x1
         & x2
         & (x3, x4)
         & (x5, x6) =>
          (
            _import "mlton_gtk_stack_add_titled" :
              GtkStackClass.FFI.non_opt GtkStackClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6
            )
    val getChildByName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_stack_get_child_by_name" :
              GtkStackClass.FFI.non_opt GtkStackClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val getHhomogeneous_ = _import "gtk_stack_get_hhomogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GBool.FFI.val_;
    val getHomogeneous_ = _import "gtk_stack_get_homogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GBool.FFI.val_;
    val getInterpolateSize_ = _import "gtk_stack_get_interpolate_size" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GBool.FFI.val_;
    val getTransitionDuration_ = _import "gtk_stack_get_transition_duration" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GUInt32.FFI.val_;
    val getTransitionRunning_ = _import "gtk_stack_get_transition_running" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GBool.FFI.val_;
    val getTransitionType_ = _import "gtk_stack_get_transition_type" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GtkStackTransitionType.FFI.val_;
    val getVhomogeneous_ = _import "gtk_stack_get_vhomogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GBool.FFI.val_;
    val getVisibleChild_ = _import "gtk_stack_get_visible_child" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getVisibleChildName_ = _import "gtk_stack_get_visible_child_name" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p -> Utf8.FFI.opt Utf8.FFI.out_p;
    val setHhomogeneous_ = fn x1 & x2 => (_import "gtk_stack_set_hhomogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHomogeneous_ = fn x1 & x2 => (_import "gtk_stack_set_homogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setInterpolateSize_ = fn x1 & x2 => (_import "gtk_stack_set_interpolate_size" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTransitionDuration_ = fn x1 & x2 => (_import "gtk_stack_set_transition_duration" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setTransitionType_ = fn x1 & x2 => (_import "gtk_stack_set_transition_type" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GtkStackTransitionType.FFI.val_ -> unit;) (x1, x2)
    val setVhomogeneous_ = fn x1 & x2 => (_import "gtk_stack_set_vhomogeneous" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setVisibleChild_ = fn x1 & x2 => (_import "gtk_stack_set_visible_child" : GtkStackClass.FFI.non_opt GtkStackClass.FFI.p * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setVisibleChildFull_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_stack_set_visible_child_full" :
              GtkStackClass.FFI.non_opt GtkStackClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GtkStackTransitionType.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setVisibleChildName_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_stack_set_visible_child_name" :
              GtkStackClass.FFI.non_opt GtkStackClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a GtkStackClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type stack_transition_type_t = GtkStackTransitionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkStackClass.FFI.fromPtr false) new_ ()
    fun addNamed self (child, name) =
      (
        GtkStackClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
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
        GtkStackClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withPtr 0
         ---> I
      )
        addTitled_
        (
          self
           & child
           & name
           & title
        )
    fun getChildByName self name = (GtkStackClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> GtkWidgetClass.FFI.fromOptPtr false) getChildByName_ (self & name)
    fun getHhomogeneous self = (GtkStackClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHhomogeneous_ self
    fun getHomogeneous self = (GtkStackClass.FFI.withPtr false ---> GBool.FFI.fromVal) getHomogeneous_ self
    fun getInterpolateSize self = (GtkStackClass.FFI.withPtr false ---> GBool.FFI.fromVal) getInterpolateSize_ self
    fun getTransitionDuration self = (GtkStackClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getTransitionDuration_ self
    fun getTransitionRunning self = (GtkStackClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTransitionRunning_ self
    fun getTransitionType self = (GtkStackClass.FFI.withPtr false ---> GtkStackTransitionType.FFI.fromVal) getTransitionType_ self
    fun getVhomogeneous self = (GtkStackClass.FFI.withPtr false ---> GBool.FFI.fromVal) getVhomogeneous_ self
    fun getVisibleChild self = (GtkStackClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getVisibleChild_ self
    fun getVisibleChildName self = (GtkStackClass.FFI.withPtr false ---> Utf8.FFI.fromOptPtr 0) getVisibleChildName_ self
    fun setHhomogeneous self hhomogeneous = (GtkStackClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHhomogeneous_ (self & hhomogeneous)
    fun setHomogeneous self homogeneous = (GtkStackClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setHomogeneous_ (self & homogeneous)
    fun setInterpolateSize self interpolateSize = (GtkStackClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setInterpolateSize_ (self & interpolateSize)
    fun setTransitionDuration self duration = (GtkStackClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setTransitionDuration_ (self & duration)
    fun setTransitionType self transition = (GtkStackClass.FFI.withPtr false &&&> GtkStackTransitionType.FFI.withVal ---> I) setTransitionType_ (self & transition)
    fun setVhomogeneous self vhomogeneous = (GtkStackClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setVhomogeneous_ (self & vhomogeneous)
    fun setVisibleChild self child = (GtkStackClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withPtr false ---> I) setVisibleChild_ (self & child)
    fun setVisibleChildFull self (name, transition) =
      (
        GtkStackClass.FFI.withPtr false
         &&&> Utf8.FFI.withPtr 0
         &&&> GtkStackTransitionType.FFI.withVal
         ---> I
      )
        setVisibleChildFull_
        (
          self
           & name
           & transition
        )
    fun setVisibleChildName self name = (GtkStackClass.FFI.withPtr false &&&> Utf8.FFI.withPtr 0 ---> I) setVisibleChildName_ (self & name)
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
