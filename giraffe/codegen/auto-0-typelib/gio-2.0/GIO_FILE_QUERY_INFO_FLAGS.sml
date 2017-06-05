signature GIO_FILE_QUERY_INFO_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val NOFOLLOW_SYMLINKS : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
