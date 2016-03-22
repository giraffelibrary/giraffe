structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_unix_fd_list_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_fd_list_new" : unit -> GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p;
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_list_append" :
              GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p
               * FFI.Int.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int.C.val_;
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
              GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p
               * FFI.Int.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Int.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getLength_ = _import "g_unix_fd_list_get_length" : GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p -> FFI.Int.C.val_;
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.C.fromPtr true) new_ ()
    fun append self fd =
      (
        GioUnixFDListClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int.C.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GioUnixFDListClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int.C.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.C.withPtr ---> FFI.Int.C.fromVal) getLength_ self
  end
