signature G_I_REPOSITORY_INTERFACE_INFO_CLASS =
  sig
    type 'a interfaceinfo
    type 'a registeredtypeinfoclass_t
    type 'a t = 'a interfaceinfo registeredtypeinfoclass_t
    val toBase : 'a t -> base t
    structure Obj :
      sig
        type data
        val unpack : 'a interfaceinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a interfaceinfo
        val update : ('a -> 'b) -> 'a interfaceinfo -> 'b interfaceinfo
      end
  end
