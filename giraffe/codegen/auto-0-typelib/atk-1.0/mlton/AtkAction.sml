structure AtkAction :>
  ATK_ACTION
    where type 'a class = 'a AtkActionClass.class =
  struct
    val getType_ = _import "atk_action_get_type" : unit -> GObjectType.FFI.val_;
    val doAction_ = fn x1 & x2 => (_import "atk_action_do_action" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p * GInt32.FFI.val_ -> GBool.FFI.val_;) (x1, x2)
    val getDescription_ = fn x1 & x2 => (_import "atk_action_get_description" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val getKeybinding_ = fn x1 & x2 => (_import "atk_action_get_keybinding" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val getLocalizedName_ = fn x1 & x2 => (_import "atk_action_get_localized_name" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val getNActions_ = _import "atk_action_get_n_actions" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p -> GInt32.FFI.val_;
    val getName_ = fn x1 & x2 => (_import "atk_action_get_name" : AtkActionClass.FFI.non_opt AtkActionClass.FFI.p * GInt32.FFI.val_ -> Utf8.FFI.opt Utf8.FFI.out_p;) (x1, x2)
    val setDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_action_set_description" :
              AtkActionClass.FFI.non_opt AtkActionClass.FFI.p
               * GInt32.FFI.val_
               * Utf8.MLton.p1
               * Utf8.FFI.non_opt Utf8.MLton.p2
               -> GBool.FFI.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a AtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.FFI.fromVal) getType_
    fun doAction self i = (AtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> GBool.FFI.fromVal) doAction_ (self & i)
    fun getDescription self i = (AtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getDescription_ (self & i)
    fun getKeybinding self i = (AtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getKeybinding_ (self & i)
    fun getLocalizedName self i = (AtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getLocalizedName_ (self & i)
    fun getNActions self = (AtkActionClass.FFI.withPtr false ---> GInt32.FFI.fromVal) getNActions_ self
    fun getName self i = (AtkActionClass.FFI.withPtr false &&&> GInt32.FFI.withVal ---> Utf8.FFI.fromOptPtr 0) getName_ (self & i)
    fun setDescription self (i, desc) =
      (
        AtkActionClass.FFI.withPtr false
         &&&> GInt32.FFI.withVal
         &&&> Utf8.FFI.withPtr 0
         ---> GBool.FFI.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
