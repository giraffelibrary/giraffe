structure AtkHyperlinkImplClass :>
  ATK_HYPERLINK_IMPL_CLASS
    where type C.opt = GObjectObjectClass.C.opt
    where type C.non_opt = GObjectObjectClass.C.non_opt
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a hyperlink_impl = unit
    type 'a class = 'a hyperlink_impl class
  end
