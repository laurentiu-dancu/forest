var num = 0;
function cycle() {
	num++;
	if(num % 5 == 0)
		num = 0;
	document.getElementById('main').style.backgroundImage="url(m"+num+".jpg)";
}

function linkss() {
	var x = document.getElementsByTagName("a");
	var i;
	for (i = 0; i <x.length; ++i)
	{
		x[i].style.color=getRandomColor();
		x[i].style.backgroundColor=getRandomColor();
		console.log(x[i]);
	}
	$("tableid").tablesorter(); 
}

function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}