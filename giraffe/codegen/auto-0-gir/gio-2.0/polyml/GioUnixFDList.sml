structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_list_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_list_new") (FFI.PolyML.cVoid --> GioUnixFDListClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgio "g_unix_fd_list_append")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int.PolyML.cVal
          )
      val get_ =
        call (load_sym libgio "g_unix_fd_list_get")
          (
            GioUnixFDListClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int.PolyML.cVal
          )
      val getLength_ = call (load_sym libgio "g_unix_fd_list_get_length") (GioUnixFDListClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
    end
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.C.fromPtr true) new_ ()
    fun append self fd =
      (
        GioUnixFDListClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int.C.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GioUnixFDListClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int.C.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GioUnixFDListClass.C.withPtr ---> FFI.Int.C.fromVal) getLength_ self
  end
