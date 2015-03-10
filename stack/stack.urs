functor Make(M : sig
                 type t
		 val inj : sql_injectable t
		 val shw : show t
		 table tab : ([Id = int, Value = t])
             end) : sig
    
    val push : M.t -> transaction unit
    val pop : unit -> transaction unit
    val render : unit -> transaction xbody
end

