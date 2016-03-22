structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    val getType_ = _import "g_unix_fd_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_fd_message_new" : unit -> GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p;
    val newWithFdList_ = _import "g_unix_fd_message_new_with_fd_list" : GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p -> GioSocketControlMessageClass.C.notnull GioSocketControlMessageClass.C.p;
    val appendFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_message_append_fd" :
              GioUnixFDMessageClass.C.notnull GioUnixFDMessageClass.C.p
               * FFI.Int32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFdList_ = _import "g_unix_fd_message_get_fd_list" : GioUnixFDMessageClass.C.notnull GioUnixFDMessageClass.C.p -> GioUnixFDListClass.C.notnull GioUnixFDListClass.C.p;
    type 'a class = 'a GioUnixFDMessageClass.class
    type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDMessageClass.C.fromPtr true) new_ ()
    fun newWithFdList fdList = (GioUnixFDListClass.C.withPtr ---> GioUnixFDMessageClass.C.fromPtr true) newWithFdList_ fdList
    fun appendFd self fd =
      (
        GioUnixFDMessageClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        appendFd_
        (
          self
           & fd
           & []
        )
    fun getFdList self = (GioUnixFDMessageClass.C.withPtr ---> GioUnixFDListClass.C.fromPtr false) getFdList_ self
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
