var diceNumber = Math.floor((Math.random() * 6)+ 1);
        
// Llama a la función para iniciar la animación del dado automáticamente cuando se carga el documento
window.addEventListener('message', function(event) {
    
    if (event.data.show == true) {
        // Función para enviar datos al servidor
            
        flipDice(diceNumber);
        console.log("diceNumber - flipDice");

        // Mostrar el elemento HTML después de configurar la animación
        const elementoHTML = document.getElementById('miElementoHTML');
        elementoHTML.style.display = 'block';
        setTimeout(() => {
            elementoHTML.style.display = 'none'; // Ocultar después de 5 segundos
        }, 5000); // 5000 milisegundos (5 segundos)

        $('body').css('display', 'block');
    } else if (event.data.show == false) {
        $('body').css('display', 'none');
    }
});

// Función para iniciar la animación del dado automáticamente
function flipDice(diceNumber) {
    const cube = document.querySelector('.cube');
    const time = 2;
    var diceNumber = diceNumber
    cube.style.transition = '';
    cube.style.transform = `translateY(400px) rotateX(0deg) rotateY(0deg) rotateZ(0deg)`;
    
    setTimeout(() => {
        cube.style.transition = `transform ${time}s`;
        console.log(diceNumber); 
        switch (diceNumber) {
            case 1:
                cube.style.transform = `translateY(400px) rotateX(3600deg) rotateY(3600deg) rotateZ(3600deg)`;
                break;
            case 2:
                cube.style.transform = `translateY(400px) rotateX(4410deg) rotateY(3600deg) rotateZ(3600deg)`;
                break;
            case 3:
                cube.style.transform = `translateY(400px) rotateX(3600deg) rotateY(4410deg) rotateZ(3600deg)`;
                break;
            case 4:
                cube.style.transform = `translateY(400px) rotateX(3600deg) rotateY(2430deg) rotateZ(3600deg)`;
                break;
            case 5:
                cube.style.transform = `translateY(400px) rotateX(2430deg) rotateY(3600deg) rotateZ(3600deg)`;
                break;
            case 6:
                cube.style.transform = `translateY(400px) rotateX(3600deg) rotateY(1980deg) rotateZ(3600deg)`;
                break;
        };

        // Cierra la interfaz después de 5 segundos
        setTimeout(() => {
            closeDice();
            //console.log("closeDice on");
        }, 3000);

    }, time * 1000); // Multiplicar por 1000 para obtener milisegundos
}

// Función para cerrar la interfaz
function closeDice() {
    $.post('https://rms_dice_re/CloseNui');
}

// Evento de tecla "Esc" para cerrar la interfaz
document.addEventListener('keyup', function(event) {
    if (event.key === 'Escape' || event.keyCode === 27) {
        closeDice();
    }
});


