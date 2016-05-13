structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_pty_get_type") (PolyMLFFI.cVoid --> GObjectType.PolyML.cVal)
      val newForeignSync_ =
        call (load_sym libvte "vte_pty_new_foreign_sync")
          (
            FFI.Int32.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val newSync_ =
        call (load_sym libvte "vte_pty_new_sync")
          (
            VtePtyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val childSetup_ = call (load_sym libvte "vte_pty_child_setup") (VtePtyClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val close_ = call (load_sym libvte "vte_pty_close") (VtePtyClass.PolyML.cPtr --> PolyMLFFI.cVoid)
      val getFd_ = call (load_sym libvte "vte_pty_get_fd") (VtePtyClass.PolyML.cPtr --> FFI.Int32.PolyML.cVal)
      val getSize_ =
        call (load_sym libvte "vte_pty_get_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cRef
             &&> FFI.Int32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setSize_ =
        call (load_sym libvte "vte_pty_set_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> FFI.Int32.PolyML.cVal
             &&> FFI.Int32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setUtf8_ =
        call (load_sym libvte "vte_pty_set_utf8")
          (
            VtePtyClass.PolyML.cPtr
             &&> FFI.Bool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
    end
    type 'a class = 'a VtePtyClass.class
    type pty_flags_t = VtePtyFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForeignSync fd cancellable =
      (
        FFI.Int32.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.C.fromPtr true
      )
        newForeignSync_
        (
          fd
           & cancellable
           & []
        )
    fun newSync flags cancellable =
      (
        VtePtyFlags.C.withVal
         &&&> GioCancellableClass.C.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.C.fromPtr true
      )
        newSync_
        (
          flags
           & cancellable
           & []
        )
    fun childSetup self = (VtePtyClass.C.withPtr ---> I) childSetup_ self
    fun close self = (VtePtyClass.C.withPtr ---> I) close_ self
    fun getFd self = (VtePtyClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & retVal =
          (
            VtePtyClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> FFI.Int32.C.fromVal
                   && FFI.Int32.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSize_
            (
              self
               & FFI.Int32.null
               & FFI.Int32.null
               & []
            )
      in
        if retVal then SOME (rows, columns) else NONE
      end
    fun setSize self rows columns =
      (
        VtePtyClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setSize_
        (
          self
           & rows
           & columns
           & []
        )
    fun setUtf8 self utf8 =
      (
        VtePtyClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.handleError
         ---> FFI.Bool.C.fromVal
      )
        setUtf8_
        (
          self
           & utf8
           & []
        )
    local
      open Property
    in
      val fdProp =
        {
          get = fn x => get "fd" int x,
          set = fn x => set "fd" int x
        }
      val flagsProp =
        {
          get = fn x => get "flags" VtePtyFlags.t x,
          set = fn x => set "flags" VtePtyFlags.t x
        }
    end
  end
