structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class = 'a GioUnixFDListClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_list_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libgio "g_unix_fd_list_new") (FFI.PolyML.cVoid --> GObjectObjectClass.PolyML.cPtr)
      val append_ =
        call (load_sym libgio "g_unix_fd_list_append")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int32.PolyML.cVal
          )
      val get_ =
        call (load_sym libgio "g_unix_fd_list_get")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Int32.PolyML.cVal
          )
      val getLength_ = call (load_sym libgio "g_unix_fd_list_get_length") (GObjectObjectClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
    end
    type 'a class = 'a GioUnixFDListClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.C.fromPtr true) new_ ()
    fun append self fd =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        append_
        (
          self
           & fd
           & []
        )
    fun get self index =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Int32.C.fromVal
      )
        get_
        (
          self
           & index
           & []
        )
    fun getLength self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getLength_ self
  end
