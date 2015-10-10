signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfoclass_t
    type 'a t = 'a signalinfo callableinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a signalinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a signalinfo
        val update : ('a -> 'b) -> 'a signalinfo -> 'b signalinfo
      end
  end
