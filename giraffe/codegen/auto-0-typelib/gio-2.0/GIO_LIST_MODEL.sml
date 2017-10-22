signature GIO_LIST_MODEL =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getNItems : 'a class -> LargeInt.int
    val getItem :
      'a class
       -> LargeInt.int
       -> base GObject.ObjectClass.class option
    val itemsChanged :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val itemsChangedSig :
      (LargeInt.int
        * LargeInt.int
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
  end
