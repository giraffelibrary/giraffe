signature GTK_NUMBER_UP_LAYOUT =
  sig
    datatype enum =
      LRTB
    | LRBT
    | RLTB
    | RLBT
    | TBLR
    | TBRL
    | BTLR
    | BTRL
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
