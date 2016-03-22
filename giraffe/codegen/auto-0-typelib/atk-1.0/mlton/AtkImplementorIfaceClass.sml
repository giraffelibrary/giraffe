structure AtkImplementorIfaceClass :>
  ATK_IMPLEMENTOR_IFACE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a implementor_iface = unit
    type 'a class = 'a implementor_iface class
  end
