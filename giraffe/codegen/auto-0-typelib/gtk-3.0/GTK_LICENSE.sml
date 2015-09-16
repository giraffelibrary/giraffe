signature GTK_LICENSE =
  sig
    datatype t =
      UNKNOWN
    | CUSTOM
    | GPL_2_0
    | GPL_3_0
    | LGPL_2_1
    | LGPL_3_0
    | BSD
    | MIT_X_11
    | ARTISTIC
    val null : t
    val t : (t, t) GObject.Value.accessor
    val getType : unit -> GObject.Type.t
    structure C :
      sig
        type val_
        type ref_
        val withVal :
          (val_ -> 'a)
           -> t
           -> 'a
        val withRefVal :
          (ref_ -> 'a)
           -> t
           -> (val_, 'a) pair
        val fromVal : val_ -> t
        exception Value of FFI.Enum.C.val_
      end
  end
