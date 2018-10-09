signature GIO_UNIX_MOUNT_POINT =
  sig
    type t
    type 'a icon_class
    val compare :
      t
       -> t
       -> LargeInt.int
    val getDevicePath : t -> string
    val getFsType : t -> string
    val getMountPath : t -> string
    val getOptions : t -> string
    val guessCanEject : t -> bool
    val guessIcon : t -> base icon_class
    val guessName : t -> string
    val guessSymbolicIcon : t -> base icon_class
    val isLoopback : t -> bool
    val isReadonly : t -> bool
    val isUserMountable : t -> bool
  end
