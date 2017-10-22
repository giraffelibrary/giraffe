signature PANGO_ENGINE =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
