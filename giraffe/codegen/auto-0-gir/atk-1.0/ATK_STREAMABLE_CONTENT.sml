signature ATK_STREAMABLE_CONTENT =
  sig
    type 'a class
    type t = base class
    val getType : unit -> GObject.Type.t
    val getMimeType :
      'a class
       -> LargeInt.int
       -> string
    val getNMimeTypes : 'a class -> LargeInt.int
    val getStream :
      'a class
       -> string
       -> GLib.IOChannelRecord.t
    val getUri :
      'a class
       -> string
       -> string
  end
