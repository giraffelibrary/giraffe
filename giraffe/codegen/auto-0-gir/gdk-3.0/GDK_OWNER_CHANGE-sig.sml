signature GDK_OWNER_CHANGE =
  sig
    datatype enum =
      NEW_OWNER
    | DESTROY
    | CLOSE
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
