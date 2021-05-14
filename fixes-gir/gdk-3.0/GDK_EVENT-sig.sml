signature GDK_EVENT =
  sig
    include UNION
    val t : base union ValueAccessor.t
    val tOpt : base union option ValueAccessor.t
  end
