signature GIO_FILE_COPY_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val OVERWRITE : t
    val BACKUP : t
    val NOFOLLOW_SYMLINKS : t
    val ALL_METADATA : t
    val NO_FALLBACK_FOR_MOVE : t
    val TARGET_DEFAULT_PERMS : t
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
