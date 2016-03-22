structure AtkUtilClass :>
  ATK_UTIL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a util = unit
    type 'a class = 'a util class
  end
