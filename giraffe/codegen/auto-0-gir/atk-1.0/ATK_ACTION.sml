signature ATK_ACTION =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val doAction :
      'a class_t
       -> LargeInt.int
       -> bool
    val getDescription :
      'a class_t
       -> LargeInt.int
       -> string
    val getKeybinding :
      'a class_t
       -> LargeInt.int
       -> string
    val getLocalizedName :
      'a class_t
       -> LargeInt.int
       -> string
    val getNActions : 'a class_t -> LargeInt.int
    val getName :
      'a class_t
       -> LargeInt.int
       -> string
    val setDescription :
      'a class_t
       -> LargeInt.int
       -> string
       -> bool
  end
