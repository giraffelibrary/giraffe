structure VtePty :>
  VTE_PTY
    where type 'a class = 'a VtePtyClass.class
    where type pty_flags_t = VtePtyFlags.t =
  struct
    val getType_ = _import "vte_pty_get_type" : unit -> GObjectType.FFI.val_;
    val newForeignSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_pty_new_foreign_sync" :
              GInt.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val newSync_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "vte_pty_new_sync" :
              VtePtyFlags.FFI.val_
               * unit GioCancellableClass.FFI.p
               * (unit, unit) GLibErrorRecord.FFI.r
               -> VtePtyClass.FFI.notnull VtePtyClass.FFI.p;
          )
            (
              x1,
              x2,
              x3
            )
    val childSetup_ = _import "vte_pty_child_setup" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> unit;
    val close_ = _import "vte_pty_close" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> unit;
    val getFd_ = _import "vte_pty_get_fd" : VtePtyClass.FFI.notnull VtePtyClass.FFI.p -> GInt.FFI.val_;
    val getSize_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "vte_pty_get_size" :
              VtePtyClass.FFI.notnull VtePtyClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
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
               * GInt.FFI.val_
               * GInt.FFI.val_
               * (unit, unit) GLibErrorRecord.FFI.r
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
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
    fun newForeignSync (fd, cancellable) =
      (
        GInt.FFI.withVal
         &&&> GioCancellableClass.FFI.withOptPtr
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
         &&&> GioCancellableClass.FFI.withOptPtr
         &&&> GLibErrorRecord.handleError
         ---> VtePtyClass.FFI.fromPtr true
      )
        newSync_
        (
          flags
           & cancellable
           & []
        )
    fun childSetup self = (VtePtyClass.FFI.withPtr ---> I) childSetup_ self
    fun close self = (VtePtyClass.FFI.withPtr ---> I) close_ self
    fun getFd self = (VtePtyClass.FFI.withPtr ---> GInt.FFI.fromVal) getFd_ self
    fun getSize self =
      let
        val rows
         & columns
         & retVal =
          (
            VtePtyClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             &&&> GLibErrorRecord.handleError
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && GBool.FFI.fromVal
          )
            getSize_
            (
              self
               & GInt.null
               & GInt.null
               & []
            )
      in
        if retVal then SOME (rows, columns) else NONE
      end
    fun setSize self (rows, columns) =
      (
        VtePtyClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
        VtePtyClass.FFI.withPtr
         &&&> GBool.FFI.withVal
         &&&> GLibErrorRecord.handleError
         ---> GBool.FFI.fromVal
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
