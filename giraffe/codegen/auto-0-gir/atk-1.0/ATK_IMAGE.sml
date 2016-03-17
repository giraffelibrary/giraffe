signature ATK_IMAGE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getImageDescription : 'a class -> string
    val getImageLocale : 'a class -> string
    val setImageDescription :
      'a class
       -> string
       -> bool
  end
