$(document).ready(function(){
	var d = new Date();
	$("#data-de-hoje").text( d.toLocaleDateString() );
	$("#accordion").on('shown.bs.collapse', function(){
		$("html, body").animate({ scrollTop: $(document).height() }, "fast");
	});
	
  $("#add-cow-modal").on('hidden.bs.modal', function(){
	resetCadastro();
  });
	
  $("#atendimento-vet-modal").on('hidden.bs.modal', function(){
	$(".atendimento-all-ipt").val("");
  });
});

function iniciarOrdenha() {
	let resp = $("#resp").val();
	if(resp != "0") {
		let b = $("#ordenha-btns-wrap").children();
		let d = new Date();
		let t = d.toLocaleTimeString();
		b.addClass("none");
		b.eq(1).removeClass("none");
		$("#ordenha-start-time").text(t);
	} else {
		alert("Selecione o responsável pela ordenha!");
	}
}

function pararOrdenha() {
	let b = $("#ordenha-btns-wrap").children();
	let d = new Date();
	let t = d.toLocaleTimeString();
	b.addClass("none");
	b.eq(0).removeClass("none");
	$("#ordenha-end-time").text(t);
	$("#ordenha-qtd").text(7);
}

function resetarOrdenha() {
	$("#resp").val("0");
	$("#ordenha-start-time").text("");
	$("#ordenha-end-time").text("");
	$("#ordenha-qtd").text("");
}


function iniciarAtendimento() {
	let vet = $("#vets").val();
	if(vet != "0") {
		var d = new Date();
		$("#data-do-atendimento").text( d.toLocaleString() );
		$("#atendimento-vet-modal").modal("show");
	} else {
		alert("Selecione o veterinário responsável pelo atendimento!");
	}
}

function salvarAtendimento() {
	alert("Atendimento registrado com sucesso!");
}

function searchCow() {
	let cowid = $(".cow-id-input").val();
	if(cowid) {
		$("#info-cow-block").removeClass("invisible");
		$(".cow-id-display").text(cowid);
		$(".start-action-btn").attr("disabled", false);
		resetarOrdenha();
		alert("Animal adicionado com sucesso.");
	} else {
		$("#info-cow-block").addClass("invisible");
		$(".start-action-btn").attr("disabled", true);
		alert("Digite a ID do animal.");
	}

}

function storeCow() {
	let cowid = $("#cowid").val();
	if (!cowid) {
		cowid = "0001";
	}
	$(".cow-id-input").val(cowid);
	$("#info-cow-block").removeClass("invisible");
	$(".cow-id-display").text(cowid);
	$(".start-action-btn").attr("disabled", false);
	resetarOrdenha();
	alert("Animal cadastrado com sucesso.");
}

function addPhoto(id) {
	$(".cow-photo").attr("src", "img/vaca"+id+".jpg").removeClass("m-4");
	alert("Foto adicionada com sucesso!");
}

function resetCadastro() {
	$(".cadastro-id").val("");
	$(".cadastro-date").val("");
	$(".cadastro-raca").val("");
	$(".cadastro-comment").val("");
	$(".cow-photo").attr("src", "img/camera.png").addClass("m-4");
}