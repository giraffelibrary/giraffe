structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "g_unix_fd_list_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "g_unix_fd_list_new") (cVoid --> GioUnixFDListClass.PolyML.cPtr)
      val newFromArray_ = call (getSymbol "g_unix_fd_list_new_from_array") (GIntCArrayN.PolyML.cInPtr &&> GInt.PolyML.cVal --> GioUnixFDListClass.PolyML.cPtr)
      val append_ =
        call (getSymbol "g_unix_fd_list_append")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val get_ =
        call (getSymbol "g_unix_fd_list_get")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val getLength_ = call (getSymbol "g_unix_fd_list_get_length") (GioUnixFDListClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val peekFds_ = call (getSymbol "g_unix_fd_list_peek_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCArrayN.PolyML.cOutPtr)
      val stealFds_ = call (getSymbol "g_unix_fd_list_steal_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCArrayN.PolyML.cOutPtr)
    end
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.FFI.fromPtr true) new_ ()
    fun newFromArray fds =
      let
        val nFds = LargeInt.fromInt (GIntCArrayN.length fds)
        val retVal = (GIntCArrayN.FFI.withPtr 0 &&&> GInt.FFI.withVal ---> GioUnixFDListClass.FFI.fromPtr true) newFromArray_ (fds & nFds)
      in
        retVal
      end
    fun append self fd =
      (
        GioUnixFDListClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GioUnixFDListClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GInt.FFI.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.FFI.withPtr false ---> GInt.FFI.fromVal) getLength_ self
    fun peekFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr false &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCArrayN.FFI.fromPtr 0) peekFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length) before GioUnixFDListClass.FFI.touchPtr self
      end
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr false &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCArrayN.FFI.fromPtr ~1) stealFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
  end
