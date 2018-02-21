structure GtkPopover :>
  GTK_POPOVER
    where type 'a class = 'a GtkPopoverClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type popover_constraint_t = GtkPopoverConstraint.t
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_popover_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_popover_new" : unit GtkWidgetClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val newFromModel_ = fn x1 & x2 => (_import "gtk_popover_new_from_model" : unit GtkWidgetClass.FFI.p * GioMenuModelClass.FFI.notnull GioMenuModelClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;) (x1, x2)
    val bindModel_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_gtk_popover_bind_model" :
              GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p
               * unit GioMenuModelClass.FFI.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getConstrainTo_ = _import "gtk_popover_get_constrain_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> GtkPopoverConstraint.FFI.val_;
    val getDefaultWidget_ = _import "gtk_popover_get_default_widget" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> unit GtkWidgetClass.FFI.p;
    val getModal_ = _import "gtk_popover_get_modal" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> GBool.FFI.val_;
    val getPointingTo_ = fn x1 & x2 => (_import "gtk_popover_get_pointing_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> GBool.FFI.val_;) (x1, x2)
    val getPosition_ = _import "gtk_popover_get_position" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> GtkPositionType.FFI.val_;
    val getRelativeTo_ = _import "gtk_popover_get_relative_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getTransitionsEnabled_ = _import "gtk_popover_get_transitions_enabled" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> GBool.FFI.val_;
    val popdown_ = _import "gtk_popover_popdown" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> unit;
    val popup_ = _import "gtk_popover_popup" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p -> unit;
    val setConstrainTo_ = fn x1 & x2 => (_import "gtk_popover_set_constrain_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GtkPopoverConstraint.FFI.val_ -> unit;) (x1, x2)
    val setDefaultWidget_ = fn x1 & x2 => (_import "gtk_popover_set_default_widget" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setModal_ = fn x1 & x2 => (_import "gtk_popover_set_modal" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setPointingTo_ = fn x1 & x2 => (_import "gtk_popover_set_pointing_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GdkRectangleRecord.FFI.notnull GdkRectangleRecord.FFI.p -> unit;) (x1, x2)
    val setPosition_ = fn x1 & x2 => (_import "gtk_popover_set_position" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GtkPositionType.FFI.val_ -> unit;) (x1, x2)
    val setRelativeTo_ = fn x1 & x2 => (_import "gtk_popover_set_relative_to" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * unit GtkWidgetClass.FFI.p -> unit;) (x1, x2)
    val setTransitionsEnabled_ = fn x1 & x2 => (_import "gtk_popover_set_transitions_enabled" : GtkPopoverClass.FFI.notnull GtkPopoverClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkPopoverClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type popover_constraint_t = GtkPopoverConstraint.t
    type position_type_t = GtkPositionType.t
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new relativeTo = (GtkWidgetClass.FFI.withOptPtr ---> GtkPopoverClass.FFI.fromPtr false) new_ relativeTo
    fun newFromModel (relativeTo, model) = (GtkWidgetClass.FFI.withOptPtr &&&> GioMenuModelClass.FFI.withPtr ---> GtkPopoverClass.FFI.fromPtr false) newFromModel_ (relativeTo & model)
    fun bindModel self (model, actionNamespace) =
      (
        GtkPopoverClass.FFI.withPtr
         &&&> GioMenuModelClass.FFI.withOptPtr
         &&&> Utf8.FFI.withOptPtr
         ---> I
      )
        bindModel_
        (
          self
           & model
           & actionNamespace
        )
    fun getConstrainTo self = (GtkPopoverClass.FFI.withPtr ---> GtkPopoverConstraint.FFI.fromVal) getConstrainTo_ self
    fun getDefaultWidget self = (GtkPopoverClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromOptPtr false) getDefaultWidget_ self
    fun getModal self = (GtkPopoverClass.FFI.withPtr ---> GBool.FFI.fromVal) getModal_ self
    fun getPointingTo self =
      let
        val rect & retVal = (GtkPopoverClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withNewPtr ---> GdkRectangleRecord.FFI.fromPtr true && GBool.FFI.fromVal) getPointingTo_ (self & ())
      in
        if retVal then SOME rect else NONE
      end
    fun getPosition self = (GtkPopoverClass.FFI.withPtr ---> GtkPositionType.FFI.fromVal) getPosition_ self
    fun getRelativeTo self = (GtkPopoverClass.FFI.withPtr ---> GtkWidgetClass.FFI.fromPtr false) getRelativeTo_ self
    fun getTransitionsEnabled self = (GtkPopoverClass.FFI.withPtr ---> GBool.FFI.fromVal) getTransitionsEnabled_ self
    fun popdown self = (GtkPopoverClass.FFI.withPtr ---> I) popdown_ self
    fun popup self = (GtkPopoverClass.FFI.withPtr ---> I) popup_ self
    fun setConstrainTo self constraint = (GtkPopoverClass.FFI.withPtr &&&> GtkPopoverConstraint.FFI.withVal ---> I) setConstrainTo_ (self & constraint)
    fun setDefaultWidget self widget = (GtkPopoverClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setDefaultWidget_ (self & widget)
    fun setModal self modal = (GtkPopoverClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setModal_ (self & modal)
    fun setPointingTo self rect = (GtkPopoverClass.FFI.withPtr &&&> GdkRectangleRecord.FFI.withPtr ---> I) setPointingTo_ (self & rect)
    fun setPosition self position = (GtkPopoverClass.FFI.withPtr &&&> GtkPositionType.FFI.withVal ---> I) setPosition_ (self & position)
    fun setRelativeTo self relativeTo = (GtkPopoverClass.FFI.withPtr &&&> GtkWidgetClass.FFI.withOptPtr ---> I) setRelativeTo_ (self & relativeTo)
    fun setTransitionsEnabled self transitionsEnabled = (GtkPopoverClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setTransitionsEnabled_ (self & transitionsEnabled)
    local
      open ClosureMarshal Signal
    in
      fun closedSig f = signal "closed" (void ---> ret_void) f
    end
    local
      open Property
    in
      val constrainToProp =
        {
          get = fn x => get "constrain-to" GtkPopoverConstraint.t x,
          set = fn x => set "constrain-to" GtkPopoverConstraint.t x
        }
      val modalProp =
        {
          get = fn x => get "modal" boolean x,
          set = fn x => set "modal" boolean x
        }
      val pointingToProp =
        {
          get = fn x => get "pointing-to" GdkRectangleRecord.tOpt x,
          set = fn x => set "pointing-to" GdkRectangleRecord.tOpt x
        }
      val positionProp =
        {
          get = fn x => get "position" GtkPositionType.t x,
          set = fn x => set "position" GtkPositionType.t x
        }
      val relativeToProp =
        {
          get = fn x => get "relative-to" GtkWidgetClass.tOpt x,
          set = fn x => set "relative-to" GtkWidgetClass.tOpt x
        }
      val transitionsEnabledProp =
        {
          get = fn x => get "transitions-enabled" boolean x,
          set = fn x => set "transitions-enabled" boolean x
        }
    end
  end
