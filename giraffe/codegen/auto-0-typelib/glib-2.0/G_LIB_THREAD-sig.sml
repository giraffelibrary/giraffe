signature G_LIB_THREAD =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val self : unit -> t
    val yield : unit -> unit
  end
