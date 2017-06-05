signature GTK_ASSISTANT_PAGE_TYPE =
  sig
    datatype enum =
      CONTENT
    | INTRO
    | CONFIRM
    | SUMMARY
    | PROGRESS
    | CUSTOM
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
