/// @description Check if the message is too long

//Temporary variables
var i = 0;

//Iterate through all the text
for (i=1; i<=string_length(text); i++) {
	
	//If the height of the text is greater than 64 pixels
	if (string_height(string_copy(text, 1, min(i+1, string_length(text)))) > 64) {
			
		//Split off the lines after the new line to be displayed later
        new_text = string_copy(text, i+1, string_length(text)-i);
        text = string_copy(text, 1, i);
		
		//Break out of the loop
        break;
    }
}

//Set the number of characters being displayed
a = 0;

//Set the alarm for playing sound effects
alarm[2] = 1;