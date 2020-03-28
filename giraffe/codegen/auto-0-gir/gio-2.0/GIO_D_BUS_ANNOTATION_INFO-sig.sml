signature GIO_D_BUS_ANNOTATION_INFO =
  sig
    type t
    type d_bus_annotation_info_record_c_array_t
    val getType : unit -> GObject.Type.t
    val lookup : d_bus_annotation_info_record_c_array_t option * string -> string
  end
