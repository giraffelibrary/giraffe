signature G_I_REPOSITORY_ARG_INFO_CLASS =
  sig
    type 'a arginfo
    type 'a baseinfo_class
    type 'a class = 'a arginfo baseinfo_class
    val toBase : 'a class -> base class
    include RECORD where type t = base class
  end
