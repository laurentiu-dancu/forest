var score = 0;
function getRandomWidth() {
	var num = Math.floor(Math.random() * ($( document ).width() - 100));
	return num;
}

function getRandomHeight() {
	var num = Math.floor(Math.random() * ($( document ).height()) - 100);
	if(num < 0)
		num = getRandomHeight();
	return num;
}
var tid;
function scramble() {
	redrawScore();
	clearTimeout(tid);
	tid = setTimeout(scramble, 1000);
	$("#imagelink").css({
		'position' : 'absolute',
		'top' : getRandomHeight(),
		'right' : getRandomWidth(),
		'display' : 'inline',
	});
	if(score >= 10)
		$("#imagelink").css({
		'display' : 'none',
	});
}
function redrawScore() {
	if(score < 10)
		$('#score').text('Your score: '+score);
	else
		$('#score').text('Your score: win');
}

function fscore() {
	score++;
	scramble();
}

$(document).ready(scramble);