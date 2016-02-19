structure VtePty :>
  VTE_PTY
    where type 'a class_t = 'a VtePtyClass.t
    where type pty_flags_t = VtePtyFlags.t =
  struct
    val getType_ = _import "vte_pty_get_type" : unit -> GObjectType.C.val_;
    val new_ = fn x1 & x2 => (_import "vte_pty_new" : VtePtyFlags.C.val_ * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val newForeign_ = fn x1 & x2 => (_import "vte_pty_new_foreign" : FFI.Int32.C.val_ * (unit, unit) GLibErrorRecord.C.r -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;) (x1, x2)
    val childSetup_ = _import "vte_pty_child_setup" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val close_ = _import "vte_pty_close" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> unit;
    val getFd_ = _import "vte_pty_get_fd" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_get_size" :
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.ref_
               * FFI.Int32.C.ref_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Int32.C.val_
               * FFI.Int32.C.val_
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
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
              GObjectObjectClass.C.notnull GObjectObjectClass.C.p
               * FFI.Bool.C.val_
               * (unit, unit) GLibErrorRecord.C.r
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class_t = 'a VtePtyClass.t
    type pty_flags_t = VtePtyFlags.t
    type t = base class_t
    fun asInitable self = (GObjectObjectClass.C.withPtr ---> GioInitableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new flags = (VtePtyFlags.C.withVal &&&> GLibErrorRecord.C.handleError ---> VtePtyClass.C.fromPtr true) new_ (flags & [])
    fun newForeign fd = (FFI.Int32.C.withVal &&&> GLibErrorRecord.C.handleError ---> VtePtyClass.C.fromPtr true) newForeign_ (fd & [])
    fun childSetup self = (GObjectObjectClass.C.withPtr ---> I) childSetup_ self
    fun close self = (GObjectObjectClass.C.withPtr ---> I) close_ self
    fun getFd self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & retVal =
          (
            GObjectObjectClass.C.withPtr
             &&&> FFI.Int32.C.withRefVal
             &&&> FFI.Int32.C.withRefVal
             &&&> GLibErrorRecord.C.handleError
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
        GObjectObjectClass.C.withPtr
         &&&> FFI.Int32.C.withVal
         &&&> FFI.Int32.C.withVal
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
    fun setTerm self emulation = (GObjectObjectClass.C.withPtr &&&> Utf8.C.withOptPtr ---> I) setTerm_ (self & emulation)
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
      val termProp =
        {
          get = fn x => get "term" stringOpt x,
          set = fn x => set "term" stringOpt x
        }
    end
  end
