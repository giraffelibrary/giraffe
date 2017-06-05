structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32Type
        structure ElemSequence = CValueVectorSequence(GInt32Type)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    val getType_ = _import "g_unix_fd_list_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_fd_list_new" : unit -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
    val newFromArray_ =
      fn
        (x1, x2) & x3 =>
          (
            _import "mlton_g_unix_fd_list_new_from_array" :
              GInt32CVectorN.MLton.p1
               * GInt32CVectorN.FFI.notnull GInt32CVectorN.MLton.p2
               * GInt32.FFI.val_
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
               * GInt32.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt32.FFI.val_;
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
               * GInt32.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GInt32.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getLength_ = _import "g_unix_fd_list_get_length" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p -> GInt32.FFI.val_;
    val peekFds_ = fn x1 & x2 => (_import "g_unix_fd_list_peek_fds" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p * GInt32.FFI.ref_ -> GInt32CVectorN.FFI.notnull GInt32CVectorN.FFI.out_p;) (x1, x2)
    val stealFds_ = fn x1 & x2 => (_import "g_unix_fd_list_steal_fds" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p * GInt32.FFI.ref_ -> GInt32CVectorN.FFI.notnull GInt32CVectorN.FFI.out_p;) (x1, x2)
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.FFI.fromPtr true) new_ ()
    fun newFromArray fds =
      let
        val nFds = LargeInt.fromInt (GInt32CVectorN.length fds)
        val retVal = (GInt32CVectorN.FFI.withPtr &&&> GInt32.FFI.withVal ---> GioUnixFDListClass.FFI.fromPtr true) newFromArray_ (fds & nFds)
      in
        retVal
      end
    fun append self fd =
      (
        GioUnixFDListClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
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
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt32.FFI.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.FFI.withPtr ---> GInt32.FFI.fromVal) getLength_ self
    fun peekFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 0) peekFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 1) stealFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
  end
