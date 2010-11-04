//######################################################################################
// Author: ricocheting.com
// For: public release (freeware)
// Date: 4/24/2003 (update: 6/26/2009)
// Description: displays the amount of time until the "dateFuture" entered below.
 
 
// NOTE: the month entered must be one less than current month. ie; 0=January, 11=December
// NOTE: the hour is in 24 hour format. 0=12am, 15=3pm etc
// format: dateFuture = new Date(year,month-1,day,hour,min,sec)
// example: dateFuture = new Date(2003,03,26,14,15,00) = April 26, 2003 - 2:15:00 pm
 
dateFuture = new Date(2011,0,14,19,0,0);
 
// TESTING: comment out the line below to print out the "dateFuture" for testing purposes
//document.write(dateFuture +"<br />");
 
 
//###################################
//nothing beyond this point
function GetCount(){
 
	dateNow = new Date();									//grab current date
	amount = dateFuture.getTime() - dateNow.getTime();		//calc milliseconds between dates
	delete dateNow;
 
	// time is already past
	if(amount < 0){
		document.getElementById('countbox').innerHTML="JDC West 2011 has Begun!";
	}
	// date is still good
	else{
		days=0;hours=0;mins=0;secs=0;out="";
 
		amount = Math.floor(amount/1000);//kill the "milliseconds" so just secs
 
		days=Math.floor(amount/86400);//days
		amount=amount%86400;
 
		hours=Math.floor(amount/3600);//hours
		amount=amount%3600;
 
		mins=Math.floor(amount/60);//minutes
		amount=amount%60;
 
		secs=Math.floor(amount);//seconds
    
    /*
		if(days != 0){out += days +" day"+((days!=1)?"s":"")+", ";}
		if(days != 0 || hours != 0){out += hours +" hour"+((hours!=1)?"s":"")+", ";}
		if(days != 0 || hours != 0 || mins != 0){out += mins +" minute"+((mins!=1)?"s":"")+", ";}
		out += secs +" seconds";
		document.getElementById('countbox').innerHTML=out;
    */
    
    if(days != 0){daysStr = days +" Day"+((days!=1)?"s":"");}
    if(days != 0 || hours != 0){hoursStr = hours +" Hour"+((hours!=1)?"s":"");}
		if(days != 0 || hours != 0 || mins != 0){minsStr = mins +" Minute"+((mins!=1)?"s":"");}
		secsStr = secs +" Seconds";
    
    document.getElementById('countDays').innerHTML = days;
    document.getElementById('countHours').innerHTML = hours;
    document.getElementById('countMinutes').innerHTML = mins;
    document.getElementById('countSeconds').innerHTML = secs;
 
		setTimeout("GetCount()", 1000);
	}
}
 
window.onload=GetCount;//call when everything has loaded