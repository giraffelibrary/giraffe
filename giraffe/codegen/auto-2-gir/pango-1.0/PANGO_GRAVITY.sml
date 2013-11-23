signature PANGO_GRAVITY =
  sig
    datatype t =
      SOUTH
    | EAST
    | NORTH
    | WEST
    | AUTO
    val null : t
    val t : (t, t) GObject.Value.accessor
    type script_t
    type gravityhint_t
    type matrixrecord_t
    val getType : unit -> GObject.Type.t
    val getForMatrix : matrixrecord_t -> t
    val getForScript :
      script_t
       -> t
       -> gravityhint_t
       -> t
    val getForScriptAndWidth :
      script_t
       -> bool
       -> t
       -> gravityhint_t
       -> t
    val toRotation : t -> real
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
