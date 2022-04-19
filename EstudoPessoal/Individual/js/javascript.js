    function dark_mode() {
        body_style.className = 'dark';
    }
    function light_mode(){
        body_style.className = 'light';
    }

function tema(){
    var checkbox = input_mode.value;
    if(checkbox == 0){
        dark_mode();
        
    }else {
        light_mode();

    }
    alert(input_mode.value);
    
    console.log(input_mode.value);
}