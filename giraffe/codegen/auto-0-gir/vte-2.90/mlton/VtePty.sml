structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    val getType_ = _import "vte_pty_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "vte_pty_new" : VtePtyFlags.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;) (x1, x2)
    val newForeign_ = fn x1 & x2 => (_import "vte_pty_new_foreign" : GInt.FFI.val_ * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> VtePtyClass.FFI.non_opt VtePtyClass.FFI.p;) (x1, x2)
    val childSetup_ = _import "vte_pty_child_setup" : VtePtyClass.FFI.non_opt VtePtyClass.FFI.p -> unit;
    val close_ = _import "vte_pty_close" : VtePtyClass.FFI.non_opt VtePtyClass.FFI.p -> unit;
    val getFd_ = _import "vte_pty_get_fd" : VtePtyClass.FFI.non_opt VtePtyClass.FFI.p -> GInt.FFI.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_get_size" :
              VtePtyClass.FFI.non_opt VtePtyClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              VtePtyClass.FFI.non_opt VtePtyClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
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
              VtePtyClass.FFI.non_opt VtePtyClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
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
              VtePtyClass.FFI.non_opt VtePtyClass.FFI.p
               * GBool.FFI.val_
               * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3
            )
    type 'a class = 'a VtePtyClass.class
    type pty_flags_t = VtePtyFlags.t
    type t = base class
    fun asInitable self = (GObjectObjectClass.FFI.withPtr false ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags = (VtePtyFlags.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) new_ (flags & [])
    fun newForeign fd = (GInt.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) newForeign_ (fd & [])
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
      val termProp =
        {
          name = "term",
          gtype = fn () => C.gtype stringOpt (),
          get = fn x => fn () => C.get stringOpt x,
          set = fn x => C.set stringOpt x,
          init = fn x => C.set stringOpt x
        }
    end
  end
