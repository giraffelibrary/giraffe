signature GDK_WINDOW_EDGE =
  sig
    datatype t =
      NORTHWEST
    | NORTH
    | NORTHEAST
    | WEST
    | EAST
    | SOUTHWEST
    | SOUTH
    | SOUTHEAST
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
        exception Value of FFI.Enum.val_
      end
  end
