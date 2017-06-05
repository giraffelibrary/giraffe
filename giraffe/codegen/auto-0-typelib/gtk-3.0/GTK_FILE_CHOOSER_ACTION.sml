signature GTK_FILE_CHOOSER_ACTION =
  sig
    datatype enum =
      OPEN
    | SAVE
    | SELECT_FOLDER
    | CREATE_FOLDER
    include
      ENUM
        where type t = enum
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
  end
