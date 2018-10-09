signature PANGO_ENGINE_LANG =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
  end
