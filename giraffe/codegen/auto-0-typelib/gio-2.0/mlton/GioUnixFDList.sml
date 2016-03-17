structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_unix_fd_list_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_fd_list_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_list_append" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val get_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_list_get" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int32.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getLength_ = _import "g_unix_fd_list_get_length" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.C.fromPtr true) new_ ()
    fun append self fd =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLength_ self
  end
