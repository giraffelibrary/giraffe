structure GtkRadioAction :>
  GTK_RADIO_ACTION
    where type 'a class = 'a GtkRadioActionClass.class
    where type 'a buildable_class = 'a GtkBuildableClass.class =
  struct
    val getType_ = _import "gtk_radio_action_get_type" : unit -> GObjectType.C.val_;
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
               * Utf8.C.notnull Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * Utf8.MLton.p1
               * unit Utf8.MLton.p2
               * FFI.Int32.C.val_
               -> GObjectObjectClass.C.notnull GObjectObjectClass.C.p;
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
    val getCurrentValue_ = _import "gtk_radio_action_get_current_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p -> FFI.Int32.C.val_;
    val joinGroup_ = fn x1 & x2 => (_import "gtk_radio_action_join_group" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * unit GObjectObjectClass.C.p -> unit;) (x1, x2)
    val setCurrentValue_ = fn x1 & x2 => (_import "gtk_radio_action_set_current_value" : GObjectObjectClass.C.notnull GObjectObjectClass.C.p * FFI.Int32.C.val_ -> unit;) (x1, x2)
    type 'a class = 'a GtkRadioActionClass.class
    type 'a buildable_class = 'a GtkBuildableClass.class
    type t = base class
    fun asBuildable self = (GObjectObjectClass.C.withPtr ---> GtkBuildableClass.C.fromPtr false) I self
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun new name label tooltip stockId value =
      (
        Utf8.C.withPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> Utf8.C.withOptPtr
         &&&> FFI.Int32.C.withVal
         ---> GtkRadioActionClass.C.fromPtr true
      )
        new_
        (
          name
           & label
           & tooltip
           & stockId
           & value
        )
    fun getCurrentValue self = (GObjectObjectClass.C.withPtr ---> FFI.Int32.C.fromVal) getCurrentValue_ self
    fun joinGroup self groupSource = (GObjectObjectClass.C.withPtr &&&> GObjectObjectClass.C.withOptPtr ---> I) joinGroup_ (self & groupSource)
    fun setCurrentValue self currentValue = (GObjectObjectClass.C.withPtr &&&> FFI.Int32.C.withVal ---> I) setCurrentValue_ (self & currentValue)
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
          set = fn x => set "current-value" int x
        }
      val groupProp = {set = fn x => set "group" GtkRadioActionClass.tOpt x}
      val valueProp =
        {
          get = fn x => get "value" int x,
          set = fn x => set "value" int x
        }
    end
  end
