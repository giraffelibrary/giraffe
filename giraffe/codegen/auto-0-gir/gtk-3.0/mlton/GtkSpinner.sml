structure GtkSpinner :>
  GTK_SPINNER
    where type 'a class = 'a GtkSpinnerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_spinner_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_spinner_new" : unit -> GtkWidgetClass.FFI.notnull GtkWidgetClass.FFI.p;
    val start_ = _import "gtk_spinner_start" : GtkSpinnerClass.FFI.notnull GtkSpinnerClass.FFI.p -> unit;
    val stop_ = _import "gtk_spinner_stop" : GtkSpinnerClass.FFI.notnull GtkSpinnerClass.FFI.p -> unit;
    type 'a class = 'a GtkSpinnerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSpinnerClass.FFI.fromPtr false) new_ ()
    fun start self = (GtkSpinnerClass.FFI.withPtr ---> I) start_ self
    fun stop self = (GtkSpinnerClass.FFI.withPtr ---> I) stop_ self
    local
      open Property
    in
      val activeProp =
        {
          get = fn x => get "active" boolean x,
          set = fn x => set "active" boolean x,
          new = fn x => new "active" boolean x
        }
    end
  end
