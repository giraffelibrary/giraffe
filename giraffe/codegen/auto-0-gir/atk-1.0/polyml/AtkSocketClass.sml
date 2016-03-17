structure AtkSocketClass :>
  ATK_SOCKET_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a socket = unit
    type 'a object_class = 'a AtkObjectClass.class
    type 'a class = 'a socket object_class
    type t = base class
    fun toBase obj = obj
    val t = AtkObjectClass.t
    val tOpt = AtkObjectClass.tOpt
    structure C = AtkObjectClass.C
  end
