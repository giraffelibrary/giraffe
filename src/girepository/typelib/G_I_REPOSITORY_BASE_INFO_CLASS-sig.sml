signature G_I_REPOSITORY_BASE_INFO_CLASS =
  sig
    type 'a class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
