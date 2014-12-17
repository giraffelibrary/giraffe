signature CAIRO_REGION =
  sig
    type record_t
    type t = record_t
    val getType : unit -> GObject.Type.t
  end
