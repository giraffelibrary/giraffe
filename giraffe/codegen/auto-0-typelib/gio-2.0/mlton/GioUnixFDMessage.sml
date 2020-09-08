structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_unix_fd_message_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "g_unix_fd_message_new" : unit -> GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p;
    val newWithFdList_ = _import "g_unix_fd_message_new_with_fd_list" : GioUnixFDListClass.FFI.non_opt GioUnixFDListClass.FFI.p -> GioSocketControlMessageClass.FFI.non_opt GioSocketControlMessageClass.FFI.p;
    val appendFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_message_append_fd" :
              GioUnixFDMessageClass.FFI.non_opt GioUnixFDMessageClass.FFI.p
               * GInt32.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFdList_ = _import "g_unix_fd_message_get_fd_list" : GioUnixFDMessageClass.FFI.non_opt GioUnixFDMessageClass.FFI.p -> GioUnixFDListClass.FFI.non_opt GioUnixFDListClass.FFI.p;
    val stealFds_ = fn x1 & x2 => (_import "g_unix_fd_message_steal_fds" : GioUnixFDMessageClass.FFI.non_opt GioUnixFDMessageClass.FFI.p * GInt32.FFI.ref_ -> GInt32CArrayN.FFI.non_opt GInt32CArrayN.FFI.out_p;) (x1, x2)
    type 'a class = 'a GioUnixFDMessageClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDMessageClass.FFI.fromPtr true) new_ ()
    fun newWithFdList fdList = (GioUnixFDListClass.FFI.withPtr false ---> GioUnixFDMessageClass.FFI.fromPtr true) newWithFdList_ fdList
    fun appendFd self fd =
      (
        GioUnixFDMessageClass.FFI.withPtr false
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
    fun getFdList self = (GioUnixFDMessageClass.FFI.withPtr false ---> GioUnixFDListClass.FFI.fromPtr false) getFdList_ self
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDMessageClass.FFI.withPtr false &&&> GInt32.FFI.withRefVal ---> GInt32.FFI.fromVal && GInt32CArrayN.FFI.fromPtr ~1) stealFds_ (self & GInt32.null)
      in
        retVal (LargeInt.toInt length)
      end
    local
      open ValueAccessor
    in
      val fdListProp =
        {
          name = "fd-list",
          gtype = fn () => C.gtype GioUnixFDListClass.tOpt (),
          get = fn x => fn () => C.get GioUnixFDListClass.tOpt x,
          set = ignore,
          init = fn x => C.set GioUnixFDListClass.tOpt x
        }
    end
  end
