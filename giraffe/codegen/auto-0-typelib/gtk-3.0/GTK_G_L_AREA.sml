signature GTK_G_L_AREA =
  sig
    type 'a class
    type 'a buildable_class
    type t = base class
    val asImplementorIface : 'a class -> base Atk.ImplementorIfaceClass.class
    val asBuildable : 'a class -> base buildable_class
    val getType : unit -> GObject.Type.t
    val new : unit -> base class
    val attachBuffers : 'a class -> unit
    val getAutoRender : 'a class -> bool
    val getContext : 'a class -> base Gdk.GLContextClass.class
    val getHasAlpha : 'a class -> bool
    val getHasDepthBuffer : 'a class -> bool
    val getHasStencilBuffer : 'a class -> bool
    val getRequiredVersion : 'a class -> LargeInt.int * LargeInt.int
    val getUseEs : 'a class -> bool
    val makeCurrent : 'a class -> unit
    val queueRender : 'a class -> unit
    val setAutoRender :
      'a class
       -> bool
       -> unit
    val setHasAlpha :
      'a class
       -> bool
       -> unit
    val setHasDepthBuffer :
      'a class
       -> bool
       -> unit
    val setHasStencilBuffer :
      'a class
       -> bool
       -> unit
    val setRequiredVersion :
      'a class
       -> LargeInt.int * LargeInt.int
       -> unit
    val setUseEs :
      'a class
       -> bool
       -> unit
    val createContextSig : (unit -> 'a Gdk.GLContextClass.class) -> 'b class Signal.t
    val renderSig : (base Gdk.GLContextClass.class -> bool) -> 'a class Signal.t
    val resizeSig : (LargeInt.int * LargeInt.int -> unit) -> 'a class Signal.t
    val autoRenderProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val contextProp : {get : 'a class -> base Gdk.GLContextClass.class option}
    val hasAlphaProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasDepthBufferProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val hasStencilBufferProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
    val useEsProp :
      {
        get : 'a class -> bool,
        set :
          bool
           -> 'a class
           -> unit,
        new : bool -> 'a class Property.t
      }
  end
