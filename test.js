let elementHtml=`<strong>SKU:</strong> P127177`
let newContent=elementHtml.replaceAll(/<strong>([\s\w:]+)<\/strong>+([\s\w]+)/gi,`<strong>Codigo:</strong>$2</div>`)
console.log(newContent)
