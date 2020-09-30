signature G_I_REPOSITORY_PROPERTY_INFO_CLASS =
  sig
    type 'a propertyinfo
    type 'a baseinfo_class
    type 'a class = 'a propertyinfo baseinfo_class
    type t = base class
    val toBase : 'a class -> base class
    structure Obj :
      sig
        type data
        val unpack : 'a propertyinfo -> (data, 'a) pair
        val pack : (data, 'a) pair -> 'a propertyinfo
        val update : ('a -> 'b) -> 'a propertyinfo -> 'b propertyinfo
      end
  end
