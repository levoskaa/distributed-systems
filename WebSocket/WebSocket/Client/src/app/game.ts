class Game {
    private webSocket = new WebSocket("ws://ws.ifelse.io/");

    constructor() {
        this.webSocket.onmessage = e => {
            const p = document.createElement("p");
            p.innerText = e.data;
            document.body.appendChild(p);
        }
        this.webSocket.onopen = () => this.webSocket.send("Hello, W9HL9H!");
    }
}

window.onload = () => {
    new Game();
}