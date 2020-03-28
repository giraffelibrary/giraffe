signature GDK_PIXBUF_PIXDATA =
  sig
    type t
    type pixdata_dump_type_t
    val deserialize :
      t
       -> GUInt8CArrayN.t
       -> unit
    val serialize : t -> GUInt8CArrayN.t
    val toCsource :
      t
       -> string * pixdata_dump_type_t
       -> GLib.StringRecord.t
  end
