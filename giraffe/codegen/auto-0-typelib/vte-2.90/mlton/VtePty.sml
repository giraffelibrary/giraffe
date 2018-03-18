structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    val getType_ = _import "vte_pty_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = fn x1 & x2 => (_import "vte_pty_new" : VtePtyFlags.FFI.val_ * (unit, unit) GLibErrorRecord.FFI.r -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;) (x1, x2)
    val newForeign_ = fn x1 & x2 => (_import "vte_pty_new_foreign" : GInt32.FFI.val_ * (unit, unit) GLibErrorRecord.FFI.r -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;) (x1, x2)
    val childSetup_ = _import "vte_pty_child_setup" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> unit;
    val close_ = _import "vte_pty_close" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> unit;
    val getFd_ = _import "vte_pty_get_fd" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> GInt32.FFI.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_get_size" :
              VtePtyClass.FFI.notnull VtePtyClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               * (unit, unit) GLibErrorRecord.FFI.r
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
              VtePtyClass.FFI.notnull VtePtyClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
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
              VtePtyClass.FFI.notnull VtePtyClass.FFI.p
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
              VtePtyClass.FFI.notnull VtePtyClass.FFI.p
               * GBool.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
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
    fun asInitable self = (GObjectObjectClass.FFI.withPtr ---> GioInitableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new flags = (VtePtyFlags.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) new_ (flags & [])
    fun newForeign fd = (GInt32.FFI.withVal &&&> GLibErrorRecord.handleError ---> VtePtyClass.FFI.fromPtr true) newForeign_ (fd & [])
    fun childSetup self = (VtePtyClass.FFI.withPtr ---> I) childSetup_ self
    fun close self = (VtePtyClass.FFI.withPtr ---> I) close_ self
    fun getFd self = (VtePtyClass.FFI.withPtr ---> GInt32.FFI.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & () =
          (
            VtePtyClass.FFI.withPtr
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
        VtePtyClass.FFI.withPtr
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
    fun setTerm self emulation = (VtePtyClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) setTerm_ (self & emulation)
    fun setUtf8 self utf8 =
      (
        VtePtyClass.FFI.withPtr
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
