signature ATK_STREAMABLE_CONTENT =
  sig
    type 'a class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val getMimeType :
      'a class_t
       -> LargeInt.int
       -> string
    val getNMimeTypes : 'a class_t -> LargeInt.int
    val getStream :
      'a class_t
       -> string
       -> GLib.IOChannelRecord.t
    val getUri :
      'a class_t
       -> string
       -> string
  end
