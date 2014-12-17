signature GTK_SOURCE_MARK =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new :
      string
       -> string
       -> base class_t
    val getCategory : 'a class_t -> string
    val next :
      'a class_t
       -> string option
       -> base class_t
    val prev :
      'a class_t
       -> string
       -> base class_t
    val categoryProp : ('a class_t, string option, string option) Property.readwrite
  end
