signature GDK_GRAB_STATUS =
  sig
    datatype enum =
      SUCCESS
    | ALREADY_GRABBED
    | INVALID_TIME
    | NOT_VIEWABLE
    | FROZEN
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
