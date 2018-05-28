document.addEventListener("DOMContentLoaded", function(){
    var canvas = document.getElementById('myCanvas'); // in your HTML this element appears as <canvas id="myCanvas"></canvas>
    var ctx = canvas.getContext('2d');

    // ctx.fillStyle = 'red'
    // ctx.fillRect(10, 10, 55, 50);

    ctx.beginPath();
    ctx.arc(50,50,30,0,2*Math.PI, false)
    ctx.strokeStyle = 'red';
    ctx.lineWidth = 4;
    ctx.stroke();
    ctx.fillStyle = 'blue';
    ctx.fill();
});
