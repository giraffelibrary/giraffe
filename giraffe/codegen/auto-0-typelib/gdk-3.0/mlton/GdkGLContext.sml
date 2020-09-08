structure GdkGLContext :>
  GDK_G_L_CONTEXT
    where type 'a class = 'a GdkGLContextClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type 'a window_class = 'a GdkWindowClass.class =
  struct
    val getType_ = _import "gdk_gl_context_get_type" : unit -> GObjectType.FFI.val_;
    val clearCurrent_ = _import "gdk_gl_context_clear_current" : unit -> unit;
    val getCurrent_ = _import "gdk_gl_context_get_current" : unit -> GdkGLContextClass.FFI.opt GdkGLContextClass.FFI.p;
    val getDebugEnabled_ = _import "gdk_gl_context_get_debug_enabled" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getDisplay_ = _import "gdk_gl_context_get_display" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GdkDisplayClass.FFI.opt GdkDisplayClass.FFI.p;
    val getForwardCompatible_ = _import "gdk_gl_context_get_forward_compatible" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_get_required_version" :
              GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSharedContext_ = _import "gdk_gl_context_get_shared_context" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GdkGLContextClass.FFI.opt GdkGLContextClass.FFI.p;
    val getUseEs_ = _import "gdk_gl_context_get_use_es" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_get_version" :
              GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p
               * GInt32.FFI.ref_
               * GInt32.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gdk_gl_context_get_window" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GdkWindowClass.FFI.opt GdkWindowClass.FFI.p;
    val isLegacy_ = _import "gdk_gl_context_is_legacy" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val makeCurrent_ = _import "gdk_gl_context_make_current" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p -> unit;
    val realize_ = fn x1 & x2 => (_import "gdk_gl_context_realize" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p * (GLibErrorRecord.FFI.opt, GLibErrorRecord.FFI.opt) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val setDebugEnabled_ = fn x1 & x2 => (_import "gdk_gl_context_set_debug_enabled" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setForwardCompatible_ = fn x1 & x2 => (_import "gdk_gl_context_set_forward_compatible" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_set_required_version" :
              GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseEs_ = fn x1 & x2 => (_import "gdk_gl_context_set_use_es" : GdkGLContextClass.FFI.non_opt GdkGLContextClass.FFI.p * GInt32.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkGLContextClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCurrent () = (I ---> I) clearCurrent_ ()
    fun getCurrent () = (I ---> GdkGLContextClass.FFI.fromOptPtr false) getCurrent_ ()
    fun getDebugEnabled self = (GdkGLContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) getDebugEnabled_ self
    fun getDisplay self = (GdkGLContextClass.FFI.withPtr false ---> GdkDisplayClass.FFI.fromOptPtr false) getDisplay_ self
    fun getForwardCompatible self = (GdkGLContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) getForwardCompatible_ self
    fun getRequiredVersion self =
      let
        val major
         & minor
         & () =
          (
            GdkGLContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getRequiredVersion_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (major, minor)
      end
    fun getSharedContext self = (GdkGLContextClass.FFI.withPtr false ---> GdkGLContextClass.FFI.fromOptPtr false) getSharedContext_ self
    fun getUseEs self = (GdkGLContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) getUseEs_ self
    fun getVersion self =
      let
        val major
         & minor
         & () =
          (
            GdkGLContextClass.FFI.withPtr false
             &&&> GInt32.FFI.withRefVal
             &&&> GInt32.FFI.withRefVal
             ---> GInt32.FFI.fromVal
                   && GInt32.FFI.fromVal
                   && I
          )
            getVersion_
            (
              self
               & GInt32.null
               & GInt32.null
            )
      in
        (major, minor)
      end
    fun getWindow self = (GdkGLContextClass.FFI.withPtr false ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ self
    fun isLegacy self = (GdkGLContextClass.FFI.withPtr false ---> GBool.FFI.fromVal) isLegacy_ self
    fun makeCurrent self = (GdkGLContextClass.FFI.withPtr false ---> I) makeCurrent_ self
    fun realize self = (GdkGLContextClass.FFI.withPtr false &&&> GLibErrorRecord.handleError ---> ignore) realize_ (self & [])
    fun setDebugEnabled self enabled = (GdkGLContextClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setDebugEnabled_ (self & enabled)
    fun setForwardCompatible self compatible = (GdkGLContextClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setForwardCompatible_ (self & compatible)
    fun setRequiredVersion self (major, minor) =
      (
        GdkGLContextClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        setRequiredVersion_
        (
          self
           & major
           & minor
        )
    fun setUseEs self useEs = (GdkGLContextClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> I) setUseEs_ (self & useEs)
    local
      open ValueAccessor
    in
      val displayProp =
        {
          name = "display",
          gtype = fn () => C.gtype GdkDisplayClass.tOpt (),
          get = fn x => fn () => C.get GdkDisplayClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkDisplayClass.tOpt x
        }
      val sharedContextProp =
        {
          name = "shared-context",
          gtype = fn () => C.gtype GdkGLContextClass.tOpt (),
          get = fn x => fn () => C.get GdkGLContextClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkGLContextClass.tOpt x
        }
      val windowProp =
        {
          name = "window",
          gtype = fn () => C.gtype GdkWindowClass.tOpt (),
          get = fn x => fn () => C.get GdkWindowClass.tOpt x,
          set = ignore,
          init = fn x => C.set GdkWindowClass.tOpt x
        }
    end
  end
