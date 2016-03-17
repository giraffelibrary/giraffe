signature G_I_REPOSITORY_ARG_INFO_CLASS =
  sig
    type 'a arginfo
    type 'a baseinfo_class
    type 'a class = 'a arginfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a arginfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a arginfo
        val update : ('a -> 'b) -> 'a arginfo -> 'b arginfo
      end
  end
