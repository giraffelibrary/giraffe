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
       -> bool
    val getFdList : 'a class -> base unix_f_d_list_class
    val fdListProp : ('a class, base unix_f_d_list_class option, 'b unix_f_d_list_class option) Property.readwrite
  end
