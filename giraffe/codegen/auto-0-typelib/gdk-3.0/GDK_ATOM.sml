signature GDK_ATOM =
  sig
    type t
    val name : t -> string
    val intern : string * bool -> t
    val internStaticString : string -> t
  end
