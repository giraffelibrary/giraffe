signature GTK_CELL_AREA_CONTEXT =
  sig
    type 'a class_t
    type 'a cellareaclass_t
    val getType : unit -> GObject.Type.t
    val allocate :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val getAllocation : 'a class_t -> LargeInt.int * LargeInt.int
    val getArea : 'a class_t -> base cellareaclass_t
    val getPreferredHeight : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredHeightForWidth :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val getPreferredWidth : 'a class_t -> LargeInt.int * LargeInt.int
    val getPreferredWidthForHeight :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int * LargeInt.int
    val pushPreferredHeight :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val pushPreferredWidth :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> unit
    val reset : 'a class_t -> unit
    val areaProp : ('a class_t, base cellareaclass_t option, 'b cellareaclass_t option) Property.readwrite
    val minimumHeightProp : ('a class_t, LargeInt.int) Property.readonly
    val minimumWidthProp : ('a class_t, LargeInt.int) Property.readonly
    val naturalHeightProp : ('a class_t, LargeInt.int) Property.readonly
    val naturalWidthProp : ('a class_t, LargeInt.int) Property.readonly
  end
