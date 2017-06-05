signature GTK_FILE_CHOOSER_CONFIRMATION =
  sig
    datatype enum =
      CONFIRM
    | ACCEPT_FILENAME
    | SELECT_AGAIN
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
