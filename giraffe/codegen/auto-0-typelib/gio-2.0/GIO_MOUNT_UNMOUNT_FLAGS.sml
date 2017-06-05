signature GIO_MOUNT_UNMOUNT_FLAGS =
  sig
    include FLAGS
    val NONE : t
    val FORCE : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
