fun handler r = return <xml><body>
  {[r.T1]}
</body></xml>

fun main () = return <xml>
   <body>
    <form>
      <textarea {#T1} rows=40 cols=35/>
      <textarea {#T2} rows=40 cols=35/>
      <br/>
      <submit action={handler}/>
    </form>
   </body>
 </xml>
