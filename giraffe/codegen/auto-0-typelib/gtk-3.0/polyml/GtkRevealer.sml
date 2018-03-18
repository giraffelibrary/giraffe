structure GtkRevealer :>
  GTK_REVEALER
    where type 'a class = 'a GtkRevealerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type revealer_transition_type_t = GtkRevealerTransitionType.t =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_revealer_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_revealer_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val getChildRevealed_ = call (getSymbol "gtk_revealer_get_child_revealed") (GtkRevealerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getRevealChild_ = call (getSymbol "gtk_revealer_get_reveal_child") (GtkRevealerClass.PolyML.cPtr --> GBool.PolyML.cVal)
      val getTransitionDuration_ = call (getSymbol "gtk_revealer_get_transition_duration") (GtkRevealerClass.PolyML.cPtr --> GUInt32.PolyML.cVal)
      val getTransitionType_ = call (getSymbol "gtk_revealer_get_transition_type") (GtkRevealerClass.PolyML.cPtr --> GtkRevealerTransitionType.PolyML.cVal)
      val setRevealChild_ = call (getSymbol "gtk_revealer_set_reveal_child") (GtkRevealerClass.PolyML.cPtr &&> GBool.PolyML.cVal --> cVoid)
      val setTransitionDuration_ = call (getSymbol "gtk_revealer_set_transition_duration") (GtkRevealerClass.PolyML.cPtr &&> GUInt32.PolyML.cVal --> cVoid)
      val setTransitionType_ = call (getSymbol "gtk_revealer_set_transition_type") (GtkRevealerClass.PolyML.cPtr &&> GtkRevealerTransitionType.PolyML.cVal --> cVoid)
    end
    type 'a class = 'a GtkRevealerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type revealer_transition_type_t = GtkRevealerTransitionType.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRevealerClass.FFI.fromPtr false) new_ ()
    fun getChildRevealed self = (GtkRevealerClass.FFI.withPtr ---> GBool.FFI.fromVal) getChildRevealed_ self
    fun getRevealChild self = (GtkRevealerClass.FFI.withPtr ---> GBool.FFI.fromVal) getRevealChild_ self
    fun getTransitionDuration self = (GtkRevealerClass.FFI.withPtr ---> GUInt32.FFI.fromVal) getTransitionDuration_ self
    fun getTransitionType self = (GtkRevealerClass.FFI.withPtr ---> GtkRevealerTransitionType.FFI.fromVal) getTransitionType_ self
    fun setRevealChild self revealChild = (GtkRevealerClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setRevealChild_ (self & revealChild)
    fun setTransitionDuration self duration = (GtkRevealerClass.FFI.withPtr &&&> GUInt32.FFI.withVal ---> I) setTransitionDuration_ (self & duration)
    fun setTransitionType self transition = (GtkRevealerClass.FFI.withPtr &&&> GtkRevealerTransitionType.FFI.withVal ---> I) setTransitionType_ (self & transition)
    local
      open Property
    in
      val childRevealedProp = {get = fn x => get "child-revealed" boolean x}
      val revealChildProp =
        {
          get = fn x => get "reveal-child" boolean x,
          set = fn x => set "reveal-child" boolean x,
          new = fn x => new "reveal-child" boolean x
        }
      val transitionDurationProp =
        {
          get = fn x => get "transition-duration" uint x,
          set = fn x => set "transition-duration" uint x,
          new = fn x => new "transition-duration" uint x
        }
      val transitionTypeProp =
        {
          get = fn x => get "transition-type" GtkRevealerTransitionType.t x,
          set = fn x => set "transition-type" GtkRevealerTransitionType.t x,
          new = fn x => new "transition-type" GtkRevealerTransitionType.t x
        }
    end
  end
