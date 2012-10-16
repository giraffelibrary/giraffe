signature ATK_IMAGE =
  sig
    type 'a class_t
    val getType : unit -> GObject.Type.t
    val getImageDescription : 'a class_t -> string
    val getImageLocale : 'a class_t -> string
    val setImageDescription :
      'a class_t
       -> string
       -> bool
  end
