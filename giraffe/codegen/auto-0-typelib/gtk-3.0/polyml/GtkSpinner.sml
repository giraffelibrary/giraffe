structure GtkSpinner :>
  GTK_SPINNER
    where type 'a class = 'a GtkSpinnerClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    local
      open PolyMLFFI
    in
      val getType_ = call (getSymbol "gtk_spinner_get_type") (cVoid --> GObjectType.PolyML.cVal)
      val new_ = call (getSymbol "gtk_spinner_new") (cVoid --> GtkWidgetClass.PolyML.cPtr)
      val start_ = call (getSymbol "gtk_spinner_start") (GtkSpinnerClass.PolyML.cPtr --> cVoid)
      val stop_ = call (getSymbol "gtk_spinner_stop") (GtkSpinnerClass.PolyML.cPtr --> cVoid)
    end
    type 'a class = 'a GtkSpinnerClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr false ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkSpinnerClass.FFI.fromPtr false) new_ ()
    fun start self = (GtkSpinnerClass.FFI.withPtr false ---> I) start_ self
    fun stop self = (GtkSpinnerClass.FFI.withPtr false ---> I) stop_ self
    local
      open ValueAccessor
    in
      val activeProp =
        {
          name = "active",
          gtype = fn () => C.gtype boolean (),
          get = fn x => fn () => C.get boolean x,
          set = fn x => C.set boolean x,
          init = fn x => C.set boolean x
        }
    end
  end
