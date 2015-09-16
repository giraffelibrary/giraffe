signature GTK_GRID =
  sig
    type 'a class_t
    type 'a buildable_class_t
    type 'a orientable_class_t
    type position_type_t
    type 'a widget_class_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildable_class_t
    val asOrientable : 'a class_t -> base orientable_class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val attach :
      'a class_t
       -> 'b widget_class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val attachNextTo :
      'a class_t
       -> 'b widget_class_t
       -> 'c widget_class_t
       -> position_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val getColumnHomogeneous : 'a class_t -> bool
    val getColumnSpacing : 'a class_t -> LargeInt.int
    val getRowHomogeneous : 'a class_t -> bool
    val getRowSpacing : 'a class_t -> LargeInt.int
    val insertColumn :
      'a class_t
       -> LargeInt.int
       -> unit
    val insertNextTo :
      'a class_t
       -> 'b widget_class_t
       -> position_type_t
       -> unit
    val insertRow :
      'a class_t
       -> LargeInt.int
       -> unit
    val setColumnHomogeneous :
      'a class_t
       -> bool
       -> unit
    val setColumnSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val setRowHomogeneous :
      'a class_t
       -> bool
       -> unit
    val setRowSpacing :
      'a class_t
       -> LargeInt.int
       -> unit
    val columnHomogeneousProp : ('a class_t, bool, bool) Property.readwrite
    val columnSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rowHomogeneousProp : ('a class_t, bool, bool) Property.readwrite
    val rowSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
