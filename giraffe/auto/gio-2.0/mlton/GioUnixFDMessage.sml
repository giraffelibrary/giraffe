structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class_t = 'a GioUnixFDMessageClass.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t =
  struct
    val getType_ = _import "g_unix_fd_message_get_type" : unit -> GObjectType.C.val_;
    val new_ = _import "g_unix_fd_message_new" : unit -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val newWithFdList_ = _import "g_unix_fd_message_new_with_fd_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    val appendFd_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "g_unix_fd_message_append_fd" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    val getFdList_ = _import "g_unix_fd_message_get_fd_list" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
    type 'a class_t = 'a GioUnixFDMessageClass.t
    type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDMessageClass.C.fromPtr true) new_ ()
    fun newWithFdList fdList = (GObjectObjectClass.C.withPtr ---> GioUnixFDMessageClass.C.fromPtr true) newWithFdList_ fdList
    fun appendFd self fd =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.C.handleError
         ---> FFI.Bool.C.fromVal
      )
        appendFd_
        (
          self
           & fd
           & []
        )
    fun getFdList self = (GObjectObjectClass.C.withPtr ---> GioUnixFDListClass.C.fromPtr false) getFdList_ self
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
