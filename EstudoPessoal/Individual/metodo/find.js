const alunos = [
    {nome: 'Lincoln', idade: 14},
    {nome: 'Wallace', idade: 15},
    {nome: 'Guilherme', idade: 16},
    {nome: 'Tales', idade: 17}
];

//sem o método FIND() implementado

//var aluno;
// for(var i = 0; i <= alunos.length; i++){
//     if(alunos[i].nome === 'Wallace'){
//         aluno = alunos[i];
//         break;
//     }
// }

//com o método FIND() implementado

var aluno = alunos.find((aluno) =>{
    return aluno.nome === 'Wallace';
});

console.log(aluno);