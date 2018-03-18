signature GTK_CELL_AREA_CONTEXT =
  sig
    type 'a class
    type 'a cell_area_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val allocate :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val getAllocation : 'a class -> LargeInt.int * LargeInt.int
    val getArea : 'a class -> base cell_area_class
    val getPreferredHeight : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredWidth : 'a class -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val pushPreferredHeight :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val pushPreferredWidth :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val reset : 'a class -> unit
    val areaProp :
      {
        get : 'a class -> base cell_area_class option,
        new : 'b cell_area_class option -> 'a class Property.t
      }
    val minimumHeightProp : {get : 'a class -> LargeInt.int}
    val minimumWidthProp : {get : 'a class -> LargeInt.int}
    val naturalHeightProp : {get : 'a class -> LargeInt.int}
    val naturalWidthProp : {get : 'a class -> LargeInt.int}
  end
