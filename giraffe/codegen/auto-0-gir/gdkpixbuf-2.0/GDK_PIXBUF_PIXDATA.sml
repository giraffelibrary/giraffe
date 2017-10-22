signature GDK_PIXBUF_PIXDATA =
  sig
    type t
    type pixdata_dump_type_t
    val deserialize :
      t
       -> Word8Vector.vector
       -> unit
    val serialize : t -> Word8Vector.vector
    val toCsource :
      t
       -> string * pixdata_dump_type_t
       -> GLib.StringRecord.t
  end
