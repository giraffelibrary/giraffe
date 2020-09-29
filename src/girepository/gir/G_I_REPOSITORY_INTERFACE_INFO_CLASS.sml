signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfo_class
    type 'a class = 'a interfaceinfo registeredtypeinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a interfaceinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a interfaceinfo
        val update : ('a -> 'b) -> 'a interfaceinfo -> 'b interfaceinfo
      end
  end
