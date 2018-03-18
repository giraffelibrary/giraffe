structure GtkPopover :>
  GTK_POPOVER
    where type 'a class = 'a GtkPopoverClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type popover_constraint_t = GtkPopoverConstraint.t
    where type position_type_t = GtkPositionType.t
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_popover_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_popover_new") (GtkWidgetClass.PolyML.cOptPtr --> GtkWidgetClass.PolyML.cPtr)
      val newFromModel_ = call (getSymbol "gtk_popover_new_from_model") (GtkWidgetClass.PolyML.cOptPtr &&> GioMenuModelClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val bindModel_ =
        call (getSymbol "gtk_popover_bind_model")
          (
            GtkPopoverClass.PolyML.cPtr
             &&> GioMenuModelClass.PolyML.cOptPtr
             &&> Utf8.PolyML.cInOptPtr
             --> cVoid
          )
      val getConstrainTo_ = call (getSymbol "gtk_popover_get_constrain_to") (GtkPopoverClass.PolyML.cPtr --> GtkPopoverConstraint.PolyML.cVal)
      val getDefaultWidget_ = call (getSymbol "gtk_popover_get_default_widget") (GtkPopoverClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cOptPtr)
      val getModal_ = call (getSymbol "gtk_popover_get_modal") (GtkPopoverClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPointingTo_ = call (getSymbol "gtk_popover_get_pointing_to") (GtkPopoverClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> GBool.PolyML.cVal)
      val getPosition_ = call (getSymbol "gtk_popover_get_position") (GtkPopoverClass.PolyML.cPtr --> GtkPositionType.PolyML.cVal)
      val getRelativeTo_ = call (getSymbol "gtk_popover_get_relative_to") (GtkPopoverClass.PolyML.cPtr --> GtkWidgetClass.PolyML.cPtr)
      val getTransitionsEnabled_ = call (getSymbol "gtk_popover_get_transitions_enabled") (GtkPopoverClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val popdown_ = call (getSymbol "gtk_popover_popdown") (GtkPopoverClass.PolyML.cPtr --> cVoid)
      val popup_ = call (getSymbol "gtk_popover_popup") (GtkPopoverClass.PolyML.cPtr --> cVoid)
      val setConstrainTo_ = call (getSymbol "gtk_popover_set_constrain_to") (GtkPopoverClass.PolyML.cPtr &&> GtkPopoverConstraint.PolyML.cVal --> cVoid)
      val setDefaultWidget_ = call (getSymbol "gtk_popover_set_default_widget") (GtkPopoverClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setModal_ = call (getSymbol "gtk_popover_set_modal") (GtkPopoverClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setPointingTo_ = call (getSymbol "gtk_popover_set_pointing_to") (GtkPopoverClass.PolyML.cPtr &&> GdkRectangleRecord.PolyML.cPtr --> cVoid)
      val setPosition_ = call (getSymbol "gtk_popover_set_position") (GtkPopoverClass.PolyML.cPtr &&> GtkPositionType.PolyML.cVal --> cVoid)
      val setRelativeTo_ = call (getSymbol "gtk_popover_set_relative_to") (GtkPopoverClass.PolyML.cPtr &&> GtkWidgetClass.PolyML.cOptPtr --> cVoid)
      val setTransitionsEnabled_ = call (getSymbol "gtk_popover_set_transitions_enabled") (GtkPopoverClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
    end
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
          set = fn x => set "constrain-to" GtkPopoverConstraint.t x,
          new = fn x => new "constrain-to" GtkPopoverConstraint.t x
        }
      val modalProp =
        {
          get = fn x => get "modal" boolean x,
          set = fn x => set "modal" boolean x,
          new = fn x => new "modal" boolean x
        }
      val pointingToProp =
        {
          get = fn x => get "pointing-to" GdkRectangleRecord.tOpt x,
          set = fn x => set "pointing-to" GdkRectangleRecord.tOpt x,
          new = fn x => new "pointing-to" GdkRectangleRecord.tOpt x
        }
      val positionProp =
        {
          get = fn x => get "position" GtkPositionType.t x,
          set = fn x => set "position" GtkPositionType.t x,
          new = fn x => new "position" GtkPositionType.t x
        }
      val relativeToProp =
        {
          get = fn x => get "relative-to" GtkWidgetClass.tOpt x,
          set = fn x => set "relative-to" GtkWidgetClass.tOpt x,
          new = fn x => new "relative-to" GtkWidgetClass.tOpt x
        }
      val transitionsEnabledProp =
        {
          get = fn x => get "transitions-enabled" boolean x,
          set = fn x => set "transitions-enabled" boolean x,
          new = fn x => new "transitions-enabled" boolean x
        }
    end
  end
