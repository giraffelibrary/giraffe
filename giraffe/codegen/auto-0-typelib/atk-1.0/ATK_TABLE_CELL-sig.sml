signature ATK_TABLE_CELL =
  sig
    type 'a class
    type 'a object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getColumnSpan : 'a class -> LargeInt.int
    val getPosition : 'a class -> (LargeInt.int * LargeInt.int) option
    val getRowColumnSpan :
      'a class
       -> (LargeInt.int
            * LargeInt.int
            * LargeInt.int
            * LargeInt.int)
            option
    val getRowSpan : 'a class -> LargeInt.int
    val getTable : 'a class -> base object_class
  end
