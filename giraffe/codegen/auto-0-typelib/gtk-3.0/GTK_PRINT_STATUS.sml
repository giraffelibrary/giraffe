signature GTK_PRINT_STATUS =
  sig
    datatype enum =
      INITIAL
    | PREPARING
    | GENERATING_DATA
    | SENDING_DATA
    | PENDING
    | PENDING_ISSUE
    | PRINTING
    | FINISHED
    | FINISHED_ABORTED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
