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
    include
      ENUM
        where type t = enum
    val t : (t, t) ValueAccessor.t
    val getType : unit -> GObject.Type.t
  end
