signature GIO_SRV_TARGET =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val new :
      string
       * LargeInt.int
       * LargeInt.int
       * LargeInt.int
       -> t
    val copy : t -> t
    val getHostname : t -> string
    val getPort : t -> LargeInt.int
    val getPriority : t -> LargeInt.int
    val getWeight : t -> LargeInt.int
  end
