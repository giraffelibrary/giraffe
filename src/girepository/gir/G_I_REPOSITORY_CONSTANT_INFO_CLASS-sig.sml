signature G_I_REPOSITORY_CONSTANT_INFO_CLASS =
  sig
    type 'a constantinfo
    type 'a baseinfo_class
    type 'a class = 'a constantinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a constantinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a constantinfo
        val update : ('a -> 'b) -> 'a constantinfo -> 'b constantinfo
      end
  end
