structure GtkGLArea :>
  GTK_G_L_AREA
    where type 'a class = 'a GtkGLAreaClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_gl_area_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_gl_area_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val attachBuffers_ = _import "gtk_gl_area_attach_buffers" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> unit;
    val getAutoRender_ = _import "gtk_gl_area_get_auto_render" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GBool.FFI.val_;
    val getContext_ = _import "gtk_gl_area_get_context" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GdkGLContextClass.FFI.notnull GdkGLContextClass.FFI.p;
    val getHasAlpha_ = _import "gtk_gl_area_get_has_alpha" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GBool.FFI.val_;
    val getHasDepthBuffer_ = _import "gtk_gl_area_get_has_depth_buffer" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GBool.FFI.val_;
    val getHasStencilBuffer_ = _import "gtk_gl_area_get_has_stencil_buffer" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GBool.FFI.val_;
    val getRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gl_area_get_required_version" :
              GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p
               * GInt.FFI.ref_
               * GInt.FFI.ref_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val getUseEs_ = _import "gtk_gl_area_get_use_es" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> GBool.FFI.val_;
    val makeCurrent_ = _import "gtk_gl_area_make_current" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> unit;
    val queueRender_ = _import "gtk_gl_area_queue_render" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p -> unit;
    val setAutoRender_ = fn x1 & x2 => (_import "gtk_gl_area_set_auto_render" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasAlpha_ = fn x1 & x2 => (_import "gtk_gl_area_set_has_alpha" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasDepthBuffer_ = fn x1 & x2 => (_import "gtk_gl_area_set_has_depth_buffer" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setHasStencilBuffer_ = fn x1 & x2 => (_import "gtk_gl_area_set_has_stencil_buffer" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setRequiredVersion_ =
      fn
        x1
         & x2
         & x3 =>
          (
            _import "gtk_gl_area_set_required_version" :
              GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p
               * GInt.FFI.val_
               * GInt.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setUseEs_ = fn x1 & x2 => (_import "gtk_gl_area_set_use_es" : GtkGLAreaClass.FFI.notnull GtkGLAreaClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkGLAreaClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkGLAreaClass.FFI.fromPtr true) new_ ()
    fun attachBuffers self = (GtkGLAreaClass.FFI.withPtr ---> I) attachBuffers_ self
    fun getAutoRender self = (GtkGLAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) getAutoRender_ self
    fun getContext self = (GtkGLAreaClass.FFI.withPtr ---> GdkGLContextClass.FFI.fromPtr false) getContext_ self
    fun getHasAlpha self = (GtkGLAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasAlpha_ self
    fun getHasDepthBuffer self = (GtkGLAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasDepthBuffer_ self
    fun getHasStencilBuffer self = (GtkGLAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) getHasStencilBuffer_ self
    fun getRequiredVersion self =
      let
        val major
         & minor
         & () =
          (
            GtkGLAreaClass.FFI.withPtr
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
    fun getUseEs self = (GtkGLAreaClass.FFI.withPtr ---> GBool.FFI.fromVal) getUseEs_ self
    fun makeCurrent self = (GtkGLAreaClass.FFI.withPtr ---> I) makeCurrent_ self
    fun queueRender self = (GtkGLAreaClass.FFI.withPtr ---> I) queueRender_ self
    fun setAutoRender self autoRender = (GtkGLAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setAutoRender_ (self & autoRender)
    fun setHasAlpha self hasAlpha = (GtkGLAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasAlpha_ (self & hasAlpha)
    fun setHasDepthBuffer self hasDepthBuffer = (GtkGLAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasDepthBuffer_ (self & hasDepthBuffer)
    fun setHasStencilBuffer self hasStencilBuffer = (GtkGLAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setHasStencilBuffer_ (self & hasStencilBuffer)
    fun setRequiredVersion self (major, minor) =
      (
        GtkGLAreaClass.FFI.withPtr
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
    fun setUseEs self useEs = (GtkGLAreaClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setUseEs_ (self & useEs)
    local
      open ClosureMarshal Signal
    in
      fun createContextSig f = signal "create-context" (void ---> ret GdkGLContextClass.t) f
      fun renderSig f = signal "render" (get 0w1 GdkGLContextClass.t ---> ret boolean) f
      fun resizeSig f = signal "resize" (get 0w1 int &&&> get 0w2 int ---> ret_void) (fn width & height => f (width, height))
    end
    local
      open Property
    in
      val autoRenderProp =
        {
          get = fn x => get "auto-render" boolean x,
          set = fn x => set "auto-render" boolean x,
          new = fn x => new "auto-render" boolean x
        }
      val contextProp = {get = fn x => get "context" GdkGLContextClass.tOpt x}
      val hasAlphaProp =
        {
          get = fn x => get "has-alpha" boolean x,
          set = fn x => set "has-alpha" boolean x,
          new = fn x => new "has-alpha" boolean x
        }
      val hasDepthBufferProp =
        {
          get = fn x => get "has-depth-buffer" boolean x,
          set = fn x => set "has-depth-buffer" boolean x,
          new = fn x => new "has-depth-buffer" boolean x
        }
      val hasStencilBufferProp =
        {
          get = fn x => get "has-stencil-buffer" boolean x,
          set = fn x => set "has-stencil-buffer" boolean x,
          new = fn x => new "has-stencil-buffer" boolean x
        }
      val useEsProp =
        {
          get = fn x => get "use-es" boolean x,
          set = fn x => set "use-es" boolean x,
          new = fn x => new "use-es" boolean x
        }
    end
  end