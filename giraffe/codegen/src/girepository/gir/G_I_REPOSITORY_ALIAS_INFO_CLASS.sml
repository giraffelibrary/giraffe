signature G_I_REPOSITORY_ALIAS_INFO_CLASS =
  sig
    type 'a aliasinfo
    type 'a baseinfo_class
    type 'a class = 'a aliasinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a aliasinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a aliasinfo
        val update : ('a -> 'b) -> 'a aliasinfo -> 'b aliasinfo
      end
  end
