table exstack : { Id : int, Value : string
		} PRIMARY KEY (Id)
		

structure S = Stack.Make(struct
			     type t = string
			     val tab = exstack
			 end)

fun push v = S.push v.Value;
    redirect (url (main ()))

and pop () = S.pop ();
    redirect (url (main ()))

and main () = s <- S.render ();
    return <xml>
      <body>
	<h1>Stack</h1>
	<hr/>
	{s}
	<hr/>
	<form>
	  <textbox{#Value}/>
	  <submit action={push} value="push"/>
	</form>
	<form>
	  <submit action={pop} value="pop"/>
	</form>
      </body>
    </xml>
