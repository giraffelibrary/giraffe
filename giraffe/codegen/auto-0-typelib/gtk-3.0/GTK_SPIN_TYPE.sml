signature GTK_SPIN_TYPE =
  sig
    datatype enum =
      STEP_FORWARD
    | STEP_BACKWARD
    | PAGE_FORWARD
    | PAGE_BACKWARD
    | HOME
    | END
    | USER_DEFINED
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
