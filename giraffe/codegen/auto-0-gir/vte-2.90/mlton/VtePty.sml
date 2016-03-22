structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    val getType_ = _import "vte_pty_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "vte_pty_new" : VtePtyFlags.C.val_ * (unit, unit) GLibErrorRecord.C.r -> VtePtyClass.C.notnull VtePtyClass.C.p;) (x1, x2)
    val newForeign_ = fn x1 & x2 => (_import "vte_pty_new_foreign" : FFI.Int.C.val_ * (unit, unit) GLibErrorRecord.C.r -> VtePtyClass.C.notnull VtePtyClass.C.p;) (x1, x2)
    val childSetup_ = _import "vte_pty_child_setup" : VtePtyClass.C.notnull VtePtyClass.C.p -> unit;
    val close_ = _import "vte_pty_close" : VtePtyClass.C.notnull VtePtyClass.C.p -> unit;
    val getFd_ = _import "vte_pty_get_fd" : VtePtyClass.C.notnull VtePtyClass.C.p -> FFI.Int.C.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_get_size" :
              VtePtyClass.C.notnull VtePtyClass.C.p
               * FFI.Int.C.ref_
               * FFI.Int.C.ref_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_set_size" :
              VtePtyClass.C.notnull VtePtyClass.C.p
               * FFI.Int.C.val_
               * FFI.Int.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val setTerm_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_vte_pty_set_term" :
              VtePtyClass.C.notnull VtePtyClass.C.p
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUtf8_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_pty_set_utf8" :
              VtePtyClass.C.notnull VtePtyClass.C.p
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a VtePtyClass.class
    type pty_flags_t = VtePtyFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags = (VtePtyFlags.C.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.C.fromPtr true) new_ (flags & [])
    fun newForeign fd = (FFI.Int.C.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.C.fromPtr true) newForeign_ (fd & [])
    fun childSetup self = (VtePtyClass.C.withPtr ---> I) childSetup_ self
    fun close self = (VtePtyClass.C.withPtr ---> I) close_ self
    fun getFd self = (VtePtyClass.C.withPtr ---> FFI.Int.C.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & retVal =
          (
            VtePtyClass.C.withPtr
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
        VtePtyClass.C.withPtr
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
    fun setTerm self emulation = (VtePtyClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTerm_ (self & emulation)
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
      val termProp =
        {
          get = fn x => get "term" stringOpt x,
          set = fn x => set "term" stringOpt x
        }
    end
  end
