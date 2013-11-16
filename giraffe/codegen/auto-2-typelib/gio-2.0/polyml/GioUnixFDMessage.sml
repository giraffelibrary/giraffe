structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class_t = 'a GioUnixFDMessageClass.t
    where type 'a unixfdlistclass_t = 'a GioUnixFDListClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_message_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_unix_fd_message_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val newWithFdList_ = call (load_sym libgio "g_unix_fd_message_new_with_fd_list") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
      val appendFd_ =
        call (load_sym libgio "g_unix_fd_message_append_fd")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val getFdList_ = call (load_sym libgio "g_unix_fd_message_get_fd_list") (GObjectObjectClass.PolyML.PTR --> GObjectObjectClass.PolyML.PTR)
    end
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
