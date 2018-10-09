signature GIO_SIMPLE_PERMISSION =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : bool -> base class
  end
