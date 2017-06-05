signature GDK_EVENT =
  sig
    include UNION
    val t : (base union, 'a union) GObjectValue.accessor
    val tOpt : (base union option, 'a union option) GObjectValue.accessor
  end
