var grades = [65.95, 56.98, 78.62, 96.1, 90.3, 72.24, 92.34, 60.00, 81.43, 86.22, 88.33, 9.03, 49.93, 52.34, 53.11, 50.10, 88.88, 55.32, 55.69, 61.68, 70.44, 70.54, 90.0, 71.11, 80.01];

function make(){

	var perc = document.getElementById("ss1").value;
	var perc1 = document.getElementById("ss2").value; //A+
	var perc2 = document.getElementById("ss3").value;
	var perc3 = document.getElementById("ss4").value;
	var perc4 = document.getElementById("ss5").value;
	var perc5 = document.getElementById("ss6").value;
	var perc6 = document.getElementById("ss7").value;
	var perc7 = document.getElementById("ss8").value;
	var perc8 = document.getElementById("ss9").value;
	var perc9 = document.getElementById("ss10").value;
	var perc10 = document.getElementById("ss11").value;
	var perc11 = document.getElementById("ss12").value;

	if((perc=="") || (perc1=="") || (perc2=="") || (perc3=="") || (perc4=="") || (perc5=="") || (perc6=="") || (perc7=="") || (perc8=="") || (perc9=="") || (perc10=="") || (perc11=="")){
		document.getElementById("errorm").innerHTML="Error! Blank field present!";
		return;
	}

	if((isNaN(perc)==true) || (isNaN(perc1)==true) || (isNaN(perc2)==true) || (isNaN(perc3)==true) || (isNaN(perc4)==true) || (isNaN(perc5)==true) || (isNaN(perc6)==true) || (isNaN(perc7)==true) || (isNaN(perc8)==true) || (isNaN(perc9)==true) || (isNaN(perc10)==true) || (isNaN(perc11)==true)){
		document.getElementById("errorm").innerHTML="Error! Non-numeric data was inputted!";
		return;
	}

	if ((parseFloat(perc)<=parseFloat(perc1)) || (parseFloat(perc1)<=parseFloat(perc2)) || (parseFloat(perc2)<=parseFloat(perc3)) || (parseFloat(perc3)<=parseFloat(perc4)) || (parseFloat(perc4)<=parseFloat(perc5)) || (parseFloat(perc5)<=parseFloat(perc6)) || (parseFloat(perc6)<=parseFloat(perc7)) || (parseFloat(perc7)<=parseFloat(perc8)) || (parseFloat(perc8)<=parseFloat(perc9)) || (parseFloat(perc9)<=parseFloat(perc10)) || (parseFloat(perc10)<=parseFloat(perc11))){
		document.getElementById("errorm").innerHTML="Error! Incorrect numeric entry was inputted!";
		return;
	} 

	if ((parseFloat(perc10)>=parseFloat(perc9)) || (parseFloat(perc9)>=parseFloat(perc8)) || (parseFloat(perc8)>=parseFloat(perc7)) || (parseFloat(perc7)>=parseFloat(perc6)) || (parseFloat(perc6)>=parseFloat(perc5)) || (parseFloat(perc5)>=parseFloat(perc4)) || (parseFloat(perc4)>=parseFloat(perc3)) || (parseFloat(perc3)>=parseFloat(perc2)) || (parseFloat(perc2)>=parseFloat(perc1)) || (parseFloat(perc1)>=parseFloat(perc)) || (parseFloat(perc10)>=parseFloat(perc))){
		document.getElementById("errorm").innerHTML="Error! Make sure numeric entry was inputted!";
		return;
	}
	// if (parseFloat(perc)<= parseFloat(perc1) && document.getElementById("ss1").style.borderColor != "red"){
	// 	document.getElementById("ss1").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc1)<= parseFloat(perc2) && document.getElementById("ss2").style.borderColor != "red"){
	// 	document.getElementById("ss2").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc2)<= parseFloat(perc3) && document.getElementById("ss3").style.borderColor != "red"){
	// 	document.getElementById("ss3").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc3)<= parseFloat(perc4)){
	// 	document.getElementById("ss4").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc4)<= parseFloat(perc5)){
	// 	document.getElementById("ss5").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc5)<= parseFloat(perc6)){
	// 	document.getElementById("ss6").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc6)<= parseFloat(perc7)){
	// 	document.getElementById("ss7").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc7)<= parseFloat(perc8)){
	// 	document.getElementById("ss8").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc8)<= parseFloat(perc9)){
	// 	document.getElementById("ss9").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc9)<= parseFloat(perc10)){
	// 	document.getElementById("ss10").style.borderColor = "red";
	// 	return;
	// }
	// if (parseFloat(perc10)<= parseFloat(perc11)){
	// 	document.getElementById("ss11").style.borderColor = "red";
	// 	return;
	// }


	// document.getElementById("ss1").style.borderColor = "";
	// document.getElementById("ss2").style.borderColor = "";
	// document.getElementById("ss3").style.borderColor = "";
	// document.getElementById("ss4").style.borderColor = "";
	// document.getElementById("ss5").style.borderColor = "";
	// document.getElementById("ss6").style.borderColor = "";
	// document.getElementById("ss7").style.borderColor = "";
	// document.getElementById("ss8").style.borderColor = "";
	// document.getElementById("ss9").style.borderColor = "";
	// document.getElementById("ss10").style.borderColor = "";
	// document.getElementById("ss11").style.borderColor = "";
	t1.innerHTML=" ";
	t2.innerHTML=" ";
	t3.innerHTML=" ";
	t4.innerHTML=" ";
	t5.innerHTML=" ";
	t6.innerHTML=" ";
	t7.innerHTML=" ";
	t8.innerHTML=" ";
	t9.innerHTML=" ";
	t10.innerHTML=" ";
	t11.innerHTML=" ";
	document.getElementById("errorm").innerHTML="";

	for (var i=0; i<grades.length; i++){
		if (grades[i]>=perc1){
			var a = document.createTextNode("★");
			t1.appendChild(a); //text1=A+
		}
		if (grades[i]>=perc2 && grades[i]<perc1){
			var a = document.createTextNode("★");
			t2.appendChild(a); //text2=A
		}
		if (grades[i]>=perc3 && grades[i]<perc2){
			var a = document.createTextNode("★");
			t3.appendChild(a); //text2=A
		}
		if (grades[i]>=perc4 && grades[i]<perc3){
			var a = document.createTextNode("★");
			t4.appendChild(a); //text2=A
		}
		if (grades[i]>=perc5 && grades[i]<perc4){
			var a = document.createTextNode("★");
			t5.appendChild(a); //text2=A
		}
		if (grades[i]>=perc6 && grades[i]<perc5){
			var a = document.createTextNode("★");
			t6.appendChild(a); //text2=A
		}
		if (grades[i]>=perc7 && grades[i]<perc6){
			var a = document.createTextNode("★");
			t7.appendChild(a); //text2=A
		}
		if (grades[i]>=perc8 && grades[i]<perc7){
			var a = document.createTextNode("★");
			t8.appendChild(a); //text2=A
		}
		if (grades[i]>=perc9 && grades[i]<perc8){
			var a = document.createTextNode("★");
			t9.appendChild(a); //text2=A
		}
		if (grades[i]>=perc10 && grades[i]<perc9){
			var a = document.createTextNode("★");
			t10.appendChild(a); //text2=A
		}
		if (grades[i]>=perc11 && grades[i]<perc10){
			var a = document.createTextNode("★");
			t11.appendChild(a); //text2=A
		}
	}


}
