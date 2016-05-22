
window.domain = 'http://192.168.16.166:3000/';

window.spriteBaseUrl = '/assets/sprites';

function loadUser(){
	$.get(domain+'student/2', function(data){
		window.user = data.response;
		loadProfile();
		loadSprite();
		loadAdventures();
		loadQuest();
	});
}

loadUser();

function loadSprite(){
	var avatar = $('#avatar');
	var student = window.user;

    avatar.find('.body').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/pele/'+pad(student.skin_color, 2)+".png')"});
	avatar.find('.hair').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/cabelo/'+pad(student.hair_color, 2)+'/'+pad(student.hair_style, 2)+".png')"});
    avatar.find('.nose').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/nariz/'+pad(student.nose_style, 2)+".png')"});
    avatar.find('.eyes').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/olhos/'+pad(student.eye_color, 2)+".png')"});
    avatar.find('.uniform').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/roupa/'+pad(student.uniform, 2)+".png')"});
}

function loadQuest(){
	$.get(domain+'adventure/2/', {student_id: window.user.id}, function(data){
		$('.info.title').text(data.response.name);

		var ul = $('<ul class="quest" />');
		var li = $('<li />');

		for(var i in data.response.missions){
			aLi = li.clone();
			aLi.append(data.response.missions[i].name + '<a href="#" > Aceitar </a>');
			ul.append(aLi);
		}

		$('.row.quest').append(ul);
	});
}

function loadAdventures(){

	$.get(domain+'adventure/available', {student_id: window.user.id}, function(data){
		var questTemplate = $('.quests.template');
		var ul = $('<ul class="adventure" />');
		var li = $('<li />');
		for (var i in data.response) {
			var aQuestTemplate = questTemplate.clone().removeClass('template');
			aUl = ul.clone();	
			aQuestTemplate.append(aUl);
			questTemplate.parent().prepend(aQuestTemplate);

			aLi = li.clone();
			aLi.append('<h2> Aventura: ' + data.response[i].name + '</h2>')
			aUl.append(aLi);
			aLi = li.clone();
			aLi.append('<h4> ' + data.response[i].description + '</h4>')
			aUl.append(aLi);
			aLi = li.clone();
			aUl.append(aLi);
			aUl = ul.clone();
			aLi.append(aUl);
			aLi = li.clone();
			aLi.append('<strong>Missões Inclusas:</strong>	');
			aUl.append(aLi);
			for(var j in data.response[i].missions){
				aLi = li.clone();
				aLi.append(data.response[i].missions[j].name);
				aUl.append(aLi);
			}
			aLi = li.clone();
			aLi.append('<a class="accept" href="/quest" > Aceitar </a>');
			aUl.append(aLi);

		}
	});
}

function loadProfile(){

	$('h2.title').text(window.user.real_name+' (@'+window.user.nickname+')');

	edit = $('jumbotron.edit');

	if (edit) {

		for (field in window.user) {
			$('#'+field).val(window.user[field])
		}

		var option = $('<option />');

		var skin = $('#skin')

		for (var i = 1; i <= 4; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.skin_color) == i){
				o.prop('selected', 'selected');
			}

			skin.append(o);
		}

		skin.change(function(){
			window.user.skin_color = $(this).val();
			loadSprite(); 
		});

		var hair = $('#hair')
		var hair2 = $('#hair2')

		for (var i = 1; i <= 5; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.hair_color) == i){
				o.prop('selected', 'selected');
			}

			hair.append(o);
		}

		hair.change(function(){
			window.user.hair_color = $(this).val();
			if (parseInt($(this).val()) == 5){
				hair2.prop('disabled', 'disabled');
			} else {
				hair2.removeProp('disabled');
			}
			loadSprite(); 
		});


		for (var i = 1; i <= 8; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.hair_style) == i){
				o.prop('selected', 'selected');
			}

			hair2.append(o);
		}

		hair2.change(function(){
			window.user.hair_style = $(this).val();
			loadSprite(); 
		});

		var eyes = $('#eyes')

		for (var i = 1; i <= 4; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.eye_color) == i){
				o.prop('selected', 'selected');
			}

			eyes.append(o);
		}

		eyes.change(function(){
			window.user.eye_color = $(this).val();
			loadSprite(); 
		});

		var nose = $('#nose')

		for (var i = 1; i <= 4; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.nose_style) == i){
				o.prop('selected', 'selected');
			}

			nose.append(o);
		}

		nose.change(function(){
			window.user.nose_style = $(this).val();
			loadSprite(); 
		});

		var uniform = $('#uniform')

		for (var i = 1; i <= 1; i++){
			o = option.clone()
			o.prop('value', pad(i, 2));
			o.text(pad(i, 2));

			if(parseInt(user.uniform) == i){
				o.prop('selected', 'selected');
			}

			uniform.append(o);
		}

		uniform.change(function(){
			window.user.uniform = $(this).val();
			loadSprite(); 
		});

		$('#gender').change(function(){
			window.user.gender = $(this).val();
			loadSprite(); 
		})

		$('#save').click(function(){

			for (field in window.user) {
				if($('#'+field).val()){
					window.user[field] = $('#'+field).val();
				}
			}

			$.post(domain+'student/'+ window.user.id +'/edit', window.user, function(data){
				alert('Editado com sucesso!');
				location.href = '/';
			});
		});
	}

}

function pad(n, width, z) {
  z = z || '0';
  n = n + '';
  return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}