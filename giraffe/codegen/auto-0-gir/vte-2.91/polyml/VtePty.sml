structure VtePty :>
  VTE_PTY
    where type 'a class_t = 'a VtePtyClass.t
    where type pty_flags_t = VtePtyFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_pty_get_type") (FFI.PolyML.VOID --> GObjectType.PolyML.VAL)
      val newForeignSync_ =
        call (load_sym libvte "vte_pty_new_foreign_sync")
          (
            FFI.Int.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val newSync_ =
        call (load_sym libvte "vte_pty_new_sync")
          (
            VtePtyFlags.PolyML.VAL
             &&> GObjectObjectClass.PolyML.OPTPTR
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> GObjectObjectClass.PolyML.PTR
          )
      val childSetup_ = call (load_sym libvte "vte_pty_child_setup") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val close_ = call (load_sym libvte "vte_pty_close") (GObjectObjectClass.PolyML.PTR --> FFI.PolyML.VOID)
      val getFd_ = call (load_sym libvte "vte_pty_get_fd") (GObjectObjectClass.PolyML.PTR --> FFI.Int.PolyML.VAL)
      val getSize_ =
        call (load_sym libvte "vte_pty_get_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.REF
             &&> FFI.Int.PolyML.REF
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setSize_ =
        call (load_sym libvte "vte_pty_set_size")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Int.PolyML.VAL
             &&> FFI.Int.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
      val setUtf8_ =
        call (load_sym libvte "vte_pty_set_utf8")
          (
            GObjectObjectClass.PolyML.PTR
             &&> FFI.Bool.PolyML.VAL
             &&> GLibErrorRecord.PolyML.OUTOPTREF
             --> FFI.Bool.PolyML.VAL
          )
    end
    type 'a class_t = 'a VtePtyClass.t
    type pty_flags_t = VtePtyFlags.t
    type t = base class_t
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun newForeignSync fd cancellable =
      (
        FFI.Int.C.withVal
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
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
         &&&> GObjectObjectClass.C.withOptPtr
         &&&> GLibErrorRecord.C.handleError
         ---> VtePtyClass.C.fromPtr true
      )
        newSync_
        (
          flags
           & cancellable
           & []
        )
    fun childSetup self = (GObjectObjectClass.C.withPtr ---> I) childSetup_ self
    fun close self = (GObjectObjectClass.C.withPtr ---> I) close_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int.C.withRefVal
             &&&> FFI.Int.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
             ---> FFI.Int.C.fromVal
                   && FFI.Int.C.fromVal
                   && FFI.Bool.C.fromVal
          )
            getSize_
            (
              self
               & FFI.Int.null
               & FFI.Int.null
               & []
            )
      in
        if retVal then SOME (rows, columns) else NONE
      end
    fun setSize self rows columns =
      (
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> FFI.Int.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Bool.C.withVal
         &&&> GLibErrorRecord.C.handleError
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
