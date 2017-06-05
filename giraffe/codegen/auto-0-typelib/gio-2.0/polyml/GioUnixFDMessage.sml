structure GioUnixFDMessage :>
  GIO_UNIX_F_D_MESSAGE
    where type 'a class = 'a GioUnixFDMessageClass.class
    where type 'a unix_f_d_list_class = 'a GioUnixFDListClass.class =
  struct
    structure GInt32CVectorNType =
      CValueCVectorNType(
        structure CElemType = GInt32Type
        structure ElemSequence = CValueVectorSequence(GInt32Type)
      )
    structure GInt32CVectorN = CVectorN(GInt32CVectorNType)
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_message_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_message_new") (PolyMLFFI.cVoid --> GioSocketControlMessageClass.PolyML.cPtr)
      val newWithFdList_ = call (load_sym libgio "g_unix_fd_message_new_with_fd_list") (GioUnixFDListClass.PolyML.cPtr --> GioSocketControlMessageClass.PolyML.cPtr)
      val appendFd_ =
        call (load_sym libgio "g_unix_fd_message_append_fd")
          (
            GioUnixFDMessageClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getFdList_ = call (load_sym libgio "g_unix_fd_message_get_fd_list") (GioUnixFDMessageClass.PolyML.cPtr --> GioUnixFDListClass.PolyML.cPtr)
      val stealFds_ = call (load_sym libgio "g_unix_fd_message_steal_fds") (GioUnixFDMessageClass.PolyML.cPtr &&> GInt32.PolyML.cRef --> GInt32CVectorN.PolyML.cOutPtr)
    end
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
          set = fn x => set "fd-list" GioUnixFDListClass.tOpt x
        }
    end
  end
