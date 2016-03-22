structure AtkAction :>
  ATK_ACTION
    where type 'a class = 'a AtkActionClass.class =
  struct
    val getType_ = _import "atk_action_get_type" : unit -> GObjectType.C.val_;
    val doAction_ = fn x1 & x2 => (_import "atk_action_do_action" : AtkActionClass.C.notnull AtkActionClass.C.p * FFI.Int.C.val_ -> FFI.Bool.C.val_;) (x1, x2)
    val getDescription_ = fn x1 & x2 => (_import "atk_action_get_description" : AtkActionClass.C.notnull AtkActionClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getKeybinding_ = fn x1 & x2 => (_import "atk_action_get_keybinding" : AtkActionClass.C.notnull AtkActionClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getLocalizedName_ = fn x1 & x2 => (_import "atk_action_get_localized_name" : AtkActionClass.C.notnull AtkActionClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val getNActions_ = _import "atk_action_get_n_actions" : AtkActionClass.C.notnull AtkActionClass.C.p -> FFI.Int.C.val_;
    val getName_ = fn x1 & x2 => (_import "atk_action_get_name" : AtkActionClass.C.notnull AtkActionClass.C.p * FFI.Int.C.val_ -> Utf8.C.notnull Utf8.C.out_p;) (x1, x2)
    val setDescription_ =
      fn
        x1
         & x2
         & (x3, x4) =>
          (
            _import "mlton_atk_action_set_description" :
              AtkActionClass.C.notnull AtkActionClass.C.p
               * FFI.Int.C.val_
               * Utf8.MLton.p1
               * Utf8.C.notnull Utf8.MLton.p2
               -> FFI.Bool.C.val_;
          )
            (
              x1,
              x2,
              x3,
              x4
            )
    type 'a class = 'a AtkActionClass.class
    type t = base class
    val getType = (I ---> GObjectType.C.fromVal) getType_
    fun doAction self i = (AtkActionClass.C.withPtr &&&> FFI.Int.C.withVal ---> FFI.Bool.C.fromVal) doAction_ (self & i)
    fun getDescription self i = (AtkActionClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getDescription_ (self & i)
    fun getKeybinding self i = (AtkActionClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getKeybinding_ (self & i)
    fun getLocalizedName self i = (AtkActionClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getLocalizedName_ (self & i)
    fun getNActions self = (AtkActionClass.C.withPtr ---> FFI.Int.C.fromVal) getNActions_ self
    fun getName self i = (AtkActionClass.C.withPtr &&&> FFI.Int.C.withVal ---> Utf8.C.fromPtr false) getName_ (self & i)
    fun setDescription self i desc =
      (
        AtkActionClass.C.withPtr
         &&&> FFI.Int.C.withVal
         &&&> Utf8.C.withPtr
         ---> FFI.Bool.C.fromVal
      )
        setDescription_
        (
          self
           & i
           & desc
        )
  end
