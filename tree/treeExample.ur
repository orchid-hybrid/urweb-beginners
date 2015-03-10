table extree : { Id : int, ParentId : int,
		 Value : string
	       } PRIMARY KEY (Id)
		

structure T = Tree.Make(struct
			    type t = string
			    val tab = extree
			end)

fun push v = case read v.Parent of
		 None => error <xml/>
	       | Some p => T.spawn p v.Value;
		 redirect (url (main ()))
    
(*
and pop () = S.pop ();
    redirect (url (main ()))
*)
and main () = s <- T.render ();
    return <xml>
      <body>
	<h1>Tree</h1>
	<hr/>
	{s}
	<hr/>
	<form>
	  <textbox{#Parent}/>
	  <textbox{#Value}/>
	  <submit action={push} value="reply"/>
	</form>
(*
	<form>
	  <textbox{#Value}/>
	  <submit action={pop} value="Delete"/>
	</form>
*)
      </body>
    </xml>
