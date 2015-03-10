functor Make(M : sig
                 type t
		 val inj : sql_injectable t
		 val shw : show t
		 table tab : ([Id = int, ParentId = int, Value = t])
             end) : sig
    
    val spawn : int -> M.t -> transaction unit
    val render : unit -> transaction xbody
end

