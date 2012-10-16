signature G_I_REPOSITORY_NVOKE_ERROR =
  sig
    datatype t =
      FAILED
    | SYMBOLNOTFOUND
    | ARGUMENTMISMATCH
    exception Error of t
    val handler : GLib.ErrorRecord.handler
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
