signature GIO_FILE_MONITOR_EVENT =
  sig
    datatype enum =
      CHANGED
    | CHANGES_DONE_HINT
    | DELETED
    | CREATED
    | ATTRIBUTE_CHANGED
    | PRE_UNMOUNT
    | UNMOUNTED
    | MOVED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
