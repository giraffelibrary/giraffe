signature GTK_POPOVER =
  sig
    type 'a class
    type 'a buildable_class
    type popover_constraint_t
    type position_type_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : 'a widget_class option -> base class
    val newFromModel : 'a widget_class option * 'b Gio.MenuModelClass.class -> base class
    val bindModel :
      'a class
       -> 'b Gio.MenuModelClass.class option * string option
       -> unit
    val getConstrainTo : 'a class -> popover_constraint_t
    val getDefaultWidget : 'a class -> base widget_class option
    val getModal : 'a class -> bool
    val getPointingTo : 'a class -> Gdk.RectangleRecord.t option
    val getPosition : 'a class -> position_type_t
    val getRelativeTo : 'a class -> base widget_class
    val getTransitionsEnabled : 'a class -> bool
    val popdown : 'a class -> unit
    val popup : 'a class -> unit
    val setConstrainTo :
      'a class
       -> popover_constraint_t
       -> unit
    val setDefaultWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setModal :
      'a class
       -> bool
       -> unit
    val setPointingTo :
      'a class
       -> Gdk.RectangleRecord.t
       -> unit
    val setPosition :
      'a class
       -> position_type_t
       -> unit
    val setRelativeTo :
      'a class
       -> 'b widget_class option
       -> unit
    val setTransitionsEnabled :
      'a class
       -> bool
       -> unit
    val closedSig : (unit -> unit) -> 'a class Signal.t
    val constrainToProp : ('a class, unit -> popover_constraint_t, popover_constraint_t -> unit, popover_constraint_t -> unit) Property.t
    val modalProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val pointingToProp : ('a class, unit -> Gdk.RectangleRecord.t option, Gdk.RectangleRecord.t option -> unit, Gdk.RectangleRecord.t option -> unit) Property.t
    val positionProp : ('a class, unit -> position_type_t, position_type_t -> unit, position_type_t -> unit) Property.t
    val relativeToProp : ('a class, unit -> base widget_class option, 'b widget_class option -> unit, 'b widget_class option -> unit) Property.t
    val transitionsEnabledProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
  end
