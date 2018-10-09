signature GTK_PRINT_OPERATION_ACTION =
  sig
    datatype enum =
      PRINT_DIALOG
    | PRINT
    | PREVIEW
    | EXPORT
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
