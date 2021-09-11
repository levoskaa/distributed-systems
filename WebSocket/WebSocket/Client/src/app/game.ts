interface Point {
    X: number;
    Y: number;
}

interface Vector {
    X: number;
    Y: number;
    Length: number;
}

interface Spaceship {
    Position: Point;
    Speed: Vector;
}

interface Missile {
    Position: Point;
    Speed: Vector;
}

interface Asteroid {
    Position: Point;
    R: number;
}

interface GameState {
    Spaceships: Spaceship[];
    Missiles: Missile[];
    Asteroids: Asteroid[];
}

class Game {
    private readonly webSocket = new WebSocket("ws://localhost:8377/Design_Time_Addresses/G/");

    private left: boolean;
    private up: boolean;
    private right: boolean;
    private down: boolean;

    private game: GameState;
    private gameFrameTime: number;
    private extraTime: number;
    private requestAnimationFrameId: any;

    constructor(private readonly canvas: HTMLCanvasElement) {
        const ctx = this.canvas.getContext("2d");
        if (ctx) {
            ctx.scale(5, 5);
        }
        this.webSocket.onmessage = e => this.onMessage(e);
        window.onkeydown = e => this.onKey(e, true);
        window.onkeyup = e => this.onKey(e, false);
    }

    private onMessage(event: MessageEvent): void {
        this.game = JSON.parse(event.data);
        this.gameFrameTime = 0;
        if (!this.requestAnimationFrameId) {
            this.requestAnimationFrameId = requestAnimationFrame((time) => this.draw(time));
        }
    }

    private extrapolate(position: Point, speed: Vector): Point {
        return { X: position.X + speed.X * this.extraTime, Y: position.Y + speed.Y * this.extraTime };
    }

    private draw(time: number): void {
        if (!this.gameFrameTime) {
            this.gameFrameTime = time;
        }
        this.extraTime = (time - this.gameFrameTime) * 0.01;
        const ctx = this.canvas.getContext("2d");
        if (!ctx) {
            return;
        }
        ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        // Draw spaceships
        ctx.fillStyle = "#3355FF";
        ctx.strokeStyle = "#000080";
        for (const spaceship of this.game.Spaceships) {
            this.drawCircle(ctx, this.extrapolate(spaceship.Position, spaceship.Speed), 1);
        }
        // Draw asteroids
        ctx.fillStyle = "#aaaaaa";
        ctx.strokeStyle = "#333333";
        for (const asteroid of this.game.Asteroids) {
            this.drawCircle(ctx, asteroid.Position, asteroid.R);
        }
        // Draw missiles
        ctx.fillStyle = "#ff8080";
        ctx.strokeStyle = "#990000";
        for (const missile of this.game.Missiles) {
            this.drawCircle(ctx, this.extrapolate(missile.Position, missile.Speed), 0.5);
        }
        requestAnimationFrame(time => this.draw(time));
    }

    private drawCircle(context: CanvasRenderingContext2D, position: Point, radius: number): void {
        context.beginPath();
        context.arc(position.X, position.Y, radius, 0, 2 * Math.PI);
        context.fill();
        context.lineWidth = radius / 4;
        context.stroke();
    }

    private onKey(event: KeyboardEvent, pressed: boolean) {

        if (event.keyCode === 37) { // left arrow
            this.left = pressed;
        } else if (event.keyCode === 38) { // up arrow
            this.up = pressed;
        } else if (event.keyCode === 39) { // right arrow
            this.right = pressed;
        } else if (event.keyCode === 40) { // down arrow
            this.down = pressed;
        }
        this.webSocket.send(JSON.stringify({
            Name: "Leo",
            Acceleration: {
                X: (this.left ? -1 : 0) + (this.right ? 1 : 0),
                Y: (this.up ? -1 : 0) + (this.down ? 1 : 0)
            },
            // space
            Shoot: event.keyCode === 32 && pressed
        }));
    }
}

window.onload = () => {
    new Game(document.getElementById("canvas") as HTMLCanvasElement);
}