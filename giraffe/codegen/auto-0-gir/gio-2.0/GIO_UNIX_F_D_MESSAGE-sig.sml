signature GIO_UNIX_F_D_MESSAGE =
  sig
    type 'a class
    type 'a unix_f_d_list_class
    type t = base class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val newWithFdList : 'a unix_f_d_list_class -> base class
    val appendFd :
      'a class
       -> LargeInt.int
       -> unit
    val getFdList : 'a class -> base unix_f_d_list_class
    val stealFds : 'a class -> GIntCArrayN.t
    val fdListProp : ('a class, unit -> base unix_f_d_list_class option, unit, 'b unix_f_d_list_class option -> unit) Property.t
  end
