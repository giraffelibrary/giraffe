structure GtkRevealer :>
  GTK_REVEALER
    where type 'a class = 'a GtkRevealerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type revealer_transition_type_t = GtkRevealerTransitionType.t =
  struct
    val getType_ = _import "gtk_revealer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_revealer_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val getChildRevealed_ = _import "gtk_revealer_get_child_revealed" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p -> GBool.FFI.val_;
    val getRevealChild_ = _import "gtk_revealer_get_reveal_child" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p -> GBool.FFI.val_;
    val getTransitionDuration_ = _import "gtk_revealer_get_transition_duration" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p -> GUInt.FFI.val_;
    val getTransitionType_ = _import "gtk_revealer_get_transition_type" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p -> GtkRevealerTransitionType.FFI.val_;
    val setRevealChild_ = fn x1 & x2 => (_import "gtk_revealer_set_reveal_child" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTransitionDuration_ = fn x1 & x2 => (_import "gtk_revealer_set_transition_duration" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p * GUInt.FFI.val_ -> unit;) (x1, x2)
    val setTransitionType_ = fn x1 & x2 => (_import "gtk_revealer_set_transition_type" : GtkRevealerClass.FFI.non_opt GtkRevealerClass.FFI.p * GtkRevealerTransitionType.FFI.val_ -> unit;) (x1, x2)
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
    fun getTransitionDuration self = (GtkRevealerClass.FFI.withPtr false ---> GUInt.FFI.fromVal) getTransitionDuration_ self
    fun getTransitionType self = (GtkRevealerClass.FFI.withPtr false ---> GtkRevealerTransitionType.FFI.fromVal) getTransitionType_ self
    fun setRevealChild self revealChild = (GtkRevealerClass.FFI.withPtr false &&&> GBool.FFI.withVal ---> I) setRevealChild_ (self & revealChild)
    fun setTransitionDuration self duration = (GtkRevealerClass.FFI.withPtr false &&&> GUInt.FFI.withVal ---> I) setTransitionDuration_ (self & duration)
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
