signature GTK_GRID =
  sig
    type 'a class
    type 'a buildable_class
    type 'a orientable_class
    type position_type_t
    type 'a widget_class
    type baseline_position_t
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val asOrientable : 'a class -> base orientable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val attach :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val attachNextTo :
      'a class
       -> 'b widget_class
           * 'c widget_class option
           * position_type_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val getBaselineRow : 'a class -> LargeInt.int
    val getChildAt :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base widget_class option
    val getColumnHomogeneous : 'a class -> bool
    val getColumnSpacing : 'a class -> LargeInt.int
    val getRowBaselinePosition :
      'a class
       -> LargeInt.int
       -> baseline_position_t
    val getRowHomogeneous : 'a class -> bool
    val getRowSpacing : 'a class -> LargeInt.int
    val insertColumn :
      'a class
       -> LargeInt.int
       -> unit
    val insertNextTo :
      'a class
       -> 'b widget_class * position_type_t
       -> unit
    val insertRow :
      'a class
       -> LargeInt.int
       -> unit
    val removeColumn :
      'a class
       -> LargeInt.int
       -> unit
    val removeRow :
      'a class
       -> LargeInt.int
       -> unit
    val setBaselineRow :
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
    val setRowBaselinePosition :
      'a class
       -> LargeInt.int * baseline_position_t
       -> unit
    val setRowHomogeneous :
      'a class
       -> bool
       -> unit
    val setRowSpacing :
      'a class
       -> LargeInt.int
       -> unit
    val baselineRowProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val columnHomogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val columnSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
    val rowHomogeneousProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val rowSpacingProp :
      {
        get : 'a class -> LargeInt.int,
        set :
          LargeInt.int
           -> 'a class
           -> unit,
        new : LargeInt.int -> 'a class Property.t
      }
  end