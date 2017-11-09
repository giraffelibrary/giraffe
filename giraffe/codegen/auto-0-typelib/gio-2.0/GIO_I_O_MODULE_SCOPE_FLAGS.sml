signature GIO_I_O_MODULE_SCOPE_FLAGS =
  sig
    datatype enum =
      NONE
    | BLOCK_DUPLICATES
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
