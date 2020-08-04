structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "vte_pty_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "vte_pty_new") (VtePtyFlags.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> VtePtyClass.PolyML.cPtr)
      val newForeign_ = call (getSymbol "vte_pty_new_foreign") (GInt32.PolyML.cVal &&> GLibErrorRecord.PolyML.cOutOptRef --> VtePtyClass.PolyML.cPtr)
      val childSetup_ = call (getSymbol "vte_pty_child_setup") (VtePtyClass.PolyML.cPtr --> cVoid)
      val close_ = call (getSymbol "vte_pty_close") (VtePtyClass.PolyML.cPtr --> cVoid)
      val getFd_ = call (getSymbol "vte_pty_get_fd") (VtePtyClass.PolyML.cPtr --> GInt32.PolyML.cVal)
      val getSize_ =
        call (getSymbol "vte_pty_get_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> GInt32.PolyML.cRef
             &&> GInt32.PolyML.cRef
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setSize_ =
        call (getSymbol "vte_pty_set_size")
          (
            VtePtyClass.PolyML.cPtr
             &&> GInt32.PolyML.cVal
             &&> GInt32.PolyML.cVal
             &&> GLibErrorRecord.PolyML.cOutOptRef
             --> GBool.PolyML.cVal
          )
      val setTerm_ = call (getSymbol "vte_pty_set_term") (VtePtyClass.PolyML.cPtr &&> Utf8.PolyML.cInOptPtr --> cVoid)
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
    fun new flags = (VtePtyFlags.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) new_ (flags & [])
    fun newForeign fd = (GInt32.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) newForeign_ (fd & [])
    fun childSetup self = (VtePtyClass.FFI.withPtr false ---> I) childSetup_ self
    fun close self = (VtePtyClass.FFI.withPtr false ---> I) close_ self
    fun getFd self = (VtePtyClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            VtePtyClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && ignore
          )
            getSize_
            (
              self
               & GInt32.null
               & GInt32.null
               & []
            )
      in
        (rows, columns)
      end
    fun setSize self (rows, columns) =
      (
        VtePtyClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
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
    fun setTerm self emulation = (VtePtyClass.FFI.withPtr false &&&> Utf8.FFI.withOptPtr 0 ---> I) setTerm_ (self & emulation)
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
      open Property
    in
      val fdProp =
        {
          get = fn x => get "fd" int x,
          new = fn x => new "fd" int x
        }
      val flagsProp =
        {
          get = fn x => get "flags" VtePtyFlags.t x,
          new = fn x => new "flags" VtePtyFlags.t x
        }
      val termProp =
        {
          get = fn x => get "term" stringOpt x,
          set = fn x => set "term" stringOpt x,
          new = fn x => new "term" stringOpt x
        }
    end
  end
