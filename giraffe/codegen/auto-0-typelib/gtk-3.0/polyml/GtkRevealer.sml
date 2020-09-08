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
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkRevealerClass.FFI.fromPtr false) new_ ()
    fun getChildRevealed self = (GtkRevealerClass.FFI.withPtr false ---> GBool.FFI.fromVal) getChildRevealed_ self
    fun getRevealChild self = (GtkRevealerClass.FFI.withPtr false ---> GBool.FFI.fromVal) getRevealChild_ self
    fun getTransitionDuration self = (GtkRevealerClass.FFI.withPtr false ---> GUInt32.FFI.fromVal) getTransitionDuration_ self
    fun getTransitionType self = (GtkRevealerClass.FFI.withPtr false ---> GtkRevealerTransitionType.FFI.fromVal) getTransitionType_ self
    fun setRevealChild self revealChild = (GtkRevealerClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRevealChild_ (self & revealChild)
    fun setTransitionDuration self duration = (GtkRevealerClass.FFI.withPtr false &&&> GUInt32.FFI.withVal ---> I) setTransitionDuration_ (self & duration)
    fun setTransitionType self transition = (GtkRevealerClass.FFI.withPtr false &&&> GtkRevealerTransitionType.FFI.withVal ---> I) setTransitionType_ (self & transition)
    local
      open ValueAccessor
    in
      val childRevealedProp =
        {
          name = "child-revealed",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = ignore,
          init = ignore
        }
      val revealChildProp =
        {
          name = "reveal-child",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
      val transitionDurationProp =
        {
          name = "transition-duration",
          gtype = fn () => C.gtype uint (),
          get = fn x => fn () => C.get uint x,
          set = fn x => C.set uint x,
          init = fn x => C.set uint x
        }
      val transitionTypeProp =
        {
          name = "transition-type",
          gtype = fn () => C.gtype GtkRevealerTransitionType.t (),
          get = fn x => fn () => C.get GtkRevealerTransitionType.t x,
          set = fn x => C.set GtkRevealerTransitionType.t x,
          init = fn x => C.set GtkRevealerTransitionType.t x
        }
    end
  end
