signature G_I_REPOSITORY_REGISTERED_TYPE_INFO_CLASS =
  sig
    type 'a registeredtypeinfo
    type 'a baseinfo_class
    type 'a class = 'a registeredtypeinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a registeredtypeinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a registeredtypeinfo
        val update : ('a -> 'b) -> 'a registeredtypeinfo -> 'b registeredtypeinfo
      end
  end
