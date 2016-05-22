
window.domain = 'http://192.168.16.166:3000/';

window.spriteBaseUrl = '/assets/sprites';

function loadUser(){
	$.get(domain+'student/2', function(data){
		window.user = data.response;
		loadProfile();
		loadSprite();
	});
}

loadUser();

function loadSprite(){
	var avatar = $('#avatar');
	var student = window.user;
	console.log(avatar.find('.body'), student);

    avatar.find('.body').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/pele/'+student.skin_color+".png')"});
	avatar.find('.hair').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/cabelo/'+student.hair_style+'/'+student.hair_color+".png')"});
    avatar.find('.nose').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/nariz/'+student.nose_style+".png')"});
    avatar.find('.eyes').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/olhos/'+student.eye_color+".png')"});
    avatar.find('.uniform').css({backgroundImage: "url('"+window.spriteBaseUrl+'/'+student.gender+'/roupa/'+student.uniform+".png')"});
}

function loadProfile(){
	
}