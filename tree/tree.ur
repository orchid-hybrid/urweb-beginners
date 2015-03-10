functor Make(M : sig
                 type t
		 val inj : sql_injectable t
		 val shw : show t
		 table tab : ([Id = int, ParentId = int, Value = t])
             end) = struct
    
    val tab = M.tab

    sequence seq
    
    fun spawn p x = id <- nextval seq;
	dml (INSERT INTO tab (Id, ParentId, Value) VALUES ({[id]}, {[p]}, {[x]}))
	
    fun render () =
	let
	    fun renderChildren p =
		rows <- queryX' (SELECT * FROM tab WHERE Tab.ParentId={[p]} ORDER BY Tab.Id ASC)
				(fn row => children <- renderChildren row.Tab.Id;
				    return <xml>
				      <li>
                                        {[row.Tab.Id]}:{[row.Tab.Value]}
					{children}
				      </li>
				    </xml>);
		return <xml>
		  <ul>{rows}</ul>
		</xml>
	in
	    renderChildren 0
	end
end
