signature GTK_GRID =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type position_type_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val attach :
      'a class
       -> 'b widget_class
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val attachNextTo :
      'a class
       -> 'b widget_class
       -> 'c widget_class
       -> position_type_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val getColumnHomogeneous : 'a class -> bool
    val getColumnSpacing : 'a class -> LargeInt.int
    val getRowHomogeneous : 'a class -> bool
    val getRowSpacing : 'a class -> LargeInt.int
    val insertColumn :
      'a class
       -> LargeInt.int
       -> unit
    val insertNextTo :
      'a class
       -> 'b widget_class
       -> position_type_t
       -> unit
    val insertRow :
      'a class
       -> LargeInt.int
       -> unit
    val setColumnHomogeneous :
      'a class
       -> bool
       -> unit
    val setColumnSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val setRowHomogeneous :
      'a class
       -> bool
       -> unit
    val setRowSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val columnHomogeneousProp : ('a class, bool, bool) Property.readwrite
    val columnSpacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
    val rowHomogeneousProp : ('a class, bool, bool) Property.readwrite
    val rowSpacingProp : ('a class, LargeInt.int, LargeInt.int) Property.readwrite
  end
