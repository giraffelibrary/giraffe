structure AtkTableClass :>
  ATK_TABLE_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a table = unit
    type 'a class = 'a table class
  end
