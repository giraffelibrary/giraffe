structure AtkHyperlinkClass :>
  ATK_HYPERLINK_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    open GObjectObjectClass
    type 'a hyperlink = unit
    type 'a class = 'a hyperlink class
  end
