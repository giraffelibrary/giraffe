signature GTK_SOURCE_REGION_ITER =
  sig
    type t
    val getSubregion : t -> (Gtk.TextIterRecord.t * Gtk.TextIterRecord.t) option
    val isEnd : t -> bool
    val next : t -> bool
  end
