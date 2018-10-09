signature GTK_PRINT_OPERATION_RESULT =
  sig
    datatype enum =
      ERROR
    | APPLY
    | CANCEL
    | IN_PROGRESS
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
