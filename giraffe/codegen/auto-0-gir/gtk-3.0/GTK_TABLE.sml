signature GTK_TABLE =
  sig
    type 'a class_t
    type 'a buildableclass_t
    type attachoptions_t
    type 'a widgetclass_t
    type t = base class_t
    val asImplementorIface : 'a class_t -> base Atk.ImplementorIfaceClass.t
    val asBuildable : 'a class_t -> base buildableclass_t
    val getType : unit -> GObject.Type.t
    val new :
      LargeInt.int
       -> LargeInt.int
       -> bool
       -> base class_t
    val attach :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> attachoptions_t
       -> attachoptions_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val attachDefaults :
      'a class_t
       -> 'b widgetclass_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val getColSpacing :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getDefaultColSpacing : 'a class_t -> LargeInt.int
    val getDefaultRowSpacing : 'a class_t -> LargeInt.int
    val getHomogeneous : 'a class_t -> bool
    val getRowSpacing :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getSize : 'a class_t -> LargeInt.int * LargeInt.int
    val resize :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setColSpacing :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setColSpacings :
      'a class_t
       -> LargeInt.int
       -> unit
    val setHomogeneous :
      'a class_t
       -> bool
       -> unit
    val setRowSpacing :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val setRowSpacings :
      'a class_t
       -> LargeInt.int
       -> unit
    val columnSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val homogeneousProp : ('a class_t, bool, bool) Property.readwrite
    val nColumnsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val nRowsProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
    val rowSpacingProp : ('a class_t, LargeInt.int, LargeInt.int) Property.readwrite
  end
