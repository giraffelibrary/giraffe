signature G_OBJECT_INITIALLY_UNOWNED =
  sig
    type 'a class_t
    type type_t
    type t = base class_t
    val getType : unit -> type_t
  end
