signature GTK_RECENT_INFO =
  sig
    type record_t
    val getType : unit -> GObject.Type.t
    val createAppInfo :
      record_t
       -> string option
       -> base Gio.AppInfoClass.t
    val exists : record_t -> bool
    val getAdded : record_t -> LargeInt.int
    val getAge : record_t -> LargeInt.int
    val getApplicationInfo :
      record_t
       -> string
       -> (string
            * LargeInt.int
            * LargeInt.int)
            option
    val getDescription : record_t -> string
    val getDisplayName : record_t -> string
    val getGicon : record_t -> base Gio.IconClass.t
    val getIcon :
      record_t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.t
    val getMimeType : record_t -> string
    val getModified : record_t -> LargeInt.int
    val getPrivateHint : record_t -> bool
    val getShortName : record_t -> string
    val getUri : record_t -> string
    val getUriDisplay : record_t -> string
    val getVisited : record_t -> LargeInt.int
    val hasApplication :
      record_t
       -> string
       -> bool
    val hasGroup :
      record_t
       -> string
       -> bool
    val isLocal : record_t -> bool
    val lastApplication : record_t -> string
    val match :
      record_t
       -> record_t
       -> bool
  end
