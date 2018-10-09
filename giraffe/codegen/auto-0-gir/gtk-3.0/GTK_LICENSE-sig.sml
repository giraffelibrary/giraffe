signature GTK_LICENSE =
  sig
    datatype enum =
      UNKNOWN
    | CUSTOM
    | GPL_2_0
    | GPL_3_0
    | LGPL_2_1
    | LGPL_3_0
    | BSD
    | MIT_X_11
    | ARTISTIC
    | GPL_2_0_ONLY
    | GPL_3_0_ONLY
    | LGPL_2_1_ONLY
    | LGPL_3_0_ONLY
    | AGPL_3_0
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
