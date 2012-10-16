signature PID =
  sig
    type t = Posix.Process.pid

    val null : t

    structure C :
      sig
        type val_
        type ref_
        val withVal : (val_ -> 'a) -> t -> 'a
        val withRefVal : (ref_ -> 'a) -> t -> (val_, 'a) pair
        val fromVal : val_ -> t
      end
  end
