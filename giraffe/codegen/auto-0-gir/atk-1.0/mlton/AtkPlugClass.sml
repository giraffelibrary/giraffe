structure AtkPlugClass :>
  ATK_PLUG_CLASS
    where type 'a object_class = 'a AtkObjectClass.class
    where type C.notnull = AtkObjectClass.C.notnull
    where type 'a C.p = 'a AtkObjectClass.C.p =
  struct
    type 'a object_class = 'a AtkObjectClass.class
    open AtkObjectClass
    type 'a plug = unit
    type 'a class = 'a plug class
  end
