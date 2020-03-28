structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_unix_fd_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_fd_list_new" : unit -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
    val newFromArray_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_unix_fd_list_new_from_array" :
              GIntCArrayN.MLton.p1
               * GIntCArrayN.FFI.notnull GIntCArrayN.MLton.p2
               * GInt.FFI.val_
               -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val append_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_list_append" :
              GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
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
              GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getLength_ = _import "g_unix_fd_list_get_length" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p -> GInt.FFI.val_;
    val peekFds_ = fn x1 & x2 => (_import "g_unix_fd_list_peek_fds" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p * GInt.FFI.ref_ -> GIntCArrayN.FFI.notnull GIntCArrayN.FFI.out_p;) (x1, x2)
    val stealFds_ = fn x1 & x2 => (_import "g_unix_fd_list_steal_fds" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p * GInt.FFI.ref_ -> GIntCArrayN.FFI.notnull GIntCArrayN.FFI.out_p;) (x1, x2)
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.FFI.fromPtr true) new_ ()
    fun newFromArray fds =
      let
        val nFds = LargeInt.fromInt (GIntCArrayN.length fds)
        val retVal = (GIntCArrayN.FFI.withPtr &&&> GInt.FFI.withVal ---> GioUnixFDListClass.FFI.fromPtr true) newFromArray_ (fds & nFds)
      in
        retVal
      end
    fun append self fd =
      (
        GioUnixFDListClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GioUnixFDListClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.FFI.withPtr ---> GInt.FFI.fromVal) getLength_ self
    fun peekFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCArrayN.FFI.fromPtr 0) peekFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCArrayN.FFI.fromPtr 1) stealFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
  end
