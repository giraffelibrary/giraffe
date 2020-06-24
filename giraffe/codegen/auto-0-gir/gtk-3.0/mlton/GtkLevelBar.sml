structure GtkLevelBar :>
  GTK_LEVEL_BAR
    where type 'a class = 'a GtkLevelBarClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class
    where type 'a orientable_class = 'a GtkOrientableClass.class
    where type level_bar_mode_t = GtkLevelBarMode.t =
  struct
    val getType_ = _import "gtk_level_bar_get_type" : unit -> GObjectType.FFI.val_;
    val new_ = _import "gtk_level_bar_new" : unit -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;
    val newForInterval_ = fn x1 & x2 => (_import "gtk_level_bar_new_for_interval" : GDouble.FFI.val_ * GDouble.FFI.val_ -> GtkWidgetClass.FFI.non_opt GtkWidgetClass.FFI.p;) (x1, x2)
    val addOffsetValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_level_bar_add_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * GDouble.FFI.val_
               -> unit;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getInverted_ = _import "gtk_level_bar_get_inverted" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GBool.FFI.val_;
    val getMaxValue_ = _import "gtk_level_bar_get_max_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val getMinValue_ = _import "gtk_level_bar_get_min_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val getMode_ = _import "gtk_level_bar_get_mode" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GtkLevelBarMode.FFI.val_;
    val getOffsetValue_ =
      fn
        x1
         & (x2, x3)
         & x4 =>
          (
            _import "mlton_gtk_level_bar_get_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GDouble.FFI.ref_
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    val getValue_ = _import "gtk_level_bar_get_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p -> GDouble.FFI.val_;
    val removeOffsetValue_ =
      fn
        x1 & (x2, x3) =>
          (
            _import "mlton_gtk_level_bar_remove_offset_value" :
              GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               -> unit;
          )
            (
              x1,
              x2,
              x3
            )
    val setInverted_ = fn x1 & x2 => (_import "gtk_level_bar_set_inverted" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GBool.FFI.val_ -> unit;) (x1, x2)
    val setMaxValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_max_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setMinValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_min_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    val setMode_ = fn x1 & x2 => (_import "gtk_level_bar_set_mode" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GtkLevelBarMode.FFI.val_ -> unit;) (x1, x2)
    val setValue_ = fn x1 & x2 => (_import "gtk_level_bar_set_value" : GtkLevelBarClass.FFI.non_opt GtkLevelBarClass.FFI.p * GDouble.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkLevelBarClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type 'a orientable_class = 'a GtkOrientableClass.class
    type level_bar_mode_t = GtkLevelBarMode.t
    type t = base class
    fun asImplementorIface self = (GObjectObjectClass.FFI.withPtr ---> AtkImplementorIfaceClass.FFI.fromPtr false) I self
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr ---> GtkBuildableClass.FFI.fromPtr false) I self
    fun asOrientable self = (GObjectObjectClass.FFI.withPtr ---> GtkOrientableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new () = (I ---> GtkLevelBarClass.FFI.fromPtr false) new_ ()
    fun newForInterval (minValue, maxValue) = (GDouble.FFI.withVal &&&> GDouble.FFI.withVal ---> GtkLevelBarClass.FFI.fromPtr false) newForInterval_ (minValue & maxValue)
    fun addOffsetValue self (name, value) =
      (
        GtkLevelBarClass.FFI.withPtr
         &&&> Utf8.FFI.withPtr
         &&&> GDouble.FFI.withVal
         ---> I
      )
        addOffsetValue_
        (
          self
           & name
           & value
        )
    fun getInverted self = (GtkLevelBarClass.FFI.withPtr ---> GBool.FFI.fromVal) getInverted_ self
    fun getMaxValue self = (GtkLevelBarClass.FFI.withPtr ---> GDouble.FFI.fromVal) getMaxValue_ self
    fun getMinValue self = (GtkLevelBarClass.FFI.withPtr ---> GDouble.FFI.fromVal) getMinValue_ self
    fun getMode self = (GtkLevelBarClass.FFI.withPtr ---> GtkLevelBarMode.FFI.fromVal) getMode_ self
    fun getOffsetValue self name =
      let
        val value & retVal =
          (
            GtkLevelBarClass.FFI.withPtr
             &&&> Utf8.FFI.withOptPtr
             &&&> GDouble.FFI.withRefVal
             ---> GDouble.FFI.fromVal && GBool.FFI.fromVal
          )
            getOffsetValue_
            (
              self
               & name
               & GDouble.null
            )
      in
        if retVal then SOME value else NONE
      end
    fun getValue self = (GtkLevelBarClass.FFI.withPtr ---> GDouble.FFI.fromVal) getValue_ self
    fun removeOffsetValue self name = (GtkLevelBarClass.FFI.withPtr &&&> Utf8.FFI.withOptPtr ---> I) removeOffsetValue_ (self & name)
    fun setInverted self inverted = (GtkLevelBarClass.FFI.withPtr &&&> GBool.FFI.withVal ---> I) setInverted_ (self & inverted)
    fun setMaxValue self value = (GtkLevelBarClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setMaxValue_ (self & value)
    fun setMinValue self value = (GtkLevelBarClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setMinValue_ (self & value)
    fun setMode self mode = (GtkLevelBarClass.FFI.withPtr &&&> GtkLevelBarMode.FFI.withVal ---> I) setMode_ (self & mode)
    fun setValue self value = (GtkLevelBarClass.FFI.withPtr &&&> GDouble.FFI.withVal ---> I) setValue_ (self & value)
    local
      open ClosureMarshal Signal
    in
      fun offsetChangedSig f = signal "offset-changed" (get 0w1 string ---> ret_void) f
    end
    local
      open Property
    in
      val invertedProp =
        {
          get = fn x => get "inverted" boolean x,
          set = fn x => set "inverted" boolean x,
          new = fn x => new "inverted" boolean x
        }
      val maxValueProp =
        {
          get = fn x => get "max-value" double x,
          set = fn x => set "max-value" double x,
          new = fn x => new "max-value" double x
        }
      val minValueProp =
        {
          get = fn x => get "min-value" double x,
          set = fn x => set "min-value" double x,
          new = fn x => new "min-value" double x
        }
      val modeProp =
        {
          get = fn x => get "mode" GtkLevelBarMode.t x,
          set = fn x => set "mode" GtkLevelBarMode.t x,
          new = fn x => new "mode" GtkLevelBarMode.t x
        }
      val valueProp =
        {
          get = fn x => get "value" double x,
          set = fn x => set "value" double x,
          new = fn x => new "value" double x
        }
    end
  end
