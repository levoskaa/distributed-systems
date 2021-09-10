"use strict";
class Game {
    constructor() {
        this.webSocket = new WebSocket("ws://localhost:8377/Design_Time_Addresses/G/");
        this.webSocket.onmessage = e => {
            const p = document.createElement("p");
            p.innerText = e.data;
            document.body.appendChild(p);
        };
        this.webSocket.onopen = () => this.webSocket.send("Hello, W9HL9H!");
    }
}
window.onload = () => {
    new Game();
};
