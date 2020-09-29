signature G_I_REPOSITORY_SIGNAL_INFO_CLASS =
  sig
    type 'a signalinfo
    type 'a callableinfo_class
    type 'a class = 'a signalinfo callableinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a signalinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a signalinfo
        val update : ('a -> 'b) -> 'a signalinfo -> 'b signalinfo
      end
  end
