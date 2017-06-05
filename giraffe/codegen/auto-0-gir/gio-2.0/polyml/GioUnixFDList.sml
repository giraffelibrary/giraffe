structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
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
      val getType_ = call (load_sym libgio "g_unix_fd_list_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_list_new") (PolyMLFFI.cVoid --> GioUnixFDListClass.PolyML.cPtr)
      val newFromArray_ = call (load_sym libgio "g_unix_fd_list_new_from_array") (GIntCVectorN.PolyML.cInPtr &&> GInt.PolyML.cVal --> GioUnixFDListClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgio "g_unix_fd_list_append")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val get_ =
        call (load_sym libgio "g_unix_fd_list_get")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GInt.PolyML.cVal
          )
      val getLength_ = call (load_sym libgio "g_unix_fd_list_get_length") (GioUnixFDListClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val peekFds_ = call (load_sym libgio "g_unix_fd_list_peek_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCVectorN.PolyML.cOutPtr)
      val stealFds_ = call (load_sym libgio "g_unix_fd_list_steal_fds") (GioUnixFDListClass.PolyML.cPtr &&> GInt.PolyML.cRef --> GIntCVectorN.PolyML.cOutPtr)
    end
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.FFI.fromPtr true) new_ ()
    fun newFromArray fds =
      let
        val nFds = LargeInt.fromInt (GIntCVectorN.length fds)
        val retVal = (GIntCVectorN.FFI.withPtr &&&> GInt.FFI.withVal ---> GioUnixFDListClass.FFI.fromPtr true) newFromArray_ (fds & nFds)
      in
        retVal
      end
    fun append self fd =
      (
        GioUnixFDListClass.FFI.withPtr
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
        GioUnixFDListClass.FFI.withPtr
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
    fun getLength self = (GioUnixFDListClass.FFI.withPtr ---> GInt.FFI.fromVal) getLength_ self
    fun peekFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCVectorN.FFI.fromPtr 0) peekFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
    fun stealFds self =
      let
        val length & retVal = (GioUnixFDListClass.FFI.withPtr &&&> GInt.FFI.withRefVal ---> GInt.FFI.fromVal && GIntCVectorN.FFI.fromPtr 1) stealFds_ (self & GInt.null)
      in
        retVal (LargeInt.toInt length)
      end
  end
