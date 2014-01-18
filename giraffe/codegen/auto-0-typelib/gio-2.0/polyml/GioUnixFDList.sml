structure GioUnixFDList :>
  GIO_UNIX_F_D_LIST
    where type 'a class_t = 'a GioUnixFDListClass.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libgio "g_unix_fd_list_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val new_ = call (load_sym libgio "g_unix_fd_list_new") (FFI.PolyML.VOID --> GObjectObjectClass.PolyML.PTR)
      val append_ =
        call (load_sym libgio "g_unix_fd_list_append")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int32.PolyML.VAL
          )
      val get_ =
        call (load_sym libgio "g_unix_fd_list_get")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int32.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Int32.PolyML.VAL
          )
      val getLength_ = call (load_sym libgio "g_unix_fd_list_get_length") (GObjectObjectClass.PolyML.PTR --> FFI.Int32.PolyML.VAL)
    end
    type 'a class_t = 'a GioUnixFDListClass.t
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new () = (I ---> GioUnixFDListClass.C.fromPtr true) new_ ()
    fun append self fd =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GLibErrorRecord.C.handleError
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