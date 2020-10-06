signature G_I_REPOSITORY_ALIAS_INFO =
  sig
    type 'a class
    type 'a typeinfo_class
    val getCType : 'a class -> string    (* GIR only *)
    val getType : 'a class -> base typeinfo_class
  end
