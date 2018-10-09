signature GIO_MENU_MODEL =
  sig
    type 'a class
    type 'a menu_attribute_iter_class
    type 'a menu_link_iter_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getItemAttributeValue :
      'a class
       -> LargeInt.int
           * string
           * GLib.VariantTypeRecord.t option
       -> GLib.VariantRecord.t
    val getItemLink :
      'a class
       -> LargeInt.int * string
       -> base class
    val getNItems : 'a class -> LargeInt.int
    val isMutable : 'a class -> bool
    val itemsChanged :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * LargeInt.int
       -> unit
    val iterateItemAttributes :
      'a class
       -> LargeInt.int
       -> base menu_attribute_iter_class
    val iterateItemLinks :
      'a class
       -> LargeInt.int
       -> base menu_link_iter_class
    val itemsChangedSig :
      (LargeInt.int
        * LargeInt.int
        * LargeInt.int
        -> unit)
       -> 'a class Signal.t
  end
