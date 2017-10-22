signature GIO_D_BUS_ANNOTATION_INFO =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val lookup : t vector option * string -> string
  end
