signature GTK_BOX =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type orientation_t
    type pack_type_t
    type 'a widget_class
    type baseline_position_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : orientation_t * LargeInt.int -> base class
    val getBaselinePosition : 'a class -> baseline_position_t
    val getCenterWidget : 'a class -> base widget_class option
    val getHomogeneous : 'a class -> bool
    val getSpacing : 'a class -> LargeInt.int
    val packEnd :
      'a class
       -> 'b widget_class
           * bool
           * bool
           * LargeInt.int
       -> unit
    val packStart :
      'a class
       -> 'b widget_class
           * bool
           * bool
           * LargeInt.int
       -> unit
    val queryChildPacking :
      'a class
       -> 'b widget_class
       -> bool
           * bool
           * LargeInt.int
           * pack_type_t
    val reorderChild :
      'a class
       -> 'b widget_class * LargeInt.int
       -> unit
    val setBaselinePosition :
      'a class
       -> baseline_position_t
       -> unit
    val setCenterWidget :
      'a class
       -> 'b widget_class option
       -> unit
    val setChildPacking :
      'a class
       -> 'b widget_class
           * bool
           * bool
           * LargeInt.int
           * pack_type_t
       -> unit
    val setHomogeneous :
      'a class
       -> bool
       -> unit
    val setSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val baselinePositionProp : ('a class, baseline_position_t, baseline_position_t) Property.readwrite
    val homogeneousProp : ('a class, bool, bool) Property.readwrite
    val spacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
