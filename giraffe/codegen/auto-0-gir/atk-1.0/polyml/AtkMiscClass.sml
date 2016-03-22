structure AtkMiscClass :>
  ATK_MISC_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a misc = unit
    type 'a class = 'a misc class
  end
