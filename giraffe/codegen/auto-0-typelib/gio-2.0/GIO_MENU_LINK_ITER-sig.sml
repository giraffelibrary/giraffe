signature GIO_MENU_LINK_ITER =
  sig
    type 'a class
    type 'a menu_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getName : 'a class -> string
    val getNext : 'a class -> (string * base menu_model_class) option
    val getValue : 'a class -> base menu_model_class
    val next : 'a class -> bool
  end
