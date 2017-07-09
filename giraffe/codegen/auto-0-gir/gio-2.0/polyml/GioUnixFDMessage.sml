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
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_fd_message_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_fd_message_new") (cVoid --> GioSocketControlMessageClass.PolyML.cPtr)
      val newWithFdList_ = call (getSymbol "g_unix_fd_message_new_with_fd_list") (GioUnixFDListClass.PolyML.cPtr --> GioSocketControlMessageClass.PolyML.cPtr)
      val appendFd_ =
        call (getSymbol "g_unix_fd_message_append_fd")
          (
            GioUnixFDMessageClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val getFdList_ = call (getSymbol "g_unix_fd_message_get_fd_list") (GioUnixFDMessageClass.PolyML.cPtr --> GioUnixFDListClass.PolyML.cPtr)
      val stealFds_ = call (getSymbol "g_unix_fd_message_steal_fds") (GioUnixFDMessageClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCVectorN.PolyML.cOutPtr)
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
