structure AtkStreamableContentClass :>
  ATK_STREAMABLE_CONTENT_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a streamable_content = unit
    type 'a class = 'a streamable_content class
  end
