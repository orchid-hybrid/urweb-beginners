functor Make(M : sig
                 type t
		 val inj : sql_injectable t
		 val shw : show t
		 table tab : ([Id = int, Value = t])
             end) = struct
    
    val tab = M.tab

    sequence seq
    
    fun push x = id <- nextval seq;
	dml (INSERT INTO tab (Id, Value) VALUES ({[id]}, {[x]}))

    fun pop () =
	highest <- oneRow (SELECT Tab.Id FROM tab ORDER BY Tab.Id DESC LIMIT 1);
	dml (DELETE FROM tab WHERE Id = {[highest.Tab.Id]})
	
    fun render () = 
	rows <- queryX (SELECT * FROM tab ORDER BY Tab.Id ASC)
		       (fn row => <xml>
			 <li>{[row.Tab.Value]}</li>
		       </xml>);
	return <xml>
	  <ul>{rows}</ul>
	</xml>
end
