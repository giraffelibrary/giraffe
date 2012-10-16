structure AtkHyperlinkImplClass :>
  ATK_HYPERLINK_IMPL_CLASS
    where type C.notnull = GObjectObjectClass.C.notnull
    where type 'a C.p = 'a GObjectObjectClass.C.p =
  struct
    type 'a hyperlinkimpl = unit
    type 'a t = 'a hyperlinkimpl GObjectObjectClass.t
    fun toBase obj = obj
    val t = GObjectObjectClass.t
    val tOpt = GObjectObjectClass.tOpt
    structure C = GObjectObjectClass.C
  end
