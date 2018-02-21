signature ATK_IMAGE =
  sig
    type 'a class
    type coord_type_t
    type t = base class
    val getType : unit -> GObject.Type.t
    val getImageDescription : 'a class -> string
    val getImageLocale : 'a class -> string option
    val getImagePosition :
      'a class
       -> coord_type_t
       -> LargeInt.int * LargeInt.int
    val getImageSize : 'a class -> LargeInt.int * LargeInt.int
    val setImageDescription :
      'a class
       -> string
       -> bool
  end
