structure GdkGLContext :>
  GDK_G_L_CONTEXT
    where type 'a class = 'a GdkGLContextClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type 'a window_class = 'a GdkWindowClass.class =
  struct
    val getType_ = _import "gdk_gl_context_get_type" : unit -> GObjectType.FFI.val_;
    val clearCurrent_ = _import "gdk_gl_context_clear_current" : unit -> unit;
    val getCurrent_ = _import "gdk_gl_context_get_current" : unit -> unit GdkGLContextClass.FFI.p;
    val getDebugEnabled_ = _import "gdk_gl_context_get_debug_enabled" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getDisplay_ = _import "gdk_gl_context_get_display" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> unit GdkDisplayClass.FFI.p;
    val getForwardCompatible_ = _import "gdk_gl_context_get_forward_compatible" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_get_required_version" :
              GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getSharedContext_ = _import "gdk_gl_context_get_shared_context" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> unit GdkGLContextClass.FFI.p;
    val getUseEs_ = _import "gdk_gl_context_get_use_es" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val getVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_get_version" :
              GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getWindow_ = _import "gdk_gl_context_get_window" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> unit GdkWindowClass.FFI.p;
    val isLegacy_ = _import "gdk_gl_context_is_legacy" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> GBool.FFI.val_;
    val makeCurrent_ = _import "gdk_gl_context_make_current" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p -> unit;
    val realize_ = fn x1 & x2 => (_import "gdk_gl_context_realize" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p * (unit, unit) GLibErrorRecord.FFI.r -> GBool.FFI.val_;) (x1, x2)
    val setDebugEnabled_ = fn x1 & x2 => (_import "gdk_gl_context_set_debug_enabled" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setForwardCompatible_ = fn x1 & x2 => (_import "gdk_gl_context_set_forward_compatible" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gdk_gl_context_set_required_version" :
              GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseEs_ = fn x1 & x2 => (_import "gdk_gl_context_set_use_es" : GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GdkGLContextClass.class
    type 'a display_class = 'a GdkDisplayClass.class
    type 'a window_class = 'a GdkWindowClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun clearCurrent () = (I ---> I) clearCurrent_ ()
    fun getCurrent () = (I ---> GdkGLContextClass.FFI.fromOptPtr false) getCurrent_ ()
    fun getDebugEnabled self = (GdkGLContextClass.FFI.withPtr ---> GBool.FFI.fromVal) getDebugEnabled_ self
    fun getDisplay self = (GdkGLContextClass.FFI.withPtr ---> GdkDisplayClass.FFI.fromOptPtr false) getDisplay_ self
    fun getForwardCompatible self = (GdkGLContextClass.FFI.withPtr ---> GBool.FFI.fromVal) getForwardCompatible_ self
    fun getRequiredVersion self =
      let
        val major
         & minor
         & () =
          (
            GdkGLContextClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getRequiredVersion_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (major, minor)
      end
    fun getSharedContext self = (GdkGLContextClass.FFI.withPtr ---> GdkGLContextClass.FFI.fromOptPtr false) getSharedContext_ self
    fun getUseEs self = (GdkGLContextClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseEs_ self
    fun getVersion self =
      let
        val major
         & minor
         & () =
          (
            GdkGLContextClass.FFI.withPtr
             &&&> GInt.FFI.withRefVal
             &&&> GInt.FFI.withRefVal
             ---> GInt.FFI.fromVal
                   && GInt.FFI.fromVal
                   && I
          )
            getVersion_
            (
              self
               & GInt.null
               & GInt.null
            )
      in
        (major, minor)
      end
    fun getWindow self = (GdkGLContextClass.FFI.withPtr ---> GdkWindowClass.FFI.fromOptPtr false) getWindow_ self
    fun isLegacy self = (GdkGLContextClass.FFI.withPtr ---> GBool.FFI.fromVal) isLegacy_ self
    fun makeCurrent self = (GdkGLContextClass.FFI.withPtr ---> I) makeCurrent_ self
    fun realize self = (GdkGLContextClass.FFI.withPtr &&&> GLibErrorRecord.handleError ---> ignore) realize_ (self & [])
    fun setDebugEnabled self enabled = (GdkGLContextClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setDebugEnabled_ (self & enabled)
    fun setForwardCompatible self compatible = (GdkGLContextClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setForwardCompatible_ (self & compatible)
    fun setRequiredVersion self (major, minor) =
      (
        GdkGLContextClass.FFI.withPtr
         &&&> GInt.FFI.withVal
         &&&> GInt.FFI.withVal
         ---> I
      )
        setRequiredVersion_
        (
          self
           & major
           & minor
        )
    fun setUseEs self useEs = (GdkGLContextClass.FFI.withPtr &&&> GInt.FFI.withVal ---> I) setUseEs_ (self & useEs)
    local
      open Property
    in
      val displayProp =
        {
          get = fn x => get "display" GdkDisplayClass.tOpt x,
          new = fn x => new "display" GdkDisplayClass.tOpt x
        }
      val sharedContextProp =
        {
          get = fn x => get "shared-context" GdkGLContextClass.tOpt x,
          new = fn x => new "shared-context" GdkGLContextClass.tOpt x
        }
      val windowProp =
        {
          get = fn x => get "window" GdkWindowClass.tOpt x,
          new = fn x => new "window" GdkWindowClass.tOpt x
        }
    end
  end
