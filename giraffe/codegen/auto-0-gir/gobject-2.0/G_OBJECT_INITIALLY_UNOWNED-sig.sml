signature G_OBJECT_INITIALLY_UNOWNED =
  sig
    type 'a class
    type type_t
    type t = base class
    val getType : unit -> type_t
  end
