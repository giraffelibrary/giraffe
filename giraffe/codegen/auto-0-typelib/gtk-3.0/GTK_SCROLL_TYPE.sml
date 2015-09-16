signature GTK_SCROLL_TYPE =
  sig
    datatype t =
      NONE
    | JUMP
    | STEP_BACKWARD
    | STEP_FORWARD
    | PAGE_BACKWARD
    | PAGE_FORWARD
    | STEP_UP
    | STEP_DOWN
    | PAGE_UP
    | PAGE_DOWN
    | STEP_LEFT
    | STEP_RIGHT
    | PAGE_LEFT
    | PAGE_RIGHT
    | START
    | END
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
