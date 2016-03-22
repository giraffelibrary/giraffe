structure AtkSocketClass :>
  ATK_SOCKET_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a object_class = 'a AtkObjectClass.class
    open AtkObjectClass
    type 'a socket = unit
    type 'a class = 'a socket class
  end
