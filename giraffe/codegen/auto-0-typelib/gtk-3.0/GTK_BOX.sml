signature GTK_BOX =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type orientation_t
    type pack_type_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new :
      orientation_t
       -> LargeInt.int
       -> base class_t
    val getHomogeneous : 'a class_t -> bool
    val getSpacing : 'a class_t -> LargeInt.int
    val packEnd :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> bool
       -> LargeInt.int
       -> unit
    val packStart :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> bool
       -> LargeInt.int
       -> unit
    val queryChildPacking :
      'a class_t
       -> 'b widget_class_t
       -> bool
           * bool
           * LargeInt.int
           * pack_type_t
    val reorderChild :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> unit
    val setChildPacking :
      'a class_t
       -> 'b widget_class_t
       -> bool
       -> bool
       -> LargeInt.int
       -> pack_type_t
       -> unit
    val setHomogeneous :
      'a class_t
       -> bool
       -> unit
    val setSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val homogeneousProp : ('a class_t, bool, bool) Property.readwrite
    val spacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
