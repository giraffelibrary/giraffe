signature G_LIB_CHECKSUM =
  sig
    type t
    type checksum_type_t
    val getType : unit -> GObject.Type.t
    val new : checksum_type_t -> t
    val copy : t -> t
    val getString : t -> string
    val reset : t -> unit
    val update :
      t
       -> GUInt8CArrayN.t
       -> unit
    val typeGetLength : checksum_type_t -> int
  end
