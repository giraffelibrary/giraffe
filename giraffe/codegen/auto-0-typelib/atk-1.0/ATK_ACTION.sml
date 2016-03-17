signature ATK_ACTION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val doAction :
      'a class
       -> LargeInt.int
       -> bool
    val getDescription :
      'a class
       -> LargeInt.int
       -> string
    val getKeybinding :
      'a class
       -> LargeInt.int
       -> string
    val getLocalizedName :
      'a class
       -> LargeInt.int
       -> string
    val getNActions : 'a class -> LargeInt.int
    val getName :
      'a class
       -> LargeInt.int
       -> string
    val setDescription :
      'a class
       -> LargeInt.int
       -> string
       -> bool
  end
