signature G_LIB_MARKUP_PARSE_CONTEXT =
  sig
    type t
    val getType : unit -> GObject.Type.t
    val endParse : t -> unit
    val getElement : t -> string
    val parse :
      t
       -> string * LargeInt.int
       -> unit
  end
