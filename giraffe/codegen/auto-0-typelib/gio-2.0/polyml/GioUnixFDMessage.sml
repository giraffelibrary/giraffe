structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_message_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_message_new") (FFI.PolyML.cVoid --> GioSocketControlMessageClass.PolyML.cPtr)
      val newWithFdList_ = call (load_sym libgio "g_unix_fd_message_new_with_fd_list") (GioUnixFDListClass.PolyML.cPtr --> GioSocketControlMessageClass.PolyML.cPtr)
      val appendFd_ =
        call (load_sym libgio "g_unix_fd_message_append_fd")
          (
            GioUnixFDMessageClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val getFdList_ = call (load_sym libgio "g_unix_fd_message_get_fd_list") (GioUnixFDMessageClass.PolyML.cPtr --> GioUnixFDListClass.PolyML.cPtr)
    end
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
