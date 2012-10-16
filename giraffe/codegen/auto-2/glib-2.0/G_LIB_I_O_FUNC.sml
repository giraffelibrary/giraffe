signature G_LIB_I_O_FUNC =
  sig
    type iochannelrecord_t
    type iocondition_t

    type t = iochannelrecord_t * iocondition_t -> bool

    structure C :
      sig
        type callback
        val withCallback : (callback -> 'a) -> t -> 'a
      end
  end
