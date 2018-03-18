structure GtkRevealer :>
  GTK_REVEALER
    where type 'a class = 'a GtkRevealerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type revealer_transition_type_t = GtkRevealerTransitionType.t =
  struct
    val getType_ = _import "gtk_revealer_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_revealer_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val getChildRevealed_ = _import "gtk_revealer_get_child_revealed" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p -> GBool.FFI.val_;
    val getRevealChild_ = _import "gtk_revealer_get_reveal_child" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p -> GBool.FFI.val_;
    val getTransitionDuration_ = _import "gtk_revealer_get_transition_duration" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p -> GUInt32.FFI.val_;
    val getTransitionType_ = _import "gtk_revealer_get_transition_type" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p -> GtkRevealerTransitionType.FFI.val_;
    val setRevealChild_ = fn x1 & x2 => (_import "gtk_revealer_set_reveal_child" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setTransitionDuration_ = fn x1 & x2 => (_import "gtk_revealer_set_transition_duration" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p * GUInt32.FFI.val_ -> unit;) (x1, x2)
    val setTransitionType_ = fn x1 & x2 => (_import "gtk_revealer_set_transition_type" : GtkRevealerClass.FFI.notnull GtkRevealerClass.FFI.p * GtkRevealerTransitionType.FFI.val_ -> unit;) (x1, x2)
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
