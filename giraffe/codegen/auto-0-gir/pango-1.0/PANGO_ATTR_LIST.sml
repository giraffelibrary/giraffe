signature PANGO_ATTR_LIST =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new : unit -> t
    val copy : t -> t option
    val splice :
      t
       -> t
           * LargeInt.int
           * LargeInt.int
       -> unit
  end
