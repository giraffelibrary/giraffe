signature GTK_CSS_PROVIDER =
  sig
    type 'a class
    type 'a style_provider_class
    type t = base class
    val asStyleProvider : 'a class -> base style_provider_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val getDefault : unit -> base class
    val getNamed :
      string
       -> string option
       -> base class
    val loadFromData :
      'a class
       -> Word8Vector.vector
       -> bool
    val loadFromFile :
      'a class
       -> 'b Gio.FileClass.class
       -> bool
    val loadFromPath :
      'a class
       -> string
       -> bool
    val toString : 'a class -> string
  end
