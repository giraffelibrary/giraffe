signature G_OBJECT_VALUE =
  sig
    type record_t
    type type_t


    val init : type_t -> record_t
 (* val copy : record_t * record_t -> unit  ?? should be called assign for consistency? *)
    val reset : record_t -> unit

    val getType : unit -> type_t
    val holds : type_t -> record_t -> bool
    val gTypeOf : record_t -> type_t
    val isValue : record_t -> bool
 

    type ('a, 'b) accessor

    val get : ('a, 'b) accessor -> record_t -> 'a
    val set : ('a, 'b) accessor -> record_t -> 'b -> unit
    val baseType : ('a, 'b) accessor -> type_t


    structure C :
      sig
        type notnull
        type 'a p

        val createAccessor :
          {
            getType  : unit -> type_t,
            getValue : notnull p -> 'a,
            setValue : (notnull p, 'b) pair -> unit
          }
            -> ('a, 'b) accessor

        structure Array :
          sig
            type 'a p
            val get : ('a, 'b) accessor -> notnull p -> Word32.word -> 'a
            val set : ('a, 'b) accessor -> notnull p -> Word32.word -> 'b -> unit
          end

        val set : ('a, 'b) accessor -> notnull p -> 'b -> unit

        val isValue : notnull p -> bool
      end
  end
