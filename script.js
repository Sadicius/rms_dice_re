let dadoActivo = 'dice'; // Este valor se actualiza cuando se elige un dado específico
let flippeddice1 = false;
let diceNumber = Math.floor((Math.random() * 6) + 1); // Generar un número aleatorio de 1 a 6

// Evento de tecla Esc para cerrar la interfaz
document.onkeyup = function (event) {
    if (event.key === "Escape") {
        closeDice();
    }
};

$(document).on('rms_dice:Client:UseDice', function (event, diceNumber) {
    flipDice(diceNumber);
});

// Función para iniciar la animación del dado automáticamente
function flipDice(diceNumber) {
    const cube = document.querySelector('.cube');
    const time = 2;

    cube.style.transition = '';
    cube.style.transform = `translateY(400px) rotateX(0deg) rotateY(0deg) rotateZ(0deg)`;

    // Mostrar el elemento HTML después de configurar la animación
    const elementoHTML = document.getElementById('miElementoHTML');
    elementoHTML.style.display = 'block';
    setTimeout(() => {
        elementoHTML.style.display = 'none'; // Ocultar después de 5 segundos
    }, 5000); // 5000 milisegundos (5 segundos)

    // Obtener un número aleatorio para el dado

    //const diceNumber = Math.floor((Math.random() * 6) + 1); // Generar un número aleatorio de 1 a 6
    console.log(`diceNumber: ${diceNumber}`);

    setTimeout(() => {
        cube.style.transition = `transform ${time}s`;
        
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

        // Enviar el número del dado al servidor
        $.post('https://rms_dice/NumerodadoActivo', JSON.stringify({
            DadoActivo: dadoActivo,
            DiceNumber: diceNumber,
        }));

    }, time * 1000); // Multiplicar por 1000 para obtener milisegundos

}

// Llama a la función para iniciar la animación del dado automáticamente cuando se carga el documento
document.addEventListener("DOMContentLoaded", function () {
// Puedes eliminar esta llamada si no deseas que la animación se inicie automáticamente al cargar la página
    // flipDice();
});

// Función para cerrar la interfaz
function closeDice() {
    $.post('https://rms_dice/CloseNui');
}

/* 
// Evento para recibir mensajes del servidor
addEventListener("message", function (event) {
    let item = event.data;
    
    if (item.open && item.class === "choose") {
        dadoActivo = item.data;
    }
});

// Función para cerrar la interfaz
function closeDice() {
    $.post('https://rms_dice/CloseNui');
}

// Evento personalizado para iniciar la animación del dado desde Lua
window.addEventListener('FlipDice', function () {
    flipDice();
});

// Función para iniciar la animación del dado automáticamente
function flipDice() {
    const cube = document.querySelector('.cube');
    const time = 2;

    cube.style.transition = '';
    cube.style.transform = `translateY(400px) rotateX(0deg) rotateY(0deg) rotateZ(0deg)`;

    setTimeout(() => {
        cube.style.transition = `transform ${time}s`;
        const diceNumber = Math.floor((Math.random() * 6) + 1); // Generar un número aleatorio de 1 a 6

        console.log(`diceNumber: ${diceNumber}`);

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

        // Marcar que el dado ha sido volteado
        flippeddice1 = true;

        // Enviar el número del dado al servidor
        $.post('https://rms_dice/NumerodadoActivo', JSON.stringify({
            DadoActivo: dadoActivo,
        })); 

    }, time * 1000); // Multiplicar por 1000 para obtener milisegundos
}

// Llama a la función para iniciar la animación del dado automáticamente cuando se carga el documento
document.addEventListener("DOMContentLoaded", function () {
    flipDice();
});*/
