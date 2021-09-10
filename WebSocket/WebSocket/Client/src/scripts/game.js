"use strict";
class Game {
    constructor() {
        this.webSocket = new WebSocket("ws://localhost:8377/Design_Time_Addresses/G/");
        this.webSocket.onmessage = () => { };
        this.webSocket.onopen = () => this.webSocket.send("Hello, W9HL9H!");
    }
}
window.onload = () => {
    new Game();
};
