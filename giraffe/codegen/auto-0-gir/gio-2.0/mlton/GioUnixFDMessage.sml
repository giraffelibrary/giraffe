structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    structure GIntCVectorNType =
      CValueCVectorNType(
        structure CElemType = GIntType
        structure ElemSequence = CValueVectorSequence(GIntType)
      )
    structure GIntCVectorN = CVectorN(GIntCVectorNType)
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
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFdList_ = _import "g_unix_fd_message_get_fd_list" : GioUnixFDMessageClass.FFI.notnull GioUnixFDMessageClass.FFI.p -> GioUnixFDListClass.FFI.notnull GioUnixFDListClass.FFI.p;
    val stealFds_ = fn x1 & x2 => (_import "g_unix_fd_message_steal_fds" : GioUnixFDMessageClass.FFI.notnull GioUnixFDMessageClass.FFI.p * GInt.FFI.ref_ -> GIntCVectorN.FFI.notnull GIntCVectorN.FFI.out_p;) (x1, x2)
    type 'a class = 'a GioUnixFDMessageClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDMessageClass.FFI.fromPtr true) new_ ()
    fun newWithFdList fdList = (GioUnixFDListClass.FFI.withPtr ---> GioUnixFDMessageClass.FFI.fromPtr true) newWithFdList_ fdList
    fun appendFd self fd =
      (
        GioUnixFDMessageClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        val length & retVal = (GioUnixFDMessageClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCVectorN.FFI.fromPtr 1) stealFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
    local
      open Property
    in
      val fdListProp =
        {
          get = fn x => get "fd-list" GioUnixFDListClass.tOpt x,
          set = fn x => set "fd-list" GioUnixFDListClass.tOpt x
        }
    end
  end
