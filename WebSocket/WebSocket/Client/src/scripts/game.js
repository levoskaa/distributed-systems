"use strict";
class Game {
    constructor(canvas) {
        this.canvas = canvas;
        this.webSocket = new WebSocket("ws://localhost:8377/Design_Time_Addresses/G/");
        this.onMessage = (event) => {
            const ctx = this.canvas.getContext("2d");
            if (!ctx) {
                return;
            }
            const game = JSON.parse(event.data);
            ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
            ctx.fillStyle = "#3355FF";
            ctx.strokeStyle = "#000080";
            for (const p of game.Spaceships) {
                this.drawCircle(ctx, p.Position, 1);
            }
            ctx.fillStyle = "#aaaaaa";
            ctx.strokeStyle = "#333333";
            for (const p of game.Asteroids) {
                this.drawCircle(ctx, p.Position, p.R);
            }
        };
        const ctx = this.canvas.getContext("2d");
        if (ctx) {
            ctx.scale(5, 5);
        }
        this.webSocket.onmessage = this.onMessage;
    }
    drawCircle(context, position, radius) {
        context.beginPath();
        context.arc(position.X, position.Y, radius, 0, 2 * Math.PI);
        context.fill();
        context.lineWidth = radius / 4;
        context.stroke();
    }
}
window.onload = () => {
    new Game(document.getElementById("canvas"));
};
