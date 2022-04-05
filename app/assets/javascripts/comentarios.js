function mostrarComentario(){
  var button = document.getElementById('buttonComentario')
  var lista = document.getElementById('lista-comentario');

  if (lista.style.display == "block"){
    lista.style.display = "none";
    button.value = "Exibir comentários";
  } else{
    lista.style.display ="block";
    button.value = "Esconder comentários";
  }
}
function atualizaComentario(event){
     event.preventDefault();
     $.ajax({
       type:"POST",
       url:window.location.pathname + '/comentarios',
       dataType: "json",
       data: $("#form-comentario").serialize()
     }).done(function(data){
       var novoComentario = document.getElementById('lista-comentario');
       $(novoComentario).append("<div class='comentario'><p> Título: "+ data.titulo+"</p><p>Conteúdo:"+ data.conteudo +"</p><a href="+ window.location.pathname+'/comentarios/' +data.id+ '/edit' + ">Editar</a> <a data-confirm='Excluir"+ data.titulo + "?' rel='nofollow' data-method='delete' href= "+ window.location.pathname + '/comentarios/' +data.id+" >Excluir</a></div>");
     });
}

$(document).ready(function(){
  document.getElementById("form-comentario").addEventListener("submit", atualizaComentario);
})
