structure GdkGLContext :>
  GDK_G_L_CONTEXT
    where type 'a class = 'a GdkGLContextClass.class
    where type 'a display_class = 'a GdkDisplayClass.class
    where type 'a window_class = 'a GdkWindowClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gdk_gl_context_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val clearCurrent_ = call (getSymbol "gdk_gl_context_clear_current") (cVoid --> cVoid)
      val getCurrent_ = call (getSymbol "gdk_gl_context_get_current") (cVoid --> GdkGLContextClass.PolyML.cOptPtr)
      val getDebugEnabled_ = call (getSymbol "gdk_gl_context_get_debug_enabled") (GdkGLContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getDisplay_ = call (getSymbol "gdk_gl_context_get_display") (GdkGLContextClass.PolyML.cPtr --> GdkDisplayClass.PolyML.cOptPtr)
      val getForwardCompatible_ = call (getSymbol "gdk_gl_context_get_forward_compatible") (GdkGLContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRequiredVersion_ =
        call (getSymbol "gdk_gl_context_get_required_version")
          (
            GdkGLContextClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getSharedContext_ = call (getSymbol "gdk_gl_context_get_shared_context") (GdkGLContextClass.PolyML.cPtr --> GdkGLContextClass.PolyML.cOptPtr)
      val getUseEs_ = call (getSymbol "gdk_gl_context_get_use_es") (GdkGLContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getVersion_ =
        call (getSymbol "gdk_gl_context_get_version")
          (
            GdkGLContextClass.PolyML.cPtr
             &&> GInt.PolyML.cRef
             &&> GInt.PolyML.cRef
             --> cVoid
          )
      val getWindow_ = call (getSymbol "gdk_gl_context_get_window") (GdkGLContextClass.PolyML.cPtr --> GdkWindowClass.PolyML.cOptPtr)
      val isLegacy_ = call (getSymbol "gdk_gl_context_is_legacy") (GdkGLContextClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val makeCurrent_ = call (getSymbol "gdk_gl_context_make_current") (GdkGLContextClass.PolyML.cPtr --> cVoid)
      val realize_ = call (getSymbol "gdk_gl_context_realize") (GdkGLContextClass.PolyML.cPtr &&> GLibErrorRecord.PolyML.cOutOptRef --> GBool.PolyML.cVal)
      val setDebugEnabled_ = call (getSymbol "gdk_gl_context_set_debug_enabled") (GdkGLContextClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setForwardCompatible_ = call (getSymbol "gdk_gl_context_set_forward_compatible") (GdkGLContextClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setRequiredVersion_ =
        call (getSymbol "gdk_gl_context_set_required_version")
          (
            GdkGLContextClass.PolyML.cPtr
             &&> GInt.PolyML.cVal
             &&> GInt.PolyML.cVal
             --> cVoid
          )
      val setUseEs_ = call (getSymbol "gdk_gl_context_set_use_es") (GdkGLContextClass.PolyML.cPtr &&> GInt.PolyML.cVal --> cVoid)
    end
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
