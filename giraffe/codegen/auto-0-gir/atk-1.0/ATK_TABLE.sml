signature ATK_TABLE =
  sig
    type 'a class_t
    type 'a object_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val addColumnSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val addRowSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val getCaption : 'a class_t -> base object_class_t
    val getColumnAtIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getColumnDescription :
      'a class_t
       -> LargeInt.int
       -> string
    val getColumnExtentAt :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getColumnHeader :
      'a class_t
       -> LargeInt.int
       -> base object_class_t
    val getIndexAt :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getNColumns : 'a class_t -> LargeInt.int
    val getNRows : 'a class_t -> LargeInt.int
    val getRowAtIndex :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
    val getRowDescription :
      'a class_t
       -> LargeInt.int
       -> string
    val getRowExtentAt :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> LargeInt.int
    val getRowHeader :
      'a class_t
       -> LargeInt.int
       -> base object_class_t
    val getSummary : 'a class_t -> base object_class_t
    val isColumnSelected :
      'a class_t
       -> LargeInt.int
       -> bool
    val isRowSelected :
      'a class_t
       -> LargeInt.int
       -> bool
    val isSelected :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> bool
    val refAt :
      'a class_t
       -> LargeInt.int
       -> LargeInt.int
       -> base object_class_t
    val removeColumnSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val removeRowSelection :
      'a class_t
       -> LargeInt.int
       -> bool
    val setCaption :
      'a class_t
       -> 'b object_class_t
       -> unit
    val setColumnDescription :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val setColumnHeader :
      'a class_t
       -> LargeInt.int
       -> 'b object_class_t
       -> unit
    val setRowDescription :
      'a class_t
       -> LargeInt.int
       -> string
       -> unit
    val setRowHeader :
      'a class_t
       -> LargeInt.int
       -> 'b object_class_t
       -> unit
    val setSummary :
      'a class_t
       -> 'b object_class_t
       -> unit
    val columnDeletedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val columnInsertedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val columnReorderedSig : (unit -> unit) -> 'a class_t Signal.signal
    val modelChangedSig : (unit -> unit) -> 'a class_t Signal.signal
    val rowDeletedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val rowInsertedSig :
      (LargeInt.int
        -> LargeInt.int
        -> unit)
       -> 'a class_t Signal.signal
    val rowReorderedSig : (unit -> unit) -> 'a class_t Signal.signal
  end
