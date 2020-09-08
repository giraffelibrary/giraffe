structure GtkPopover :>
  GTK_POPOVER
    where type 'a class = 'a GtkPopoverClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type popover_constraint_t = GtkPopoverConstraint.t
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_popover_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_popover_new" : GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newFromModel_ = fn x1 & x2 => (_import "gtk_popover_new_from_model" : GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p * GioMenuModelClass.FFI.non_opt GioMenuModelClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val bindModel_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_popover_bind_model" :
              GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p
               * GioMenuModelClass.FFI.opt GioMenuModelClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getConstrainTo_ = _import "gtk_popover_get_constrain_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GtkPopoverConstraint.FFI.val_;
    val getDefaultWidget_ = _import "gtk_popover_get_default_widget" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p;
    val getModal_ = _import "gtk_popover_get_modal" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GBool.FFI.val_;
    val getPointingTo_ = fn x1 & x2 => (_import "gtk_popover_get_pointing_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getPosition_ = _import "gtk_popover_get_position" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GtkPositionType.FFI.val_;
    val getRelativeTo_ = _import "gtk_popover_get_relative_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getTransitionsEnabled_ = _import "gtk_popover_get_transitions_enabled" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> GBool.FFI.val_;
    val popdown_ = _import "gtk_popover_popdown" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> unit;
    val popup_ = _import "gtk_popover_popup" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p -> unit;
    val setConstrainTo_ = fn x1 & x2 => (_import "gtk_popover_set_constrain_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GtkPopoverConstraint.FFI.val_ -> unit;) (x1, x2)
    val setDefaultWidget_ = fn x1 & x2 => (_import "gtk_popover_set_default_widget" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setModal_ = fn x1 & x2 => (_import "gtk_popover_set_modal" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPointingTo_ = fn x1 & x2 => (_import "gtk_popover_set_pointing_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GdkRectangleRecord.FFI.non_opt GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_popover_set_position" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    val setRelativeTo_ = fn x1 & x2 => (_import "gtk_popover_set_relative_to" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GtkWidgetClass.FFI.opt GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setTransitionsEnabled_ = fn x1 & x2 => (_import "gtk_popover_set_transitions_enabled" : GtkPopoverClass.FFI.non_opt GtkPopoverClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkPopoverClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type popover_constraint_t = GtkPopoverConstraint.t
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new relativeTo = (GtkWidgetClass.FFI.withOptPtr false ---> GtkPopoverClass.FFI.fromPtr false) new_ relativeTo
    fun newFromModel (relativeTo, model) = (GtkWidgetClass.FFI.withOptPtr false &&&> GioMenuModelClass.FFI.withPtr false ---> GtkPopoverClass.FFI.fromPtr false) newFromModel_ (relativeTo & model)
    fun bindModel self (model, actionNamespace) =
      (
        GtkPopoverClass.FFI.withPtr false
         &&&> GioMenuModelClass.FFI.withOptPtr false
         &&&> Utf8.FFI.withOptPtr 0
         ---> I
      )
        bindModel_
        (
          self
           & model
           & actionNamespace
        )
    fun getConstrainTo self = (GtkPopoverClass.FFI.withPtr false ---> GtkPopoverConstraint.FFI.fromVal) getConstrainTo_ self
    fun getDefaultWidget self = (GtkPopoverClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromOptPtr false) getDefaultWidget_ self
    fun getModal self = (GtkPopoverClass.FFI.withPtr false ---> GBool.FFI.fromVal) getModal_ self
    fun getPointingTo self =
      let
        val rect & retVal = (GtkPopoverClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getPointingTo_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getPosition self = (GtkPopoverClass.FFI.withPtr false ---> GtkPositionType.FFI.fromVal) getPosition_ self
    fun getRelativeTo self = (GtkPopoverClass.FFI.withPtr false ---> GtkWidgetClass.FFI.fromPtr false) getRelativeTo_ self
    fun getTransitionsEnabled self = (GtkPopoverClass.FFI.withPtr false ---> GBool.FFI.fromVal) getTransitionsEnabled_ self
    fun popdown self = (GtkPopoverClass.FFI.withPtr false ---> I) popdown_ self
    fun popup self = (GtkPopoverClass.FFI.withPtr false ---> I) popup_ self
    fun setConstrainTo self constraint = (GtkPopoverClass.FFI.withPtr false &&&> GtkPopoverConstraint.FFI.withVal ---> I) setConstrainTo_ (self & constraint)
    fun setDefaultWidget self widget = (GtkPopoverClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setDefaultWidget_ (self & widget)
    fun setModal self modal = (GtkPopoverClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setPointingTo self rect = (GtkPopoverClass.FFI.withPtr false &&&> GdkRectangleRecord.FFI.withPtr false ---> I) setPointingTo_ (self & rect)
    fun setPosition self position = (GtkPopoverClass.FFI.withPtr false &&&> GtkPositionType.FFI.withVal ---> I) setPosition_ (self & position)
    fun setRelativeTo self relativeTo = (GtkPopoverClass.FFI.withPtr false &&&> GtkWidgetClass.FFI.withOptPtr false ---> I) setRelativeTo_ (self & relativeTo)
    fun setTransitionsEnabled self transitionsEnabled = (GtkPopoverClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setTransitionsEnabled_ (self & transitionsEnabled)
    local
      open ClosureMarshal Signal
    in
      fun closedSig f = signal "closed" (void ---> ret_void) f
    end
    local
      open ValueAccessor
    in
      val constrainToProp =
        {
          name = "constrain-to",
          gtype = fn () => C.gtype GtkPopoverConstraint.t (),
          get = fn x => fn () => C.get GtkPopoverConstraint.t x,
          set = fn x => C.set GtkPopoverConstraint.t x,
          init = fn x => C.set GtkPopoverConstraint.t x
        }
      val modalProp =
        {
          name = "modal",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val pointingToProp =
        {
          name = "pointing-to",
          gtype = fn () => C.gtype GdkRectangleRecord.tOpt (),
          get = fn x => fn () => C.get GdkRectangleRecord.tOpt x,
          set = fn x => C.set GdkRectangleRecord.tOpt x,
          init = fn x => C.set GdkRectangleRecord.tOpt x
        }
      val positionProp =
        {
          name = "position",
          gtype = fn () => C.gtype GtkPositionType.t (),
          get = fn x => fn () => C.get GtkPositionType.t x,
          set = fn x => C.set GtkPositionType.t x,
          init = fn x => C.set GtkPositionType.t x
        }
      val relativeToProp =
        {
          name = "relative-to",
          gtype = fn () => C.gtype GtkWidgetClass.tOpt (),
          get = fn x => fn () => C.get GtkWidgetClass.tOpt x,
          set = fn x => C.set GtkWidgetClass.tOpt x,
          init = fn x => C.set GtkWidgetClass.tOpt x
        }
      val transitionsEnabledProp =
        {
          name = "transitions-enabled",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
