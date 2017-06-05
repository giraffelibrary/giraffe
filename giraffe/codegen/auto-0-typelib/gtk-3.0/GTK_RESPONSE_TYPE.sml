signature GTK_RESPONSE_TYPE =
  sig
    datatype enum =
      NONE
    | REJECT
    | ACCEPT
    | DELETE_EVENT
    | OK
    | CANCEL
    | CLOSE
    | YES
    | NO
    | APPLY
    | HELP
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
