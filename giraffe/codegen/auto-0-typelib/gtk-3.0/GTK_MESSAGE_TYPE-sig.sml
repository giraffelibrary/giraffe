signature GTK_MESSAGE_TYPE =
  sig
    datatype enum =
      INFO
    | WARNING
    | QUESTION
    | ERROR
    | OTHER
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
