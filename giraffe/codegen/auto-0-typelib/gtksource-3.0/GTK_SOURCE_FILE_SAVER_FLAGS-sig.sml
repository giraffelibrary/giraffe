signature GTK_SOURCE_FILE_SAVER_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val IGNORE_INVALID_CHARS : t
    val IGNORE_MODIFICATION_TIME : t
    val CREATE_BACKUP : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
