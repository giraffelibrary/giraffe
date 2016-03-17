structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (load_sym libvte "vte_pty_get_type") (FFI.PolyML.cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (load_sym libvte "vte_pty_new") (VtePtyFlags.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val newForeign_ = call (load_sym libvte "vte_pty_new_foreign") (FFI.Int.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> GObjectObjectClass.PolyML.cPtr)
      val childSetup_ = call (load_sym libvte "vte_pty_child_setup") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val close_ = call (load_sym libvte "vte_pty_close") (GObjectObjectClass.PolyML.cPtr --> FFI.PolyML.cVoid)
      val getFd_ = call (load_sym libvte "vte_pty_get_fd") (GObjectObjectClass.PolyML.cPtr --> FFI.Int.PolyML.cVal)
      val getSize_ =
        call (load_sym libvte "vte_pty_get_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cRef
             &&> FFI.Int.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setSize_ =
        call (load_sym libvte "vte_pty_set_size")
          (
            GObjectObjectClass.PolyML.cPtr
             &&> FFI.Int.PolyML.cVal
             &&> FFI.Int.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> FFI.Bool.PolyML.cVal
          )
      val setTerm_ = call (load_sym libvte "vte_pty_set_term") (GObjectObjectClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> FFI.PolyML.cVoid)
      val setUtf8_ =
        call (load_sym libvte "vte_pty_set_utf8")
          (
            GObjectObjectClass.PolyML.cPtr
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
    fun new flags = (VtePtyFlags.C.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.C.fromPtr true) new_ (flags & [])
    fun newForeign fd = (FFI.Int.C.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.C.fromPtr true) newForeign_ (fd & [])
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
             &&&> GLibErrorRecord.handleError
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
    fun setTerm self emulation = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTerm_ (self & emulation)
    fun setUtf8 self utf8 =
      (
        GObjectObjectClass.C.withPtr
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
      val termProp =
        {
          get = fn x => get "term" stringOpt x,
          set = fn x => set "term" stringOpt x
        }
    end
  end
