signature ATK_HYPERLINK_IMPL_CLASS =
  sig
    type 'a hyperlink_impl
    include
      CLASS
        where type 'a class = 'a hyperlink_impl GObject.ObjectClass.class
    val t : (base class, 'a class) ValueAccessor.t
    val tOpt : (base class option, 'a class option) ValueAccessor.t
  end
