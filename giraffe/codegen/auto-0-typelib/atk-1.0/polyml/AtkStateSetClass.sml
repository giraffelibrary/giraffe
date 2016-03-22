structure AtkStateSetClass :>
  ATK_STATE_SET_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a state_set = unit
    type 'a class = 'a state_set class
  end
