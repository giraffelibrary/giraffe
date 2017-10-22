signature GIO_LIST_STORE =
  sig
    type 'a class
    type 'a list_model_class
    type t = base class
    val asListModel : 'a class -> base list_model_class
    val getType : unit -> GObject.Type.t
    val append :
      'a class
       -> 'b GObject.ObjectClass.class
       -> unit
    val insert :
      'a class
       -> LargeInt.int * 'b GObject.ObjectClass.class
       -> unit
    val remove :
      'a class
       -> LargeInt.int
       -> unit
    val removeAll : 'a class -> unit
    val splice :
      'a class
       -> LargeInt.int
           * LargeInt.int
           * base GObject.ObjectClass.class vector
       -> unit
  end
