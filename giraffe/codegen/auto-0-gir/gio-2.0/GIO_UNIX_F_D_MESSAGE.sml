signature GIO_UNIX_F_D_MESSAGE =
  sig
    type 'a class_t
    type 'a unix_f_d_list_class_t
    type t = base class_t
    val getType : unit -> GObject.Type.t
    val new : unit -> base class_t
    val newWithFdList : 'a unix_f_d_list_class_t -> base class_t
    val appendFd :
      'a class_t
       -> LargeInt.int
       -> bool
    val getFdList : 'a class_t -> base unix_f_d_list_class_t
    val fdListProp : ('a class_t, base unix_f_d_list_class_t option, 'b unix_f_d_list_class_t option) Property.readwrite
  end
