signature GIO_CONVERTER =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val reset : 'a class -> unit
  end
