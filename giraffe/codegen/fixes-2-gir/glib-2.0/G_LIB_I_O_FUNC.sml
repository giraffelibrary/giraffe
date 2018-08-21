signature G_LIB_I_O_FUNC =
  sig
    type i_o_channel_t
    type i_o_condition_t
    type func = i_o_channel_t * i_o_condition_t -> bool
    include
      NOTIFIED_CALLBACK
        where type t = func
  end
