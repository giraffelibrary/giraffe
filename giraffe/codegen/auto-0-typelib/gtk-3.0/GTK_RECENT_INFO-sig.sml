signature GTK_RECENT_INFO =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val createAppInfo :
      t
       -> string option
       -> base Gio.AppInfoClass.class option
    val exists : t -> bool
    val getAdded : t -> LargeInt.int
    val getAge : t -> LargeInt.int
    val getApplicationInfo :
      t
       -> string
       -> (string
            * LargeInt.int
            * LargeInt.int)
            option
    val getApplications : t -> Utf8CPtrArrayN.t
    val getDescription : t -> string
    val getDisplayName : t -> string
    val getGicon : t -> base Gio.IconClass.class option
    val getGroups : t -> Utf8CPtrArrayN.t
    val getIcon :
      t
       -> LargeInt.int
       -> base GdkPixbuf.PixbufClass.class option
    val getMimeType : t -> string
    val getModified : t -> LargeInt.int
    val getPrivateHint : t -> bool
    val getShortName : t -> string
    val getUri : t -> string
    val getUriDisplay : t -> string option
    val getVisited : t -> LargeInt.int
    val hasApplication :
      t
       -> string
       -> bool
    val hasGroup :
      t
       -> string
       -> bool
    val isLocal : t -> bool
    val lastApplication : t -> string
    val match :
      t
       -> t
       -> bool
  end
