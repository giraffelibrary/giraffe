signature GTK_TABLE =
  sig
    type 'a class
    type 'a buildable_class
    type attach_options_t
    type 'a widget_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       * LargeInt.int
       * bool
       -> base class
    val attach :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * attach_options_t
           * attach_options_t
           * LargeInt.int
           * LargeInt.int
       -> unit
    val attachDefaults :
      'a class
       -> 'b widget_class
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val getColSpacing :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getDefaultColSpacing : 'a class -> LargeInt.int
    val getDefaultRowSpacing : 'a class -> LargeInt.int
    val getHomogeneous : 'a class -> bool
    val getRowSpacing :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getSize : 'a class -> LargeInt.int * LargeInt.int
    val resize :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setColSpacing :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setColSpacings :
      'a class
       -> LargeInt.int
       -> unit
    val setHomogeneous :
      'a class
       -> bool
       -> unit
    val setRowSpacing :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setRowSpacings :
      'a class
       -> LargeInt.int
       -> unit
    val columnSpacingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val homogeneousProp : ('a class, unit -> bool, bool -> unit, bool -> unit) Property.t
    val nColumnsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val nRowsProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
    val rowSpacingProp : ('a class, unit -> LargeInt.int, LargeInt.int -> unit, LargeInt.int -> unit) Property.t
  end
