functor BoxedNewRecord (
  type notnull = CPointer.notnull
  type 'a p = 'a CPointer.p
  val new_ : unit -> notnull p
  val take_ : notnull p -> unit
  val copy_ : notnull p -> notnull p
  val free_ : notnull p -> unit
) :>
  NEW_RECORD
    where type C.notnull = CPointer.notnull
    where type 'a C.p = 'a CPointer.p
    where type ('a, 'b) C.r = ('a, 'b) CPointer.r =
  struct
    structure Boxed =
      BoxedRecord (
        type notnull = notnull
        type 'a p = 'a p
        val take_ = take_
        val copy_ = copy_
        val free_ = free_
      )
    open Boxed

    structure C =
      struct
        open C

        fun withNewPtr f () =
          let
            val ptr = new_ ()
          in
            ptr & f ptr
          end
      end
  end
