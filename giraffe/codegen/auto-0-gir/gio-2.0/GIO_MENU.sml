signature GIO_MENU =
  sig
    type 'a class
    type 'a menu_item_class
    type 'a menu_model_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val append :
      'a class
       -> string option * string option
       -> unit
    val appendItem :
      'a class
       -> 'b menu_item_class
       -> unit
    val appendSection :
      'a class
       -> string option * 'b menu_model_class
       -> unit
    val appendSubmenu :
      'a class
       -> string option * 'b menu_model_class
       -> unit
    val freeze : 'a class -> unit
    val insert :
      'a class
       -> LargeInt.int
           * string option
           * string option
       -> unit
    val insertItem :
      'a class
       -> LargeInt.int * 'b menu_item_class
       -> unit
    val insertSection :
      'a class
       -> LargeInt.int
           * string option
           * 'b menu_model_class
       -> unit
    val insertSubmenu :
      'a class
       -> LargeInt.int
           * string option
           * 'b menu_model_class
       -> unit
    val prepend :
      'a class
       -> string option * string option
       -> unit
    val prependItem :
      'a class
       -> 'b menu_item_class
       -> unit
    val prependSection :
      'a class
       -> string option * 'b menu_model_class
       -> unit
    val prependSubmenu :
      'a class
       -> string option * 'b menu_model_class
       -> unit
    val remove :
      'a class
       -> LargeInt.int
       -> unit
    val removeAll : 'a class -> unit
  end
