structure Functions =
  struct
    fun iterate f x =
      case f x of
        NONE    => x
      | SOME x' => iterate f x'
  end

open Functions
