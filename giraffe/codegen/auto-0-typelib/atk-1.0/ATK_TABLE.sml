signature ATK_TABLE =
  sig
    type 'a class
    type 'a object_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val addColumnSelection :
      'a class
       -> LargeInt.int
       -> bool
    val addRowSelection :
      'a class
       -> LargeInt.int
       -> bool
    val getCaption : 'a class -> base object_class
    val getColumnAtIndex :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getColumnDescription :
      'a class
       -> LargeInt.int
       -> string
    val getColumnExtentAt :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getColumnHeader :
      'a class
       -> LargeInt.int
       -> base object_class
    val getIndexAt :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getNColumns : 'a class -> LargeInt.int
    val getNRows : 'a class -> LargeInt.int
    val getRowAtIndex :
      'a class
       -> LargeInt.int
       -> LargeInt.int
    val getRowDescription :
      'a class
       -> LargeInt.int
       -> string
    val getRowExtentAt :
      'a class
       -> LargeInt.int * LargeInt.int
       -> LargeInt.int
    val getRowHeader :
      'a class
       -> LargeInt.int
       -> base object_class
    val getSummary : 'a class -> base object_class
    val isColumnSelected :
      'a class
       -> LargeInt.int
       -> bool
    val isRowSelected :
      'a class
       -> LargeInt.int
       -> bool
    val isSelected :
      'a class
       -> LargeInt.int * LargeInt.int
       -> bool
    val refAt :
      'a class
       -> LargeInt.int * LargeInt.int
       -> base object_class
    val removeColumnSelection :
      'a class
       -> LargeInt.int
       -> bool
    val removeRowSelection :
      'a class
       -> LargeInt.int
       -> bool
    val setCaption :
      'a class
       -> 'b object_class
       -> unit
    val setColumnDescription :
      'a class
       -> LargeInt.int * string
       -> unit
    val setColumnHeader :
      'a class
       -> LargeInt.int * 'b object_class
       -> unit
    val setRowDescription :
      'a class
       -> LargeInt.int * string
       -> unit
    val setRowHeader :
      'a class
       -> LargeInt.int * 'b object_class
       -> unit
    val setSummary :
      'a class
       -> 'b object_class
       -> unit
    val columnDeletedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val columnInsertedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val columnReorderedSig : (unit -> unit) -> 'a class Signal.t
    val modelChangedSig : (unit -> unit) -> 'a class Signal.t
    val rowDeletedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val rowInsertedSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val rowReorderedSig : (unit -> unit) -> 'a class Signal.t
  end
