signature GDK_ATOM =
  sig
    type record_t
    val name : record_t -> string
    val intern :
      string
       -> bool
       -> record_t
    val internStaticString : string -> record_t
  end
