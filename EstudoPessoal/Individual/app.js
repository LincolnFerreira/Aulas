//importando express
const { response } = require("express");
const { request } = require("express");
const express = require("express");


//inicializando função
const app = express();

app.use(express.json());


const cadastro = [];

/**
 * POST => Inserir um dado
 * GET => Buscar um/mais dados
 * PUT => Alterar um dado
 * DELETE => Remover um dado
 */

/**
 *  Body => Sempre que eu quiser enviar dados para minha aplicação
 *  Params => /cadastro/usahdfuhasudhfa 
 *  Query => /cadastro?id=1561561156125value=456456464561 
 */


app.post("/cadastro", (request, response) => {
        // nome, email, senha
    const {nome, email, senha} = request.body;
    
    const Recebecadastro = {
        nome,
        email,
        senha,
    }
    
    cadastro.push(Recebecadastro);
    
    return response.json(Recebecadastro);
});



app.get("/cadastro", (request, response) => {
    return response.json(cadastro);
});

app.get("/cadastro/:email", (request, response) => {
    const { email } = request.params;
    const Recebecadastro = cadastro.find((Recebecadastro) => Recebecadastro.email === email);
    return response.json(Recebecadastro);

}); 

app.put("/cadastro/:email", (request,response) => {
    const { email } = request.params;
    const { nome, senha } = request.body;

    const RecebecadastroIndex = cadastro.findIndex(Recebecadastro => Recebecadastro.email === email);
    cadastro[RecebecadastroIndex] = {
        ...cadastro[RecebecadastroIndex],
        nome,
        senha,
    };
    
    return response.json({ message: "Cadastro alterado com sucesso!!"});
});

app.listen(4002, () => console.log("Servidor está rodando na porta 4002"));

//Cannot Get == não tem nenhuma rota