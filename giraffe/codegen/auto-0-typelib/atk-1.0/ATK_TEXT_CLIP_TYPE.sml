signature ATK_TEXT_CLIP_TYPE =
  sig
    datatype enum =
      NONE
    | MIN
    | MAX
    | BOTH
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
