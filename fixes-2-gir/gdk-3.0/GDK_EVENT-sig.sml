signature GDK_EVENT =
  sig
    include UNION
    val t : (base union, 'a union) ValueAccessor.t
    val tOpt : (base union option, 'a union option) ValueAccessor.t
  end
