signature GIO_FILE_CREATE_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val PRIVATE : t
    val REPLACE_DESTINATION : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
