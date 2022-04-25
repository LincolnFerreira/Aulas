

//SEM EXPRESS
//passando o a biblioteca que queremos pegar ex:"http"
const http = require("http");

 //requisição e uma resposta sendo retornada
http
    .createServer((request, response) => {
       response.writeHead(200, { 'Content-Type': 'application/json' });

       if(request.url === '/cadastro') {
           response.end(JSON.stringify({
               message: "Rota de cadastro",
           }))
       }
       if(request.url === '/usuario') {
            response.end(JSON.stringify({
                message: "Rota de usuário",
            }))
       }
       response.end(JON.stringify({
           message: "Qualquer outra rota",
       }))
    })
    //TERMINAL - node - node server.js 
    .listen(4001, () => console.log("Servidor está rodando na porta 4001"));