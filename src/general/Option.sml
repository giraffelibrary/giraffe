structure Option : OPTION =
  struct
    open Option

    fun fold f (opt, a) =
      case opt of
        SOME x => f (x, a)
      | NONE   => a
  end
