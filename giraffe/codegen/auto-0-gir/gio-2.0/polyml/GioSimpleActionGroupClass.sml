structure GioSimpleActionGroupClass :>
  GIO_SIMPLE_ACTION_GROUP_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a simple_action_group = unit
    type 'a class = 'a simple_action_group class
  end
