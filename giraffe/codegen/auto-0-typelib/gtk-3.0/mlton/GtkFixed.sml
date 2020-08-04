structure GtkFixed :>
  GTK_FIXED
    where type 'a class = 'a GtkFixedClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a widget_class = 'a GtkWidgetClass.class =
  struct
    val getType_ = _import "gtk_fixed_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_fixed_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val move_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_fixed_move" :
              GtkFixedClass.FFI.non_opt GtkFixedClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val put_ =
      fn
        x1
         & x2
         & x3
         & x4 =>
          (
            _import "gtk_fixed_put" :
              GtkFixedClass.FFI.non_opt GtkFixedClass.FFI.p
               * GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p
               * GInt32.FFI.val_
               * GInt32.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a GtkFixedClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a widget_class = 'a GtkWidgetClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkFixedClass.FFI.fromPtr false) new_ ()
    fun move
      self
      (
        widget,
        x,
        y
      ) =
      (
        GtkFixedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        move_
        (
          self
           & widget
           & x
           & y
        )
    fun put
      self
      (
        widget,
        x,
        y
      ) =
      (
        GtkFixedClass.FFI.withPtr false
         &&&> GtkWidgetClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> GInt32.FFI.withVal
         ---> I
      )
        put_
        (
          self
           & widget
           & x
           & y
        )
  end
