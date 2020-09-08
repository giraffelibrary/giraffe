structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_pty_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val newForeignSync_ =
        call (getSymbol "vte_pty_new_foreign_sync")
          (
            GInt.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val newSync_ =
        call (getSymbol "vte_pty_new_sync")
          (
            VtePtyFlags.PolyML.cVal
             &&> GioCancellableClass.PolyML.cOptPtr
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> VtePtyClass.PolyML.cPtr
          )
      val childSetup_ = call (getSymbol "vte_pty_child_setup") (VtePtyClass.PolyML.cPtr --> cVoid)
      val close_ = call (getSymbol "vte_pty_close") (VtePtyClass.PolyML.cPtr --> cVoid)
      val getFd_ = call (getSymbol "vte_pty_get_fd") (VtePtyClass.PolyML.cPtr --> GInt.PolyML.cVal)
      val getSize_ =
        call (getSymbol "vte_pty_get_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setSize_ =
        call (getSymbol "vte_pty_set_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setUtf8_ =
        call (getSymbol "vte_pty_set_utf8")
          (
            VtePtyClass.PolyML.cPtr
             &&> GBool.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
    end
    type 'a class = 'a VtePtyClass.class
    type pty_flags_t = VtePtyFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun newForeignSync (fd, cancellable) =
      (
        GInt.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
      )
        newForeignSync_
        (
          fd
           & cancellable
           & []
        )
    fun newSync (flags, cancellable) =
      (
        VtePtyFlags.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr false
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
      )
        newSync_
        (
          flags
           & cancellable
           & []
        )
    fun childSetup self = (VtePtyClass.FFI.withPtr false ---> I) childSetup_ self
    fun close self = (VtePtyClass.FFI.withPtr false ---> I) close_ self
    fun getFd self = (VtePtyClass.FFI.withPtr false ---> GInt.FFI.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            VtePtyClass.FFI.withPtr false
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && ignore
          )
            getSize_
            (
              self
               & GInt.null
               & GInt.null
               & []
            )
      in
        (rows, columns)
      end
    fun setSize self (rows, columns) =
      (
        VtePtyClass.FFI.withPtr false
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
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
        VtePtyClass.FFI.withPtr false
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> ignore
      )
        setUtf8_
        (
          self
           & utf8
           & []
        )
    local
      open ValueAccessor
    in
      val fdProp =
        {
          name = "fd",
          gtype = fn () => C.gtype int (),
          get = fn x => fn () => C.get int x,
          set = ignore,
          init = fn x => C.set int x
        }
      val flagsProp =
        {
          name = "flags",
          gtype = fn () => C.gtype VtePtyFlags.t (),
          get = fn x => fn () => C.get VtePtyFlags.t x,
          set = ignore,
          init = fn x => C.set VtePtyFlags.t x
        }
    end
  end
