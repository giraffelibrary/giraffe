structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32.C.ValueType
        structure ElemSequence = CValueVectorSequence(GInt32.C.ValueType)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    val getType_ = _import "g_unix_fd_message_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_fd_message_new" : unit -> GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p;
    val newWithFdList_ = _import "g_unix_fd_message_new_with_fd_list" : GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p -> GioSocketControlMessageClass.FFI.notnull GioSocketControlMessageClass.FFI.p;
    val appendFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_message_append_fd" :
              GioUnixFDMessageClass.FFI.notnull GioUnixFDMessageClass.FFI.p
               * GInt32.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFdList_ = _import "g_unix_fd_message_get_fd_list" : GioUnixFDMessageClass.FFI.notnull GioUnixFDMessageClass.FFI.p -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
    val stealFds_ = fn x1 & x2 => (_import "g_unix_fd_message_steal_fds" : GioUnixFDMessageClass.FFI.notnull GioUnixFDMessageClass.FFI.p * GInt32.FFI.ref_ -> GInt32CVectorN.FFI.notnull GInt32CVectorN.FFI.out_p;) (x1, x2)
    type 'a class = 'a GioUnixFDMessageClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDMessageClass.FFI.fromPtr true) new_ ()
    fun newWithFdList fdList = (GioUnixFDListClass.FFI.withPtr ---> GioUnixFDMessageClass.FFI.fromPtr true) newWithFdList_ fdList
    fun appendFd self fd =
      (
        GioUnixFDMessageClass.FFI.withPtr
         &&&> GInt32.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        appendFd_
        (
          self
           & fd
           & []
        )
    fun getFdList self = (GioUnixFDMessageClass.FFI.withPtr ---> GioUnixFDListClass.FFI.fromPtr false) getFdList_ self
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDMessageClass.FFI.withPtr &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CVectorN.FFI.fromPtr 1) stealFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    local
      open Property
    in
      val fdListProp =
        {
          get = fn x => get "fd-list" GioUnixFDListClass.tOpt x,
          new = fn x => new "fd-list" GioUnixFDListClass.tOpt x
        }
    end
  end
