structure GtkRadioAction :>
  GTK_RADIO_ACTION
    where type 'a class = 'a GtkRadioActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_action_get_type" : unit -> GObjectType.FFI.val_;
    val new_ =
      fn
        (x1, x2)
         & (x3, x4)
         & (x5, x6)
         & (x7, x8)
         & x9 =>
          (
            _import "mlton_gtk_radio_action_new" :
              Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * Utf8.MLton.p1
               * Utf8.FFI.opt Utf8.MLton.p2
               * GInt.FFI.val_
               -> GtkRadioActionClass.FFI.non_opt GtkRadioActionClass.FFI.p;
          )
            (
              x1,
              x2,
              x3,
              x4,
              x5,
              x6,
              x7,
              x8,
              x9
            )
    val getCurrentValue_ = _import "gtk_radio_action_get_current_value" : GtkRadioActionClass.FFI.non_opt GtkRadioActionClass.FFI.p -> GInt.FFI.val_;
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_action_join_group" : GtkRadioActionClass.FFI.non_opt GtkRadioActionClass.FFI.p * GtkRadioActionClass.FFI.opt GtkRadioActionClass.FFI.p -> unit;) (x1, x2)
    val setCurrentValue_ = fn x1 & x2 => (_import "gtk_radio_action_set_current_value" : GtkRadioActionClass.FFI.non_opt GtkRadioActionClass.FFI.p * GInt.FFI.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRadioActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.FFI.withPtr false ---> GtkBuildableClass.FFI.fromPtr false) I self
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun new
      (
        name,
        label,
        tooltip,
        stockId,
        value
      ) =
      (
        Utf8.FFI.withPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> Utf8.FFI.withOptPtr 0
         &&&> GInt.FFI.withVal
         ---> GtkRadioActionClass.FFI.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
           & value
        )
    fun getCurrentValue self = (GtkRadioActionClass.FFI.withPtr false ---> GInt.FFI.fromVal) getCurrentValue_ self
    fun joinGroup self groupSource = (GtkRadioActionClass.FFI.withPtr false &&&> GtkRadioActionClass.FFI.withOptPtr false ---> I) joinGroup_ (self & groupSource)
    fun setCurrentValue self currentValue = (GtkRadioActionClass.FFI.withPtr false &&&> GInt.FFI.withVal ---> I) setCurrentValue_ (self & currentValue)
    local
      open ClosureMarshal Signal
    in
      fun changedSig f = signal "changed" (get 0w1 GtkRadioActionClass.t ---> ret_void) f
    end
    local
      open Property
    in
      val currentValueProp =
        {
          get = fn x => get "current-value" int x,
          set = fn x => set "current-value" int x,
          new = fn x => new "current-value" int x
        }
      val groupProp =
        {
          set = fn x => set "group" GtkRadioActionClass.tOpt x,
          new = fn x => new "group" GtkRadioActionClass.tOpt x
        }
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x,
          new = fn x => new "value" int x
        }
    end
  end
